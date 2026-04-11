part of 'home_bloc.dart';

// @freezed
// class HomeState with _$HomeState {
//   const factory HomeState.initial() = _Initial;
// }

abstract class HomeState {}

class InitialHomeState extends HomeState {}
class LoadingHomeState extends HomeState {}

class PlantLoadedHomeState extends HomeState {
  final HomeEntity plant;
  PlantLoadedHomeState(this.plant);
}

class DetailsLoadedHomeState extends HomeState {
  final DetailsEntity details;
  DetailsLoadedHomeState(this.details);
}

class ErrorHomeState extends HomeState {
  final Failure failure;
  ErrorHomeState(this.failure);
}