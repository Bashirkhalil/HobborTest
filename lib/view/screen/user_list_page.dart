import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_functionality/model/user_article.dart';
import 'package:test_functionality/view/screen/user_edit_page.dart';
import 'package:test_functionality/view/screen/user_new_page.dart';

import '../../injection_container.dart';
import '../bloc/new_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/user_state.dart';
import '../widget/user_row.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var mUserCubit = sl<UserBloc>();

  @override
  void initState() {
    super.initState();
    mUserCubit.add(GetUserEvent("mikehsch@email.com"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserNewPage()));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("User List"),
        ),
        body: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {},
            builder: (context, state) {
              print("state is ");
              print(state);

              if (state is UserLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is UserSuccessState) {
                print("Data -> ${state.userList.length}");
                print("Data -> ${state.userList[0].title}");

                return buildUserList(state.userList);
              }

              if (state is UserDeletedSuccessState) {
                if (state.msg == "successful") {
                  Fluttertoast.showToast(
                      msg: "User Deleted successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  mUserCubit.add(GetUserEvent("mikehsch@email.com"));
                }
              }

              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    mUserCubit.add(GetUserEvent("mikehsch@email.com"));
                  },
                  child: const Text('Refresh the page '),
                ),
              );
            }));
  }

  buildUserList(List<User> userList) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: userList.length,
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemBuilder: (context, index) {
            return UserRow(
              user: userList[index],
              onDelete: (User user) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Delete"),
                        content: const Text(
                            "Are you sure you want to delete this user?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                              deleteTheCurrentUser(user);
                            },
                            child: const Text("Delete"),
                          ),
                        ],
                      );
                    });
              },
              onEdit: (User user) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Edit"),
                        content: const Text(
                            "Are you sure you want to delete this user?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                              goToEditPage(user);
                            },
                            child: const Text("Edit"),
                          ),
                        ],
                      );
                    });
              },
            );
          }),
    );
  }

  void deleteTheCurrentUser(User user) => mUserCubit.add(DeleteUserEvent(user));

  void goToEditPage(User user) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserEditPage(user: user)),
      );
}
