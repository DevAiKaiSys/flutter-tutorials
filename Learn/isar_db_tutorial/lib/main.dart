import 'package:flutter/material.dart';
import 'package:isar_db_tutorial/course_detail_page.dart';
import 'package:isar_db_tutorial/course_modal.dart';
import 'package:isar_db_tutorial/entities/course.dart';
import 'package:isar_db_tutorial/isar_service.dart';
import 'package:isar_db_tutorial/student_modal.dart';
import 'package:isar_db_tutorial/teacher_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher Database',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final service = IsarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isar DB Tutorial'), actions: [
        IconButton(
          onPressed: () => service.cleanDb(),
          icon: const Icon(Icons.delete),
        )
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<List<Course>>(
                stream: service.listenToCourses(),
                builder: (context, snapshot) => GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  scrollDirection: Axis.horizontal,
                  children: snapshot.hasData
                      ? snapshot.data!.map((course) {
                          return ElevatedButton(
                            onPressed: () {
                              CourseDetailPage.navigate(
                                  context, course, service);
                            },
                            child: Text(course.title),
                          );
                        }).toList()
                      : [],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CourseModal(service);
                  });
            },
            child: const Text("Add Course"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return StudentModal(service);
                  });
            },
            child: const Text("Add Student"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return TeacherModal(service);
                  });
            },
            child: const Text("Add Teacher"),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
