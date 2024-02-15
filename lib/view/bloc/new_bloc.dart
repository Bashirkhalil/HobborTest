import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_functionality/controller/user_controller.dart';
import 'package:test_functionality/view/bloc/user_state.dart';

import 'news_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserController mUserController = UserController();


  void emitLoading() => emit(UserLoadingState());
  void emitError({required String error}) => emit(UserErrorState(onError: error));

  bool initState = true;

  UserBloc() : super(UserInitial()) {

    // getEvent
    on<GetUserEvent>((event, emit) async {
      try {
        emit(UserLoadingState());
        var result = await mUserController.fetchNews(event.email);
        emit(UserSuccessState(userList: result));
      } catch (e) {
        emit(UserErrorState(onError: "Error occur -> $e"));
      }
    });

    // updateEvent
    on<UpdateUserEvent>((event, emit) async {
      try{
        emit(UserLoadingState());
        var result =  await mUserController.updateUser(event.user);

        emit(UserUpdatedSuccessState(msg: result));

      }catch(e){
        emit(UserErrorState(onError: "Error occur -> $e"));
      }
    });

    // delete Event
    on<DeleteUserEvent>((event, emit) async {
      try{
        emit(UserLoadingState());
        var result =  await mUserController.deleteUser(event.user);

        emit(UserDeletedSuccessState(msg: result));

      }catch(e){
        emit(UserErrorState(onError: "Error occur -> $e"));
      }
    });

    // new user (create user )
    on<NewUserEvent>((event, emit) async {
      try{
        emit(UserLoadingState());
        var result =  await mUserController.newUser(event.user);

        print("result ${result}");
        emit(UserCreateSuccessState(msg: result));

      }catch(e){
        emit(UserErrorState(onError: "Error occur -> $e"));
      }
    });


  }

}
