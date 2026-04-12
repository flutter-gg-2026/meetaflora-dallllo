import 'package:fpdart/fpdart.dart';
import 'package:plants_app/core/errors/failure.dart';
import 'package:plants_app/features/details/domain/entities/details_entity.dart';
import 'package:plants_app/features/home/domain/entities/home_entity.dart';

abstract class HomeRepositoryDomain {
  Future<Either<Failure, HomeEntity>> identifyPlant(String path);
  Future<Either<Failure, DetailsEntity>> getDetails(String name);
}
