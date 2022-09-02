import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF7349FE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.add),
      ),
      backgroundColor: Color(0xFFF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 60,
                alignment: Alignment.topLeft,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 32,
              ),
              TaskCardWidget(
                title: 'Get Started!',
                description:
                    'Hello User! Welcome to DoIT app, this is a default task that you can edit or delete to start using the app',
              ),
              TaskCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
