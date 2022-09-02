import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String? title;
  final String? description;
  const TaskCardWidget({Key? key, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title != null ? title! : '( Unnamed Task )',
            style: TextStyle(
              color: Color(0xFF211551),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description != null ? description! : 'No Description Added',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF86829D),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
