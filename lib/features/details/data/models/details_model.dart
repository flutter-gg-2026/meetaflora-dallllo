import 'package:plants_app/features/details/domain/entities/details_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_model.freezed.dart';
part 'details_model.g.dart';

@freezed
abstract class DetailsModel with _$DetailsModel {
  const factory DetailsModel({
    required String name,
    required String description,
    
  }) = _DetailsModel;

  factory DetailsModel.fromJson(Map<String, Object?> json) => _$DetailsModelFromJson(json);
}



extension DetailsModelMapper on DetailsModel {
  DetailsEntity toEntity() {
    return DetailsEntity(name: name, description: description);
  }
  }
