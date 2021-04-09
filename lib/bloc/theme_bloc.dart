import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profoundgodlibrary/models/theme.dart';

enum ThemeEvent {change_theme}

class ThemeBloc extends Bloc<ThemeEvent, Map<ThemedComponent, dynamic>>{

  ThemeBloc() : super(Theme().light);

  @override
  Stream<Map<ThemedComponent, dynamic>> mapEventToState(ThemeEvent event) async* {
    switch(event){
      case ThemeEvent.change_theme:
        Map<ThemedComponent, dynamic> newState = state == Theme().light ? Theme().dark : Theme().light;
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');
    }
  }

}