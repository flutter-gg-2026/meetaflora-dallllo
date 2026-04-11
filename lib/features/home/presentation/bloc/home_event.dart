part of 'home_bloc.dart';

// @freezed
// class HomeEvent with _$HomeEvent {
//   const factory HomeEvent.started() = _Started;
// }

 abstract class HomeEvent {}

class ScanPlant extends HomeEvent {
  final String path;
  ScanPlant(this.path);
}

class LoadDetails extends HomeEvent {
  final String name;
  LoadDetails(this.name);
}