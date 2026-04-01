part of 'favorite_bloc.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<DoctorsModel> doctors;

  FavoriteLoaded({required this.doctors});
}