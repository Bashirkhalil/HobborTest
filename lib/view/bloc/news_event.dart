import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_functionality/model/user_article.dart';

@immutable
abstract class UserEvent extends Equatable {}

class GetUserEvent extends UserEvent {
  final String email;

  GetUserEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class UpdateUserEvent extends UserEvent {
  final User user;

  UpdateUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class DeleteUserEvent extends UserEvent {
  final User user;

  DeleteUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class NewUserEvent extends UserEvent {
  final User user;

  NewUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}
