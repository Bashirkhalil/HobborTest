import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_functionality/model/user_article.dart';
import 'package:test_functionality/view/bloc/new_bloc.dart';
import 'package:test_functionality/view/bloc/news_event.dart';
import 'package:test_functionality/view/bloc/user_state.dart';

import '../../injection_container.dart';

class UserEditPage extends StatefulWidget {
  final User user;

  const UserEditPage({super.key, required this.user});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {

  late UserBloc mUserCubit ;

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _emailController;
  late TextEditingController _imageController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.user.title);
    _descriptionController =
        TextEditingController(text: widget.user.description);
    _emailController = TextEditingController(text: widget.user.email);
    _imageController = TextEditingController(text: widget.user.img_link);
  }

  @override
  Widget build(BuildContext context) {

    mUserCubit = BlocProvider.of<UserBloc>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("User Edit"),
        ),

        body: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {} ,
            builder: (context, state) {
              print("state is ");
              print(state);

              if (state is UserLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is UserUpdatedSuccessState) {
                if(state.msg=="successful"){
                  Fluttertoast.showToast(
                      msg: "User Update successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  mUserCubit.add(GetUserEvent("mikehsch@email.com"));
                }
              }

              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(labelText: 'Description'),
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                      TextField(
                        controller: _imageController,
                        decoration: const InputDecoration(labelText: 'Image'),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            User newUserUpdateObject = User(
                              id: widget.user.id,
                              title: _titleController.text,
                              description: _descriptionController.text,
                              email: _emailController.text,
                              img_link: _imageController.text,
                            );

                            updateUserData(newUserUpdateObject);
                          },
                          child: const Text('Update'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));


  }

  void updateUserData(User newUserUpdateObject) {
    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _imageController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Message"),
              content: const Text("Please check some value is empty ?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          });
    } else {
      mUserCubit.add(UpdateUserEvent(newUserUpdateObject));
    }
  }
}