// import 'dart:convert';
// import 'package:flutter/material.dart';
// import '/constants/colors.dart';
// import '/models/conversation.dart';
// //import '/widgets/example_widget.dart';
// import 'package:http/http.dart';

// import '/widgets/chat_list_view.dart';
// import '/widgets/chat_text_field.dart';

// class Bot extends StatefulWidget {
//   const Bot({super.key});

//   @override
//   State<Bot> createState() => _BotState();
// }

// class _BotState extends State<Bot> {
//   final TextEditingController controller = TextEditingController();
//   List<Conversation> conversations = [];

//   bool get isConversationStarted => conversations.isNotEmpty;

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       backgroundColor: CustomColors.background,
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: SingleChildScrollView(
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height * .95,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 38),
//                     if (!isConversationStarted) ...[
//                       Text(
//                         "JusticeBot",
//                         style: textTheme.headlineMedium?.copyWith(
//                             fontWeight: FontWeight.bold, color: Colors.white),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 12),                    
//                     ] else
//                       Expanded(child: ChatListView(conversations: conversations)),
//                     ChatTextField(
//                         controller: controller,
//                         onSubmitted: (question) {
//                           controller.clear();
//                           FocusScope.of(context).unfocus();
//                           conversations.add(Conversation(question!, ""));
//                           setState(() {});
//                           post(Uri.parse("http://127.0.0.1:5000/"),
//                                   body: {"text": question},
//                                   headers: {"Content-Type": "application/json"})
//                               .then((response) {
//                             String result = jsonDecode(response.body)['response'];
//                             conversations.last =
//                                 Conversation(conversations.last.question, result);
//                             setState(() {});
//                           });
//                         }),
//                     const SizedBox(height: 16)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Bot extends StatefulWidget {
  const Bot({super.key});
  @override _BotState createState() => _BotState();
}

class _BotState extends State<Bot> {
  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('ChatBot')),
      ),
      body: SafeArea(
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(title: _messages[index],);
                },
              ),
            ),
            const Divider(height: 10.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                child: _buildTextComposer()
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  _handleSubmitted(_textController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) async {
    _textController.clear();

    Message message = Message(
      text: text,
      isUser: true,
    );
    var len = _messages.length;

    setState(() {
      _messages.insert(len, message);
    });

    // try {
      final response = await http.post(
        Uri.parse("http://127.0.0.1:5000/"),
        body: {"text": text},
      );

      if (response.statusCode == 200) {
        String result = jsonDecode(response.body)['response'];

        Message botMessage = Message(
          text: result,
          isUser: false,
        );
        var len = _messages.length;
        setState(() {
          _messages.insert(len, botMessage);
        });
    }
  }
}

class Message extends StatelessWidget {
  final String text;
  final bool isUser;
  
  const Message({
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: isUser
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


