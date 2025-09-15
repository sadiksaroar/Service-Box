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
        context.go(AppRoutePaths.bookings);
        break;
      case 3:
        context.go(AppRoutePaths.chat);
        break;
      case 4:
        context.go(AppRoutePaths.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: const Center(
        child: Text(
          "Chat Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
