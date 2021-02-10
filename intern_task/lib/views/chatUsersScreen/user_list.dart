import 'package:flutter/material.dart';
import 'package:intern_task/components/constants.dart';
import 'package:intern_task/components/textStyles.dart';
import 'package:intern_task/views/chatUsersScreen/user_list_view.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image(
            image: AssetImage("assets/logo.png"),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Messages",
          style: kAppbarTitle
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: kMainColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: UserListView(),
    );
  }
}
