import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:service_box/core/routes/route_names.dart';
import 'package:service_box/core/widgets/custom_navigation.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  String lang = 'English';

  // Add animation controller for emergency button
  late AnimationController _emergencyAnimationController;
  late Animation<double> _emergencyAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _emergencyAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _emergencyAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _emergencyAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the pulsing animation
    _emergencyAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _emergencyAnimationController.dispose();
    super.dispose();
  }

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

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Text('🚨', style: TextStyle(fontSize: 24)),
              SizedBox(width: 10),
              Text('Emergency Help'),
            ],
          ),
          content: Text(
            'This will send an immediate alert to all nearby technicians. Are you sure you need emergency assistance?',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _sendEmergencyAlert();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDC2626),
                foregroundColor: Colors.white,
              ),
              child: Text('Send Alert'),
            ),
          ],
        );
      },
    );
  }

  void _sendEmergencyAlert() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🚨 Emergency alert sent to nearby technicians!'),
        backgroundColor: Color(0xFFDC2626),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _navigateToService(String service) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening $service technicians...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Set the height to 80
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.50, 1.00),
              end: Alignment(0.50, -0.00),
              colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 10,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Make AppBar transparent
            elevation: 0, // Remove default shadow
            centerTitle: true,
            toolbarHeight: 80.0, // Set toolbar height
            title: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ), // Adjust bottom padding
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "ServiceBox",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      height: 1.0,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5), // Small gap between title and subtitle
                  Text(
                    "Your Local Service Experts",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section

            // Location Bar
            Container(
              color: Color(0xFFF3F4F6),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFF1E3A8A), size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                        children: [
                          TextSpan(text: 'Dhanmondi, Dhaka • '),
                          TextSpan(
                            text: '12 technicians nearby',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Emergency Section
            Container(
              color: Color(0xFFFEF2F2),
              padding: EdgeInsets.all(20),
              child: AnimatedBuilder(
                animation: _emergencyAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _emergencyAnimation.value,
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showEmergencyDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFDC2626),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 8,
                          shadowColor: Color(0xFFDC2626).withOpacity(0.4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('🆘', style: TextStyle(fontSize: 20)),
                            SizedBox(width: 10),
                            Text(
                              'EMERGENCY HELP',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Services Section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose Service Category',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          SizedBox(height: 20),
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            children: [
                              ServiceCard(
                                icon: '🚗',
                                title: 'Car Repair',
                                onTap: () => _navigateToService('Car Repair'),
                              ),
                              ServiceCard(
                                icon: '⚡',
                                title: 'Electrical',
                                onTap: () => _navigateToService('Electrical'),
                              ),
                              ServiceCard(
                                icon: '❄️',
                                title: 'AC & Fridge',
                                onTap: () => _navigateToService('AC & Fridge'),
                              ),
                              ServiceCard(
                                icon: '📺',
                                title: 'Electronics',
                                onTap: () => _navigateToService('Electronics'),
                              ),
                              ServiceCard(
                                icon: '🚰',
                                title: 'Plumbing',
                                onTap: () => _navigateToService('Plumbing'),
                              ),
                              ServiceCard(
                                icon: '🔧',
                                title: 'General',
                                onTap: () => _navigateToService('General'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Top Rated Section
                    Container(
                      color: Color(0xFFF9FAFB),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Top Rated Nearby',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          SizedBox(height: 15),
                          TechnicianCard(
                            name: "Md. Rana",
                            specialty: 'Car & Electronics Expert',
                            rating: 4.9,
                            reviews: 127,
                            distance: '0.8km',
                            avatar: 'MR',
                          ),
                          SizedBox(height: 12),
                          TechnicianCard(
                            name: 'Sadik',
                            specialty: 'AC & Refrigeration',
                            rating: 4.8,
                            reviews: 89,
                            distance: '1.2km',
                            avatar: 'AK',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

// ServiceCard Widget
class ServiceCard extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(icon, style: TextStyle(fontSize: 40)),
                  SizedBox(height: 12),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF1F2937),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// TechnicianCard Widget
class TechnicianCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final int reviews;
  final String distance;
  final String avatar;

  const TechnicianCard({
    Key? key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Opening $name\'s profile...'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      avatar,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        specialty,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              size: 14,
                              color: index < rating.floor()
                                  ? Color(0xFFF59E0B)
                                  : Color(0xFFE5E7EB),
                            );
                          }),
                          SizedBox(width: 5),
                          Text(
                            '$rating ($reviews reviews)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Distance
                Text(
                  distance,
                  style: TextStyle(
                    color: Color(0xFF1E3A8A),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
