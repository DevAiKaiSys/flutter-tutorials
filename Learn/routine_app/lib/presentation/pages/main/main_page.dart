import 'package:flutter/material.dart';
import 'package:routine_app/domain/entities/routine.entity.dart';
import 'package:routine_app/domain/repositories/routine_repository.dart';
import 'package:routine_app/injection_container.dart';
import 'package:routine_app/presentation/pages/routine/create_routine/create_routine_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final routineRepository = getIt.get<RoutineRepository>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Routine"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateRoutinePage()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: routineRepository
            .getRoutines(), // Replace fetchData with your actual function fetching data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Data fetched successfully, build cards
            List<RoutineEntity> routines = snapshot.data!;
            return _buildWidgets(routines);
          }
        },
      ),
    );
  }

  ListView _buildWidgets(List<RoutineEntity> routines) {
    return ListView.builder(
      itemCount: routines.length,
      itemBuilder: (context, i) {
        return Card(
          elevation: 4.0,
          child: ListTile(
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 2.0),
                child: Text(
                  routines[i].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                      const WidgetSpan(child: Icon(Icons.schedule, size: 16)),
                      TextSpan(text: routines[i].startTime)
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        children: [
                      const WidgetSpan(
                          child: Icon(
                        Icons.calendar_month,
                        size: 16,
                      )),
                      TextSpan(text: routines[i].day)
                    ])),
              )
            ]),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        );
      },
    );
  }
}
