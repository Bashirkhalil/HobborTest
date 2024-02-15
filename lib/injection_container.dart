import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:test_functionality/view/bloc/new_bloc.dart';

import 'controller/user_controller.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

Future<void> init() async {

  // register controller
  registerController();


  // Bloc
  registerBloc();

}


// Register blocs
void registerBloc() {
//  GetIt.I.registerLazySingleton<UserBloc>(() => UserBloc());
}


// Register repositories
void registerController() {
 //sl.registerLazySingleton<UserController>(() => UserController());
}



