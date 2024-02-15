import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:test_functionality/view/cubit/user_cubit.dart';

import 'controller/user_controller.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

Future<void> init() async {

  //Repositories
  registerController();


  // Bloc
  registerBloc();

  // register controller
  registerController();

}


// Register blocs
void registerBloc() {
  sl.registerSingleton<NewsCubit>(NewsCubit(mNewController: sl()));
}


// Register repositories
void registerController() {
 sl.registerLazySingleton<NewController>(() => NewController());
}



