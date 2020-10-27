import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/Provicers/user_data_provider.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/message_model.dart';
import 'package:scholar_chat/size_config.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'Chat Screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  User user;
  String _message;
  List<MessageModel> messagesList = [];
  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context).getUser.user;
    int index = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kBackgroundColo,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: MediaQuery.of(context).size.width * .1,
              image: AssetImage(
                'images/scholar.png',
              ),
            ),
            Text(
              'Scholar Chat',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: messages.orderBy('createdAt', descending: true).snapshots(),
            builder: (context, snapshot) {
              List<MessageModel> messagesList = [];
              if (snapshot.hasData) {
                var listDocs = snapshot.data.docs;
                for (int index = 0; index < listDocs.length; index++) {
                  messagesList.add(
                    MessageModel(
                      message: listDocs[index].get('message'),
                      sender: listDocs[index].get('sender'),
                    ),
                  );
                }
                return Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    controller: _scrollController,
                    reverse: true,
                    children: messagesList
                        .map((e) => Column(
                              crossAxisAlignment: (e.sender == user.email)
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Bubble(
                                  nip: (e.sender == user.email)
                                      ? BubbleNip.rightBottom
                                      : BubbleNip.leftBottom,
                                  color: (e.sender == user.email)
                                      ? kBackgroundColo
                                      : Color(0xFFF5F6FA),
                                  elevation: 5,
                                  child: Text(e.message),
                                ),
                                SizedBox(
                                  height: SizeConfig.defaultSize,
                                ),
//                                Text(
//                                  e.sender,
//                                  style: TextStyle(color: Colors.grey),
//                                ),
                              ],
                            ))
                        .toList(),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          TextField(
            controller: _textEditingController,
            onChanged: (value) {
              _message = value;
            },
            decoration: InputDecoration(
                hintText: 'Enter your Message',
                suffixIcon: IconButton(
                  onPressed: () async {
                    _textEditingController.clear();
                    addMessage();
                    _scrollController.animateTo(0.0,
                        duration: Duration(microseconds: 300),
                        curve: Curves.easeOut);
                  },
                  icon: Icon(
                    Icons.send,
                    color: kBackgroundColo,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Future<void> addMessage() async {
    await messages.add({
      'createdAt': Timestamp.now(),
      'message': _message,
      'sender': user.email,
    });
  }


}


class CustomAppbar  extends PreferredSizeWidget
{
  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    // TODO: implement debugDescribeChildren
    throw UnimplementedError();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    // TODO: implement debugFillProperties
  }

  @override
  // TODO: implement key
  Key get key => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

  @override
  DiagnosticsNode toDiagnosticsNode({String name, DiagnosticsTreeStyle style}) {
    // TODO: implement toDiagnosticsNode
    throw UnimplementedError();
  }

  @override
  String toStringDeep({String prefixLineOne = '', String prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringDeep
    throw UnimplementedError();
  }

  @override
  String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringShallow
    throw UnimplementedError();
  }

//  @override
//  String toStringShort() {
//    // TODO: implement toStringShort
//    throw UnimplementedError();
  }

}