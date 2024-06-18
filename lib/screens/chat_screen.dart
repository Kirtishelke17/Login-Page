import 'package:flutter/material.dart';
import 'chat_detail_screen.dart';
import '../models/chat_message.dart';
import '../widgets/custom_text_form_field.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<ChatMessage> filteredChatMessages;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    filteredChatMessages = List.from(chatMessages);
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Instagram',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.send, color: Colors.black),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: CustomTextFormField(
                      controller: searchController,
                      hintText: "Search...",
                      icon: Icons.search,
                      onChanged: (value) {
                        filterMessages(value);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredChatMessages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(filteredChatMessages[index].imageUrl),
            ),
            title: Text(
              filteredChatMessages[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              filteredChatMessages[index].messages.last,
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatDetailScreen(filteredChatMessages[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void filterMessages(String query) {
    List<ChatMessage> dummySearchList = List.from(chatMessages);
    if (query.isNotEmpty) {
      List<ChatMessage> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredChatMessages = dummyListData;
      });
    } else {
      setState(() {
        filteredChatMessages = List.from(chatMessages);
      });
    }
  }
}

List<ChatMessage> chatMessages = [
  ChatMessage(
    imageUrl: 'assets/image/img1.jpg',
    name: 'John Doe',
    messages: ['Hello', 'How are you?', 'What\'s up?'],
  ),
  ChatMessage(
    imageUrl: 'assets/image/img2.jpg',
    name: 'Jane Smith',
    messages: ['Hi', 'Good morning', 'How\'s it going?'],
  ),
  ChatMessage(
    imageUrl: 'assets/image/img3.jpg',
    name: 'Alice Johnson',
    messages: ['Hey!', 'Are you available today?', 'Let\'s catch up!'],
  ),
  ChatMessage(
    imageUrl: 'assets/image/img4.jpg',
    name: 'Ana Deo',
    messages: ['Hey!', 'Are you available today?', 'Let\'s catch up!'],
  ),
  ChatMessage(
    imageUrl: 'assets/image/img5.jpg',
    name: 'Robert Charles',
    messages: ['Hi', 'Good morning', 'How\'s it going?'],
  ),
  ChatMessage(
    imageUrl: 'assets/image/img6.jpg',
    name: 'James Devid',
    messages: ['Hey!', 'Are you available today?', 'Let\'s catch up!'],
  ),
];
