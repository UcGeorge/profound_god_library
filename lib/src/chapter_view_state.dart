import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/k_state.dart';

class ChapterViewState extends KState {
  final Readable? readable;
  final String? startChapterName;

  ChapterViewState(this.readable, this.startChapterName);
  ChapterViewState.nullState()
      : readable = null,
        startChapterName = null,
        super.nullState();
}
