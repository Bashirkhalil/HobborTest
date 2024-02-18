
import 'package:get_it/get_it.dart';
import 'package:test_functionality/view/bloc/new_bloc.dart';

import 'controller/user_controller.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

Future<void> init() async {

  // register controller - Bloc
  registerBloc();

}

void registerBloc() {

  //  user bloc - user controller
  sl.registerFactory<UserController>(() => UserController());
  sl.registerLazySingleton<UserBloc>(() => UserBloc(mUserController: sl()));

}

