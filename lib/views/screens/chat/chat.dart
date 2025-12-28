// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:service_box/core/routes/route_names.dart';
// import 'package:service_box/core/widgets/custom_navigation.dart';

// class Chat extends StatefulWidget {
//   const Chat({super.key});

//   @override
//   State<Chat> createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {
//   int _currentIndex = 3; // Chat tab index

//   void _onNavTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });

//     switch (index) {
//       case 0:
//         context.go(AppRoutePaths.homeViewPage);
//         break;
//       case 1:
//         context.go(AppRoutePaths.search);
//         break;
//       // case 2:
//       //   context.go(AppRoutePaths.bookings);
//       // break;
//       case 2:
//         context.go(AppRoutePaths.chat);
//         break;
//       case 3:
//         context.go(AppRoutePaths.menue);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       body: const Center(
//         child: Text(
//           "Chat Page",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),

//       bottomNavigationBar: CustomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onNavTap,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:service_box/core/routes/route_names.dart';
import 'package:service_box/core/widgets/custom_navigation.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int _currentIndex = 3; // Chat tab index
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hello! I need help with plumbing service",
      isClient: true,
      time: "10:30 AM",
    ),
    ChatMessage(
      text: "Hi there! I'm available to help. What's the issue?",
      isClient: false,
      time: "10:31 AM",
    ),
    ChatMessage(
      text: "My kitchen sink is leaking and water is dripping continuously",
      isClient: true,
      time: "10:32 AM",
    ),
    ChatMessage(
      text: "I can fix that for you. When would be a good time to visit?",
      isClient: false,
      time: "10:33 AM",
    ),
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        context.go(AppRoutePaths.homeViewPage);
        break;
      case 1:
        context.go(AppRoutePaths.search);
        break;
      case 2:
        context.go(AppRoutePaths.chat);
        break;
      case 3:
        context.go(AppRoutePaths.menue);
        break;
    }
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(
          ChatMessage(
            text: _messageController.text.trim(),
            isClient: true, // Assuming current user is client
            time:
                "${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}",
          ),
        );
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            // CircleAvatar(
            //   backgroundColor: Colors.white,
            //   radius: 20,
            //   child: Icon(Icons.person, color: Colors.blue[600]),
            // ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Live chatting",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Online",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.phone, color: Colors.white),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.videocam, color: Colors.white),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: _messages[index]);
              },
            ),
          ),
          // Message input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.grey[600]),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isClient;
  final String time;

  ChatMessage({required this.text, required this.isClient, required this.time});
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: message.isClient
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isClient)
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              radius: 16,
              child: Icon(Icons.build, size: 16, color: Colors.blue[600]),
            ),
          if (!message.isClient) const SizedBox(width: 8),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: message.isClient ? Colors.blue[600] : Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      color: message.isClient ? Colors.white : Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message.time,
                    style: TextStyle(
                      color: message.isClient
                          ? Colors.white70
                          : Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (message.isClient) const SizedBox(width: 8),
          if (message.isClient)
            CircleAvatar(
              backgroundColor: Colors.green[100],
              radius: 16,
              child: Icon(Icons.person, size: 16, color: Colors.green[600]),
            ),
        ],
      ),
    );
  }
}
