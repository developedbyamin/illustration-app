part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent {}

class ChangeBottomNavEvent extends BottomNavEvent {
  final int newIndex;

  ChangeBottomNavEvent(this.newIndex);
}