part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class ChangePageEvent extends HomeEvent{
  final int index;

  ChangePageEvent(this.index);
}
