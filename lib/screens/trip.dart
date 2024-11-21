import 'package:driver_app/widgets/benefit.dart';
import 'package:driver_app/widgets/help_and_support.dart';
import 'package:driver_app/widgets/learning_hub.dart';
import 'package:driver_app/widgets/ride_requests.dart';
import 'package:driver_app/widgets/weekly_challenges.dart';
import 'package:flutter/material.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Stack(
        children: [
          Container(color: const Color(0xFFFFFFFF),
          
        child: Column(
          children: [
            Container(
              color: const Color(0xFFFFFFFF),
              child: const Column(
                children: [
                  RideRequests(),
                  WeeklyChallenges(),
                  Benefit(),
                  LearningHub(),
                  HelpAndSupport(),
                ],
              ),
            ),
          ],
        ),
      ),
        ],
      )
    );
  }
}
