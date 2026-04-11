import 'package:equatable/equatable.dart';

class DetailsEntity extends Equatable {
  final String name;
  final String description;

  const DetailsEntity({
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [name, description];
}
