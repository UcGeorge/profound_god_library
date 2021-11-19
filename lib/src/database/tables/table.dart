import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:profoundgodlibrary/src/LocalStorage.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/interfaces/jsonifiable.dart';
import 'package:provider/src/provider.dart';
import 'package:profoundgodlibrary/src/interfaces/types.dart';

abstract class Schema<T> {
  BuildContext context;

  final String schemaID;
  late DatabaseTable jsonData;
  Map<String, T> data = {};

  Schema(this.schemaID, this.context) {
    _initializeSchema();
    initializeData();
  }

  void initializeData();

  Map<String, dynamic> toJson() => {
        "$schemaID": data,
      };

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  void _initializeSchema() {
    try {
      print('StateData: ${context.read<LocalStorage>().stateData}');
      if (!context.read<LocalStorage>().stateData.containsKey(schemaID)) {
        context.read<LocalStorage>().stateData[schemaID] = <String, dynamic>{};
        print(
            'database doesn\'t contain $schemaID\nStateData: ${context.read<LocalStorage>().stateData}');
      }

      jsonData = context.read<LocalStorage>().stateData[schemaID]!;
    } catch (ex) {
      print('Something is wromg with the statedata');
    }
  }

  void update(BuildContext context, String id, T data) {
    try {
      this.data.update(id, (value) => data);
      context.read<LocalStorage>().stateData[schemaID][id] =
          (data as Jsonifiable).toJson()[id];
      context.read<Database>().updateView();
    } catch (e) {
      insert(context, id, data);
    }
  }

  void insert(BuildContext context, String id, T data) {
    print('[INFO] Inserting data with ID: $id');
    this.data.putIfAbsent(id, () => data);
    context.read<LocalStorage>().stateData[schemaID][id] =
        (data as Jsonifiable).toJson()[id];
    context.read<Database>().updateView();
  }

  void delete(BuildContext context, String id) {
    this.data.remove(id);
    (context.read<LocalStorage>().stateData[schemaID] as Map<String, dynamic>)
        .remove(id);
    context.read<Database>().updateView();
  }

  Map<String, T> select(bool where(T element)) {
    Map<String, T> result = {};
    data.forEach((key, value) {
      if (where(value)) result.putIfAbsent(key, () => value);
    });
    return result;
  }

  bool contains(bool condition(T element)) {
    for (String m in data.keys) if (condition(data[m]!)) return true;
    return false;
  }
}
