import 'package:flutter/material.dart';
import 'chat_detail_screen.dart';

class ChatMessage {
  final String imageUrl;
  final String name;
  final String location;
  final List<String> messages;

  ChatMessage({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.messages,
  });
}

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
        preferredSize: Size.fromHeight(100.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Instagram'),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications),
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
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(12.0),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          filterMessages(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: filteredChatMessages.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChatDetailScreen(filteredChatMessages[index]),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      leading: CircleAvatar(
                        radius: 24.0,
                        backgroundImage:
                            AssetImage(filteredChatMessages[index].imageUrl),
                      ),
                      title: Text(
                        filteredChatMessages[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            filteredChatMessages[index].messages.last,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            '1:30 PM',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void filterMessages(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredChatMessages = List.from(chatMessages);
      } else {
        filteredChatMessages = chatMessages
            .where((message) =>
                message.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  final List<ChatMessage> chatMessages = [
    ChatMessage(
      imageUrl: 'asset/image/img1.jpg',
      name: 'Dipali Patil',
      location: 'India',
      messages: ['Hi', 'How are you?', 'What are you doing?'],
    ),
    ChatMessage(
      imageUrl: 'asset/image/img2.jpg',
      name: 'Jane Doe',
      location: 'Los Angeles, USA',
      messages: ['Hi', 'How are you?', 'What are you doing?'],
    ),
    ChatMessage(
      imageUrl: 'asset/image/img3.jpg',
      name: 'Jane Smith',
      location: 'Los Angeles, USA',
      messages: ['Hi', 'How are you?', 'What are you doing?'],
    ),
    ChatMessage(
      imageUrl: 'asset/image/img4.jpg',
      name: 'Pooja Shinde',
      location: 'India',
      messages: ['Hi', 'How are you?', 'What are you doing?'],
    ),
    ChatMessage(
      imageUrl: 'asset/image/img5.jpg',
      name: 'William Wilson',
      location: 'Los Angeles, USA',
      messages: ['Hi', 'How are you?', 'What are you doing?'],
    ),
    ChatMessage(
      imageUrl: 'asset/image/img6.jpg',
      name: 'Samantha Scott',
      location: 'Los Angeles, USA',
      messages: ['Hi', 'How are you?', 'What are you doing?'],
    ),
  ];
}
