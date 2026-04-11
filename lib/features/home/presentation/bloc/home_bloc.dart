// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plants_app/core/errors/failure.dart';
import 'package:plants_app/features/details/domain/entities/details_entity.dart';
// import 'package:plants_app/features/home/data/models/home_model.dart';
import 'package:plants_app/features/home/domain/entities/home_entity.dart';
import 'package:plants_app/features/home/domain/use_cases/home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';
// part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeIdentifyPlantUseCase identify;
  final HomeGetPlantDetailsUseCase details;

  HomeBloc(this.identify, this.details) : super(InitialHomeState()) {

    on<ScanPlant>((event, emit) async {
  // print("ScanPlant triggered");
      emit(LoadingHomeState());

      final result = await identify.getHomeIdentifyPlant((event.path));

      result.match(
        (l) => emit(ErrorHomeState(l)),
        (r) => emit(PlantLoadedHomeState(r)),
      );
    });

    on<LoadDetails>((event, emit) async {
      emit(LoadingHomeState());

      final result = await details.getHomeDetailsPlant(event.name);

      result.match(
        (l) => emit(ErrorHomeState(l)),
        (r) => emit(DetailsLoadedHomeState(r)),
      );
    });
  }
}
