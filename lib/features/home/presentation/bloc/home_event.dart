part of 'home_bloc.dart';


 abstract class HomeEvent {}

class ScanPlant extends HomeEvent {
  final String path;
  ScanPlant(this.path);
}

class LoadDetails extends HomeEvent {
  final String name;
  LoadDetails(this.name);
}
class PickImagesEvent extends HomeEvent {}
