import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(selectedIndex: 1)) {
    on<ChangeBottomNavEvent>((event, emit) {
      emit(BottomNavState(selectedIndex: event.newIndex));
    });
  }
}
