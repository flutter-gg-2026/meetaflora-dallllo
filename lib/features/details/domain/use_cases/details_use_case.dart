import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plants_app/core/errors/failure.dart';
import 'package:plants_app/features/details/domain/entities/details_entity.dart';
import 'package:plants_app/features/details/domain/repositories/details_repository_domain.dart';


@lazySingleton
class DetailsUseCase {
  final DetailsRepositoryDomain _repositoryData;

  DetailsUseCase(this._repositoryData);

   Future<Either<Failure, DetailsEntity>> getDetails(String name) async {
    return _repositoryData.getDetails(name);
  }
}
