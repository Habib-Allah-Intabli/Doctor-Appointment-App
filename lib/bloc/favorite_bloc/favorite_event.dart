part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

class InitializeFavoriteList extends FavoriteEvent {}

class ToggleFavorite extends FavoriteEvent {
  final DoctorsModel doctors;

  ToggleFavorite({required this.doctors, });
}
