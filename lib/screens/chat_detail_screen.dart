import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../utils/validator.dart'; 

class ChatDetailScreen extends StatefulWidget {
  final ChatMessage chatMessage;

  ChatDetailScreen(this.chatMessage);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatMessage.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.chatMessage.messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      widget.chatMessage.messages[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    validator: (value) => Validator.validateMessage(value),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (Validator.validateMessage(messageController.text) ==
                        null) {
                      setState(() {
                        widget.chatMessage.messages.add(messageController.text);
                        messageController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
