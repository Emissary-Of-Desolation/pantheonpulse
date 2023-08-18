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
      backgroundColor: const Color.fromARGB(255, 165, 77, 71),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 165, 77, 71),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Beginner Protocol $protocolNumber',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: endDay - startDay + 1,
                itemBuilder: (context, index) {
                  final day = startDay + index;
                  return GestureDetector(
                    onTap: () =>
                        _navigateToWorkout(context, protocolNumber, day),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white12, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Card(
                        color: const Color.fromARGB(211, 189, 90, 83),
                        child: Center(
                          child: Text(
                            'Day $day',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
