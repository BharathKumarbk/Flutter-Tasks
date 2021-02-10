import 'package:flutter/material.dart';
import 'package:intern_task/components/constants.dart';
import 'package:intern_task/components/textStyles.dart';
import 'package:intern_task/views/chatScreen/chat_view.dart';

class UserListView extends StatefulWidget {
  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  Widget _titleHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "$text",
        style: kTitleHeader,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleHeader("People Online"),
              Container(height: 120.0, child: _categories()),
            ],
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleHeader("Recents"),
            Expanded(
              child: Container(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChatView(
                                  image: "assets/recieve.jpg",
                                  user: "User Name $index",
                                )));
                      },
                      title: Text(
                        "User Name $index",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: CircleAvatar(
                        radius: 15.0,
                        child: Text(
                          "${(index + 3) * 2}",
                          style: TextStyle(color: kWhite, fontSize: 12.0),
                        ),
                        backgroundColor: kMainColor,
                      ),
                      subtitle: index % 2 == 0
                          ? Text(
                              "Recent message from $index" * 3,
                            )
                          : Text("Recent message from $index"),
                      leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage("assets/recieve.jpg")),
                    );
                  },
                ),
              ),
            ),
          ],
        ))
      ],
    );
  }
}

Widget _categories() {
  return ListView.builder(
    itemCount: 12,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Container(
        width: 70.0,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ChatView()));
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage("assets/recieve.jpg"),
                  backgroundColor: kWhite,
                ),
              ),
              Text(
                "User $index",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
