import 'dart:convert';
import 'package:flutter/material.dart';
import '/constants/colors.dart';
import '/models/conversation.dart';
//import '/widgets/example_widget.dart';
import 'package:http/http.dart';

import '/widgets/chat_list_view.dart';
import '/widgets/chat_text_field.dart';

class Bot extends StatefulWidget {
  const Bot({super.key});

  @override
  State<Bot> createState() => _BotState();
}

class _BotState extends State<Bot> {
  final TextEditingController controller = TextEditingController();
  List<Conversation> conversations = [];

  bool get isConversationStarted => conversations.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 38),
                    if (!isConversationStarted) ...[
                      Text(
                        "JusticeBot",
                        style: textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),                    
                    ] else
                      Expanded(child: ChatListView(conversations: conversations)),
                    ChatTextField(
                        controller: controller,
                        onSubmitted: (question) {
                          controller.clear();
                          FocusScope.of(context).unfocus();
                          conversations.add(Conversation(question!, ""));
                          setState(() {});
                          post(Uri.parse("http://127.0.0.1:5000/"),
                                  body: jsonEncode({"text": question}),
                                  headers: {"Content-Type": "application/json"})
                              .then((response) {
                            String result = jsonDecode(response.body)['response'];
                            conversations.last =
                                Conversation(conversations.last.question, result);
                            setState(() {});
                          });
                        }),
                    const SizedBox(height: 16)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
