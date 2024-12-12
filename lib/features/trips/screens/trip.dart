import 'package:driver_app/features/trips/widgets/benefit.dart';
import 'package:driver_app/features/trips/widgets/help_and_support.dart';
import 'package:driver_app/features/trips/widgets/learning_hub.dart';
import 'package:driver_app/features/trips/widgets/ride_requests.dart';
import 'package:driver_app/features/trips/widgets/weekly_challenges.dart';
import 'package:driver_app/utils/app_colors.dart';
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
      child: Container(
        color: AppColors.backgroundColor,
        padding: const EdgeInsets.only(top: 40),
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
    );
  }
}
