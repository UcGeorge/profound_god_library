import 'package:flutter/cupertino.dart';
import 'package:profoundgodlibrary/src/LocalStorage.dart';
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
    return toJson().toString();
  }

  void _initializeSchema() {
    try {
      print('StateData: ${context.read<LocalStorage>().stateData}');
      if (!context.read<LocalStorage>().stateData.containsKey(schemaID)) {
        context.read<LocalStorage>().stateData[schemaID] = {};
        print(
            'database doesn\'t contain $schemaID\nStateData: ${context.read<LocalStorage>().stateData}');
      }

      jsonData = context.read<LocalStorage>().stateData[schemaID]!;
    } catch (ex) {
      print('Something is wromg with the statedata');
    }
  }

  void update(String id, T data) {
    this.data[id] = data;
    context.read<LocalStorage>().stateData[schemaID]![id] =
        (data as Jsonifiable).toJson();
  }

  void insert(String id, T data) {
    this.data[id] = data;
    context.read<LocalStorage>().stateData[schemaID]![id] =
        (data as Jsonifiable).toJson();
  }
}
