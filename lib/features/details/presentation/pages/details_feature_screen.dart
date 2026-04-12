
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/features/details/presentation/cubit/details_cubit.dart';
import 'package:plants_app/features/details/presentation/cubit/details_state.dart';
import 'package:plants_app/features/home/domain/entities/home_entity.dart';

class DetailsFeatureScreen extends StatelessWidget {
  final HomeEntity extra;
  const DetailsFeatureScreen({super.key, required this.extra});
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(title: Center(child: Text("Plant Details"))),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsInitialState) {
            return  Center(child: CircularProgressIndicator());
          }

          if (state is DetailsSuccessState) {
            return SingleChildScrollView(
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                Icon(Icons.error_outline, size: 100,),
                      SizedBox(height: 20),
                      Text(state.data.name,
                          style: TextStyle(fontSize: 22)),
                       SizedBox(height: 10),
                      Text(
                        state.data.description,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
            );
          }

          if (state is DetailsErrorState) {
            return Scaffold(body: Center(child: Column(
              children: [
                SizedBox(height: 10),
                Text(state.message),
              ],
            )));
          }
          return SizedBox();
        },
      ),
    );
  }
}
