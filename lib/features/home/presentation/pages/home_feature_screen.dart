import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plants_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:plants_app/features/home/presentation/widgets/container_items.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Home Feature Screen'))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is PlantLoadedHomeState) {
                  context.push('/details', extra: state.plant);
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

                return SingleChildScrollView(
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 600,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final image = await picker.pickImage(
                                source: ImageSource.camera,
                                imageQuality: 50,
                              );
                              if (image == null) return;
                              context.read<HomeBloc>().add(
                                ScanPlant(image.path),
                              );
                            },
                            child: const Text('Go to Camera'),
                          ),
                          ElevatedButton(
                            onPressed: () => context.read<HomeBloc>().add(
                              PickImagesEvent(),
                            ),
                            child: const Text('Select 6 Images'),
                          ),
                          const SizedBox(height: 10),

                      
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                if (state is HomeStateImageSelected) {
                                  if (state.selectedImages.isEmpty) {
                                    return const Center(
                                      child: Text("No images selected yet"),
                                    );
                                  }
                                  return GridView.builder(
                                    padding: const EdgeInsets.all(10),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                        ),
                                    itemCount: state.selectedImages.length,
                                    itemBuilder: (context, index) {
                                      final path = state.selectedImages[index];
                                      return ContainerItems(
                                        imageUrl: path,
                                        onTap: () {
                                          context.read<HomeBloc>().add( ScanPlant(path),);
                                        },
                                      );
                                    },
                                  );
                                }
                                return const Center(
                                  child: Text("Select images to display"),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
