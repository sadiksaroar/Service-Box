import 'package:flutter/material.dart';
import 'package:service_box/core/colors/colors_widgets.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  double _barPosition = 0;

  @override
  void didUpdateWidget(covariant CustomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      _barPosition =
          MediaQuery.of(context).size.width / 4 * widget.currentIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.whiteBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15), // #00000026
            offset: const Offset(6, 0), // 6px right shadow
            blurRadius: 10, // spread softness
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                icon: Icons.home,
                label: 'Home',
                index: 0,
                isSelected: widget.currentIndex == 0,
              ),
              _buildNavItem(
                icon: Icons.location_on,
                label: 'place',
                index: 1,
                isSelected: widget.currentIndex == 1,
              ),
              // _buildNavItem(
              //   icon: Icons.assessment,
              //   label: 'Bookings',
              //   index: 2,
              //   isSelected: widget.currentIndex == 2,
              // ),
              _buildNavItem(
                icon: Icons.chat_bubble,
                label: 'Chats',
                index: 2,
                isSelected: widget.currentIndex == 2,
              ),
              _buildNavItem(
                icon: Icons.menu,
                label: 'Menu',
                index: 3,
                isSelected: widget.currentIndex == 3,
              ),
            ],
          ),
          AnimatedPositioned(
            bottom: 0,
            left: _barPosition,
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: 3,
              width: MediaQuery.of(context).size.width / 4,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    final iconColor = isSelected ? AppColors.text : AppColors.buttonColor;
    final textColor = isSelected
        ? AppColors.buttonColor
        : AppColors.welcomeButtonBackColor;

    return GestureDetector(
      onTap: () {
        widget.onTap(index);
        setState(() {
          _barPosition = MediaQuery.of(context).size.width / 4 * index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: 24), // ✅ use iconColor
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: textColor, // ✅ use textColor
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
