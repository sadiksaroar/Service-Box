import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:service_box/core/routes/route_names.dart';
import 'package:service_box/core/widgets/custom_navigation.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int _currentIndex = 1;
  GoogleMapController? _mapController;
  String _selectedCategory = '';
  Set<Marker> _markers = {};
  Set<Marker> _allMarkers = {};
  ScrollController _scrollController = ScrollController();

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(23.8103, 90.4125), // Dhaka coordinates
    zoom: 14.0,
  );

  final List<Map<String, dynamic>> _serviceCategories = [
    {'name': 'Car AC', 'icon': Icons.ac_unit, 'color': Colors.blue},
    {
      'name': 'Electrician',
      'icon': Icons.electrical_services,
      'color': Colors.orange,
    },
    {
      'name': 'General',
      'icon': Icons.home_repair_service,
      'color': Colors.green,
    },
    {'name': 'Plumbing', 'icon': Icons.plumbing, 'color': Colors.purple},
    {'name': 'Cleaning', 'icon': Icons.cleaning_services, 'color': Colors.teal},
    {'name': 'Painting', 'icon': Icons.format_paint, 'color': Colors.red},
  ];

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _createMarkers() {
    _allMarkers = {
      // Car AC Services
      const Marker(
        markerId: MarkerId('ac1'),
        position: LatLng(23.8103, 90.4125),
        infoWindow: InfoWindow(
          title: 'Cool AC Service',
          snippet: 'Car AC Repair & Maintenance',
        ),
      ),
      const Marker(
        markerId: MarkerId('ac2'),
        position: LatLng(23.8200, 90.4200),
        infoWindow: InfoWindow(
          title: 'Arctic Car AC',
          snippet: 'Professional AC Solutions',
        ),
      ),

      // Electrician Services
      const Marker(
        markerId: MarkerId('elec1'),
        position: LatLng(23.8050, 90.4100),
        infoWindow: InfoWindow(
          title: 'Power Electric',
          snippet: 'Home & Office Electrical Work',
        ),
      ),
      const Marker(
        markerId: MarkerId('elec2'),
        position: LatLng(23.8150, 90.4180),
        infoWindow: InfoWindow(
          title: 'Spark Electricians',
          snippet: '24/7 Electrical Services',
        ),
      ),

      // General Services
      const Marker(
        markerId: MarkerId('gen1'),
        position: LatLng(23.8080, 90.4080),
        infoWindow: InfoWindow(
          title: 'Fix It All',
          snippet: 'General Home Repairs',
        ),
      ),
      const Marker(
        markerId: MarkerId('gen2'),
        position: LatLng(23.8180, 90.4150),
        infoWindow: InfoWindow(
          title: 'Handy Service',
          snippet: 'All-in-One Solutions',
        ),
      ),

      // Plumbing Services
      const Marker(
        markerId: MarkerId('plumb1'),
        position: LatLng(23.8120, 90.4090),
        infoWindow: InfoWindow(
          title: 'Aqua Plumbers',
          snippet: 'Pipe & Drainage Solutions',
        ),
      ),
      const Marker(
        markerId: MarkerId('plumb2'),
        position: LatLng(23.8160, 90.4160),
        infoWindow: InfoWindow(
          title: 'Flow Fix',
          snippet: 'Emergency Plumbing',
        ),
      ),

      // Cleaning Services
      const Marker(
        markerId: MarkerId('clean1'),
        position: LatLng(23.8090, 90.4110),
        infoWindow: InfoWindow(
          title: 'Sparkle Clean',
          snippet: 'House & Office Cleaning',
        ),
      ),
      const Marker(
        markerId: MarkerId('clean2'),
        position: LatLng(23.8170, 90.4140),
        infoWindow: InfoWindow(
          title: 'Fresh & Clean',
          snippet: 'Deep Cleaning Services',
        ),
      ),

      // Painting Services
      const Marker(
        markerId: MarkerId('paint1'),
        position: LatLng(23.8140, 90.4120),
        infoWindow: InfoWindow(
          title: 'Color Masters',
          snippet: 'Interior & Exterior Painting',
        ),
      ),
      const Marker(
        markerId: MarkerId('paint2'),
        position: LatLng(23.8110, 90.4190),
        infoWindow: InfoWindow(
          title: 'Rainbow Painters',
          snippet: 'Professional Painting',
        ),
      ),
    };
    _markers = _allMarkers; // Show all markers initially
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

  void _onCategoryTap(String category) {
    setState(() {
      _selectedCategory = category;
      _filterMarkersByCategory(category);
    });
  }

  void _filterMarkersByCategory(String category) {
    if (category.isEmpty) {
      _markers = _allMarkers;
      return;
    }

    Set<Marker> filteredMarkers = {};

    switch (category.toLowerCase()) {
      case 'car ac':
        filteredMarkers = _allMarkers
            .where((marker) => marker.markerId.value.startsWith('ac'))
            .toSet();
        break;
      case 'electrician':
        filteredMarkers = _allMarkers
            .where((marker) => marker.markerId.value.startsWith('elec'))
            .toSet();
        break;
      case 'general':
        filteredMarkers = _allMarkers
            .where((marker) => marker.markerId.value.startsWith('gen'))
            .toSet();
        break;
      case 'plumbing':
        filteredMarkers = _allMarkers
            .where((marker) => marker.markerId.value.startsWith('plumb'))
            .toSet();
        break;
      case 'cleaning':
        filteredMarkers = _allMarkers
            .where((marker) => marker.markerId.value.startsWith('clean'))
            .toSet();
        break;
      case 'painting':
        filteredMarkers = _allMarkers
            .where((marker) => marker.markerId.value.startsWith('paint'))
            .toSet();
        break;
      default:
        filteredMarkers = _allMarkers;
    }

    _markers = filteredMarkers;
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 150,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 150,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Search Services'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for services...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
          ),

          // Google Maps or fallback for unsupported platforms
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildMapWidget(),
              ),
            ),
          ),

          // Service Category Buttons with Navigation
          Container(
            height: 120,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Service Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Row(
                    children: [
                      // Left navigation button
                      GestureDetector(
                        onTap: _scrollLeft,
                        child: Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                        ),
                      ),

                      // All Services button
                      GestureDetector(
                        onTap: () => _onCategoryTap(''),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: _selectedCategory.isEmpty
                                ? Colors.blue
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _selectedCategory.isEmpty
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.apps,
                                size: 16,
                                color: _selectedCategory.isEmpty
                                    ? Colors.white
                                    : Colors.blue,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'All',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedCategory.isEmpty
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Category buttons in horizontal scroll
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: _serviceCategories.length,
                          itemBuilder: (context, index) {
                            final category = _serviceCategories[index];
                            final isSelected =
                                _selectedCategory == category['name'];

                            return GestureDetector(
                              onTap: () => _onCategoryTap(category['name']),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? category['color']
                                      : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? category['color']
                                        : Colors.grey.shade300,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      category['icon'],
                                      size: 16,
                                      color: isSelected
                                          ? Colors.white
                                          : category['color'],
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      category['name'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Right navigation button
                      GestureDetector(
                        onTap: _scrollRight,
                        child: Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
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

  Widget _buildMapWidget() {
    // Check if platform supports Google Maps
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        markers: _markers,
      );
    } else {
      // Fallback for unsupported platforms (Linux, Windows, macOS)
      return Container(
        color: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, size: 64, color: Colors.grey.shade600),
            const SizedBox(height: 16),
            Text(
              'Map View',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Google Maps is not available on this platform.\nShowing service locations in Dhaka area.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Colors.blue.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Dhaka, Bangladesh',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedCategory.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Text(
                  'Showing: $_selectedCategory Services',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      );
    }
  }
}
