import 'package:equatable/equatable.dart';
import 'package:plants_app/features/details/domain/entities/details_entity.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object?> get props => [];
}

class DetailsInitialState extends DetailsState {

}

class DetailsSuccessState extends DetailsState {
  final DetailsEntity data;
  const DetailsSuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class DetailsErrorState extends DetailsState {
  final String message;
  const DetailsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

