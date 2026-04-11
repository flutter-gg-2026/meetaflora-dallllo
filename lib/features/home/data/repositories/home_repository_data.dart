import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plants_app/core/errors/network_exceptions.dart';
import 'package:plants_app/core/errors/failure.dart';
import 'package:plants_app/features/details/data/models/details_model.dart';
import 'package:plants_app/features/details/domain/entities/details_entity.dart';
import 'package:plants_app/features/home/domain/entities/home_entity.dart';
import 'package:plants_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plants_app/features/home/data/models/home_model.dart';
import 'package:plants_app/features/home/domain/repositories/home_repository_domain.dart';

@LazySingleton(as: HomeRepositoryDomain)
class HomeRepositoryData implements HomeRepositoryDomain{
  final BaseHomeRemoteDataSource remoteDataSource;


  HomeRepositoryData(this.remoteDataSource);

@override
//.......تعديلاتي 
  Future<Either<Failure, HomeEntity>> identifyPlant(String path) async {
    try {
      final response = await remoteDataSource.getHomeIdentify(path);
      return Right(response.toEntity());
    } catch (error) {
      return Left(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Either<Failure, DetailsEntity>> getDetails(String name) async {
    try {
      final result = await remoteDataSource.getDetails(name);
      return Right(result.toEntity());
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

}

//   extension DetailsModelMapper on DetailsModel {
//   DetailsEntity toEntity() {
//     return DetailsEntity(
//       name: name,
//       description: description,
//     );
//   }
// }
