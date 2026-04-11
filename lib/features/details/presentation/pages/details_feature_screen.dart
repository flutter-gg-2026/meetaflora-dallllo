import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/features/details/presentation/cubit/details_cubit.dart';
import 'package:plants_app/features/details/presentation/cubit/details_state.dart';
import 'package:plants_app/features/home/domain/entities/home_entity.dart';

class DetailsFeatureScreen extends StatelessWidget {
  final HomeEntity extra;
  const DetailsFeatureScreen({super.key, required this.extra});
  // @override
  // State<DetailsFeatureScreen> createState() => _DetailsFeatureScreenState();

// class _DetailsFeatureScreenState extends State<DetailsFeatureScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<DetailsCubit>().getDetailsMethod(widget.extra.name);
  // }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(title: const Text("Plant Details")),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsInitialState) {
            return Scaffold(body: const Center(child: CircularProgressIndicator()));
          }

          if (state is DetailsSuccessState) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.data.name,
                        style: const TextStyle(fontSize: 22)),
                    const SizedBox(height: 10),
                    Text(
                      state.data.description,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is DetailsErrorState) {
            return Scaffold(body: Center(child: Text(state.message)));
          }

          return const SizedBox();
        },
      ),
    );
  }

}


    // return BlocBuilder<DetailsCubit, DetailsState>(
    //   builder: (context, state) {
    //      if (state is DetailsInitialState) {
    //   return const Center(child: Text("Start loading..."));
    // }

    // if (state is DetailsSuccessState) {
    //   return Center(child: Text("${state.data.name}: ${state.data.description}"));
    // }

    // if (state is DetailsErrorState) {
    //   return Center(child: Text(state.message));
    // }

    