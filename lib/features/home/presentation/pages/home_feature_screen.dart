import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plants_app/features/home/presentation/bloc/home_bloc.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Home Feature Screen')),
      body: Column(
        children: [
          BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
  print("STATE: $state");
              if (state is PlantLoadedHomeState) {
                context.push(
                  '/details',
                  extra: state.plant,
                );
              }

              if (state is ErrorHomeState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failure.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is LoadingHomeState) {
                return Center(child: const CircularProgressIndicator());
              }

              return Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      // onPressed: () async {
                      //   final picker = ImagePicker();
                      //   final image = await picker.pickImage(source: ImageSource.camera);
                      //   context.read<HomeBloc>().add(ScanPlant(image!.path));
                      // },
                      onPressed: () async {
                      print("Button Pressed");
                        final picker = ImagePicker();
                        final image = await picker.pickImage(
                          source: ImageSource.camera,
                        );
                    
                        if (image == null) return;
                    
                        context.read<HomeBloc>().add(ScanPlant(image.path));
                      },
                      child: const Text('Go'),
                    ),
                    // ListView.builder(itemBuilder: 
                    //   ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


// BlocConsumer<HomeBloc, HomeState>(
//   listener: (context, state) {
//     if (state is PlantLoadedHomeState) {
//       
//       context.push(
//         '/details',
//         extra: state.plant,
//       );
//     }

//     if (state is ErrorHomeState) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(state.failure.message)),
//       );
//     }
//   },
//   builder: (context, state) {
//     if (state is LoadingHomeState) {
//       return const CircularProgressIndicator();
//     }

//     return ElevatedButton(
//       onPressed: () async {
//         final picker = ImagePicker();
//         final image = await picker.pickImage(
//           source: ImageSource.camera,
//         );

//         if (image == null) return;

//         context.read<HomeBloc>().add(ScanPlant(image.path));
//       },
//       child: const Text('Scan Plant'),
//     );
//   },
// )