// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:service_box/core/colors/colors_widgets.dart';
// import 'package:service_box/core/routes/route_names.dart';
// import 'package:service_box/core/widgets/custom_navigation.dart';

// class Menue extends StatefulWidget {
//   const Menue({super.key});

//   @override
//   State<Menue> createState() => _MenueState();
// }

// class _MenueState extends State<Menue> {
//   int _currentIndex = 1;

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
//       //   break;
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

//       bottomNavigationBar: CustomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onNavTap,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:service_box/core/colors/colors_widgets.dart';
import 'package:service_box/core/routes/route_names.dart';
import 'package:service_box/core/widgets/custom_navigation.dart';

class Menue extends StatefulWidget {
  const Menue({super.key});

  @override
  State<Menue> createState() => _MenueState();
}

class _MenueState extends State<Menue> {
  int _currentIndex = 3;

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

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add your logout logic here
                // Example: context.go(AppRoutePaths.login);
              },
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Menu',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'User Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'user@example.com',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Menu Items
            _buildMenuSection(
              title: 'Account',
              items: [
                _MenuItem(
                  icon: Icons.person_outline,
                  title: 'Profile Information',
                  subtitle: 'Update your personal details',
                  onTap: () {
                    // Navigate to profile information page
                    // context.push(AppRoutePaths.profileInfo);
                  },
                ),
                _MenuItem(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  subtitle: 'Notifications, language, theme',
                  onTap: () {
                    // Navigate to settings page
                    // context.push(AppRoutePaths.settings);
                  },
                ),
              ],
            ),

            const Divider(height: 1),

            _buildMenuSection(
              title: 'Legal',
              items: [
                _MenuItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  subtitle: 'How we handle your data',
                  onTap: () {
                    // Navigate to privacy policy page
                    // context.push(AppRoutePaths.privacyPolicy);
                  },
                ),
                _MenuItem(
                  icon: Icons.description_outlined,
                  title: 'Terms & Conditions',
                  subtitle: 'Rules for using our app',
                  onTap: () {
                    // Navigate to terms page
                    // context.push(AppRoutePaths.termsConditions);
                  },
                ),
              ],
            ),

            const Divider(height: 1),

            _buildMenuSection(
              title: 'Support',
              items: [
                _MenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  subtitle: 'FAQs and contact support',
                  onTap: () {
                    // Navigate to help page
                    // context.push(AppRoutePaths.helpSupport);
                  },
                ),
                _MenuItem(
                  icon: Icons.feedback_outlined,
                  title: 'Feedback / Report',
                  subtitle: 'Share feedback or report issues',
                  onTap: () {
                    // Navigate to feedback page
                    // context.push(AppRoutePaths.feedback);
                  },
                ),
                _MenuItem(
                  icon: Icons.info_outline,
                  title: 'About Us',
                  subtitle: 'Learn more about ServiceBox',
                  onTap: () {
                    // Navigate to about page
                    // context.push(AppRoutePaths.aboutUs);
                  },
                ),
              ],
            ),

            const Divider(height: 1),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: _showLogoutDialog,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.logout, color: Colors.red),
                      const SizedBox(width: 16),
                      const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildMenuSection({
    required String title,
    required List<_MenuItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ),
        ...items.map((item) => _buildMenuItem(item)),
      ],
    );
  }

  Widget _buildMenuItem(_MenuItem item) {
    return InkWell(
      onTap: item.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(item.icon, size: 24, color: Colors.grey[700]),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      item.subtitle!,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  _MenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });
}
