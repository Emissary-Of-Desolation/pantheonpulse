import 'package:flutter/material.dart';
import 'workout_page.dart';

class ProtocolPage extends StatelessWidget {
  final int protocolNumber;
  final int startDay;
  final int endDay;

  const ProtocolPage({
    required this.protocolNumber,
    required this.startDay,
    required this.endDay,
    Key? key,
  }) : super(key: key);

  List<String> getImagesForDay(int day) {
    List<String> images = [];
    for (int i = 1; i <= 8; i++) {
      images.add('assets/protocol1/day 1/day1_image1.jpg');
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed background color to white
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 77, 71), // Custom app bar color
        title: Text(
          'Beginner Protocol $protocolNumber',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0, // Removed app bar elevation
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.0, // Increased spacing
            mainAxisSpacing: 16.0, // Increased spacing
          ),
          itemCount: endDay - startDay + 1,
          itemBuilder: (context, index) {
            final day = startDay + index;
            return GestureDetector(
              onTap: () => _navigateToWorkout(context, protocolNumber, day),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color.fromARGB(255, 165, 77, 71), // Custom card color
                ),
                child: Center(
                  child: Text(
                    'Day $day',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

  void _navigateToWorkout(BuildContext context, int protocolNumber, int day) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutPage(
          protocolNumber: protocolNumber,
          day: day,
        ),
      ),
    );
  }
}
