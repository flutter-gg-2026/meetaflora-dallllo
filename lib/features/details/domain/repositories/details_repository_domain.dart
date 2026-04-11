import 'package:fpdart/fpdart.dart';
import 'package:plants_app/core/errors/failure.dart';
import 'package:plants_app/features/details/domain/entities/details_entity.dart';

abstract class DetailsRepositoryDomain {
    Future<Either<Failure, DetailsEntity>> getDetails(String name);
}
