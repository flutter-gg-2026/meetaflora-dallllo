import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String name;
  final String imageUrl;

  const HomeEntity({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];
}
