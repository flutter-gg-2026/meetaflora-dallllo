import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// import 'package:plants_app/features/home/di/home_di.dart';
// import 'package:plants_app/features/details/di/details_di.dart';

import 'configure_dependencies.config.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib'],
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  // print("🔵 BEFORE INIT");

  getIt.init();

  // print("🟢 AFTER INIT");
}
