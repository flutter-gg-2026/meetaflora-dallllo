
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plants_app/core/errors/network_exceptions.dart';
import 'package:plants_app/core/errors/failure.dart';
import 'package:plants_app/features/details/domain/entities/details_entity.dart';

import 'package:plants_app/features/details/data/datasources/details_remote_data_source.dart';
import 'package:plants_app/features/details/data/models/details_model.dart';
import 'package:plants_app/features/details/domain/repositories/details_repository_domain.dart';

@LazySingleton(as: DetailsRepositoryDomain)
class DetailsRepositoryData implements DetailsRepositoryDomain{
  final BaseDetailsRemoteDataSource remoteDataSource;


  DetailsRepositoryData(this.remoteDataSource);

@override
  Future<Either<Failure,DetailsEntity>> getDetails(String name) async {
    try {
      final response = await remoteDataSource.getDetails(name);
      return Right(response.toEntity());
    } catch (error) {
      return Left(FailureExceptions.getException(error));
    }
  }
}
