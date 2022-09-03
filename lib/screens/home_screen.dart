import 'package:flutter/material.dart';
import 'package:to_do_app/database_helper.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/screens/screens.dart';
import 'package:to_do_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataBaseHelper _dataBaseHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TaskScreen();
              },
            ),
          );
        },
        backgroundColor: Color(0xFF7349FE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 60,
                  alignment: Alignment.topLeft,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Expanded(
                child: FutureBuilder(
                  initialData: const [],
                  future: _dataBaseHelper.getTasks(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data.length!,
                      itemBuilder: (context, index) {
                        return TaskCardWidget(
                          title: snapshot.data[index].title,
                          description: snapshot.data[index].description,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// TaskCardWidget(
//   title: 'Get Started!',
//   description:
//       'Hello User! Welcome to DoIT app, this is a default task that you can edit or delete to start using the app',
// ),
