import 'package:flutter/material.dart';
import 'protocol_page.dart';
import 'package:pantheonpulse/Button/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 77, 71),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Welcome to\nPantheon Pulse',
                style: TextStyle(
                  color: Color.fromARGB(179, 255, 219, 219),
                  fontFamily: 'Bangers Regular',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  letterSpacing: 7,
                ),
              ),
              const Text(
                'Sweat it out,Get Fit!!',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  height: 2,
                  wordSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RubikMoonrocks Regular',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Image.asset('assets/homeicon/octopus.png', height: 350),
              ),
              const SizedBox(height: 10),
              MyButton(
                text: 'Beginner Protocol 1 (Day 1 to Day 30)',
                onPressed: () => _navigateToProtocol(context, 1, 1, 30),
              ),
              const SizedBox(height: 10),
              MyButton(
                text: 'Beginner Protocol 2 (Day 31 to Day 60)',
                onPressed: () => _navigateToProtocol(context, 2, 31, 60),
              ),
              const SizedBox(height: 10),
              MyButton(
                text: 'Beginner Protocol 3 (Day 61 to Day 90)',
                onPressed: () => _navigateToProtocol(context, 3, 61, 90),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToProtocol(
      BuildContext context, int protocolNumber, int startDay, int endDay) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProtocolPage(
          protocolNumber: protocolNumber,
          startDay: startDay,
          endDay: endDay,
        ),
      ),
    );
  }
}
