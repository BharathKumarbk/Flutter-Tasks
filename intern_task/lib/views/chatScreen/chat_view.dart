import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:intern_task/components/constants.dart';
import 'package:intern_task/components/textStyles.dart';

class ChatView extends StatefulWidget {
  final String user;
  final String image;
  const ChatView({
    Key key,
    this.user,
    this.image,
  }) : super(key: key);
  @override
  _ChatViewState createState() => _ChatViewState();
}

List<Map<String, dynamic>> dummyData = [
  {"msg": "What is the name of your app?", "sender": false},
  {"msg": "What is your name", "sender": false},
  {"msg": "Yes it is...", "sender": true},
  {"msg": "This is a dummy message", "sender": false},
  {"msg": "I am fine", "sender": true},
  {"msg": "Hii", "sender": true},
  {"msg": "How are yoy?", "sender": false},
  {"msg": "Hello", "sender": false},
];

class _ChatViewState extends State<ChatView> {
  TextEditingController _msgController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: kMainColor,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        title: Text(
          widget.user,
          style: kAppbarTitle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: dummyData.length,
              itemBuilder: (context, index) {
                return chatBubble(widget.image, dummyData[index]["sender"],
                    dummyData[index]["msg"]);
              },
            ),
          ),
          Container(
            color: Colors.blueGrey.shade50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.attach_file),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.emoji_emotions_outlined),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _msgController,
                        validator: (value) {
                          return value.isEmpty ? "No Message" : null;
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: "Type your message...",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30.0)),
                            filled: true,
                            fillColor: kWhite),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: Icon(
                            Icons.send,
                            color: kMainColor,
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                dummyData.insert(0, {
                                  "msg": _msgController.text,
                                  "sender": true
                                });
                                _msgController.text = "";
                              });
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget chatBubble(String image, bool isSender, String msg) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: isSender
          ? [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: kMainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$msg",
                      style: TextStyle(color: kWhite, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 15.0,
                backgroundColor: kWhite,
                backgroundImage: AssetImage("assets/sender.jpeg"),
              ),
            ]
          : [
              CircleAvatar(
                radius: 15.0,
                backgroundColor: kWhite,
                backgroundImage: AssetImage(image),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    color: Colors.blueGrey[50],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$msg",
                      style: TextStyle(color: kBlack, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
    ),
  );
}
