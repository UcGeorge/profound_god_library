import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/k_state.dart';

class DetailsPlaneState extends KState {
  final Readable? readable;

  DetailsPlaneState(this.readable);
  DetailsPlaneState.nullState()
      : readable = null,
        super.nullState();
}
