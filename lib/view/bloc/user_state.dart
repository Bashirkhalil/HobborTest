import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:test_functionality/model/user_article.dart';

@immutable
abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserErrorState extends UserState {
  final String onError;

  UserErrorState({required this.onError});

  @override
  List<Object?> get props => [onError];
}

//  user List success
//------------------------------------------------------------
class UserSuccessState extends UserState {
  List<User> userList = [];

  UserSuccessState({required this.userList});

  @override
  List<Object?> get props => [userList];
}

//  user Delete success
//------------------------------------------------------------
class UserDeletedSuccessState extends UserState {
  final String msg;

  UserDeletedSuccessState({required this.msg});

  @override
  List<Object?> get props => [msg];
}

//  user update success
//------------------------------------------------------------
class UserUpdatedSuccessState extends UserState {
  final String msg;

  UserUpdatedSuccessState({required this.msg});

  @override
  List<Object?> get props => [msg];
}

//  user new success
//------------------------------------------------------------
class UserCreateSuccessState extends UserState {
  final String msg;

  UserCreateSuccessState({required this.msg});

  @override
  List<Object?> get props => [msg];
}
