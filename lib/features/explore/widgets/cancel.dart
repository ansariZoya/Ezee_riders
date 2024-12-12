import 'package:driver_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CancelProgress extends StatefulWidget {
  const CancelProgress({super.key});

  @override
  State<CancelProgress> createState() => _CancelProgressState();
}

class _CancelProgressState extends State<CancelProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25), // Countdown duration
    )..forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CircularProgressIndicator(
                  value: 1.0 - _controller.value, // Reverse countdown
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.redColor),
                  strokeWidth: 3,
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.redColor),
            iconSize: 16,
            onPressed: () {
              _controller.stop(); 
              print("Cancel button pressed");
            },
          ),
        ],
      ),
    );
  }
}
