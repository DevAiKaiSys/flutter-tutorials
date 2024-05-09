import 'package:flutter/material.dart';
import 'package:routine_app/domain/entities/category.entity.dart';
import 'package:routine_app/domain/entities/routine.entity.dart';
import 'package:routine_app/domain/repositories/category_repository.dart';
import 'package:routine_app/domain/repositories/routine_repository.dart';
import 'package:routine_app/injection_container.dart';

class CreateRoutinePage extends StatefulWidget {
  const CreateRoutinePage({super.key});

  @override
  State<CreateRoutinePage> createState() => _CreateRoutinePageState();
}

class _CreateRoutinePageState extends State<CreateRoutinePage> {
  final categoryRepository = getIt.get<CategoryRepository>();
  final routineRepository = getIt.get<RoutineRepository>();
  /*List<String> categories = ['work', 'school', 'home'];
  String dropdownValue = 'work';*/
  CategoryEntity? dropdownValue;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _newCatController = TextEditingController();
  List<String> days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];
  String dropdownDay = "monday";
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(title: const Text("Create routine")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // width 70% width screen
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: /*DropdownButton(
                    focusColor: const Color(0xffffffff),
                    dropdownColor: const Color(0xffffffff),
                    isExpanded: true,
                    value: dropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: categories
                        .map<DropdownMenuItem<String>>((String nvalue) {
                      return DropdownMenuItem<String>(
                          value: nvalue, child: Text(nvalue));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  )*/
                      FutureBuilder(
                    future: categoryRepository.getCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(); // Show loading indicator while fetching data.
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<CategoryEntity>? categories = snapshot.data;
                        return _buildDropdownButton(categories);
                      }
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text("New Category"),
                                content: TextFormField(
                                    controller: _newCatController),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        if (_newCatController.text.isNotEmpty) {
                                          _addCategory();
                                          // Close the AlertDialog
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text("Add"))
                                ],
                              ));
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child:
                  Text("Title", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              controller: _titleController,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text("Start Time",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                    controller: _timeController,
                    enabled: false,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _selectedTime(context);
                    },
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text("Day", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: DropdownButton(
                isExpanded: true,
                value: dropdownDay,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: days.map<DropdownMenuItem<String>>((String day) {
                  return DropdownMenuItem<String>(value: day, child: Text(day));
                }).toList(),
                onChanged: (String? newDay) {
                  setState(() {
                    dropdownDay = newDay!;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _addRoutine();
                },
                child: const Text("Add"),
              ),
            )
          ]),
        ),
      ),
    );
  }

  DropdownButton _buildDropdownButton(List<CategoryEntity>? categories) {
    return DropdownButton<CategoryEntity>(
      focusColor: const Color(0xffffffff),
      dropdownColor: const Color(0xffffffff),
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: categories
          ?.map<DropdownMenuItem<CategoryEntity>>((CategoryEntity nvalue) {
        return DropdownMenuItem<CategoryEntity>(
            value: nvalue, child: Text(nvalue.name));
      }).toList(),
      onChanged: (CategoryEntity? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    );
  }

  _selectedTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial);

    if (timeOfDay != null && timeOfDay != selectedTime) {
      selectedTime = timeOfDay;
      setState(() {
        _timeController.text =
            "${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.name}";
      });
    }
  }

  //create category record
  _addCategory() async {
    final newCategory = CategoryEntity(_newCatController.text);

    categoryRepository.saveCategory(newCategory);

    _newCatController.clear();
    setState(() {
      // refresh page read all categories & select new category
      dropdownValue = newCategory;
    });
  }

  _addRoutine() async {
    final newRoutine = RoutineEntity(
      title: _titleController.text,
      startTime: _timeController.text,
      day: dropdownDay,
      category: dropdownValue,
    );

    routineRepository.saveRoutine(newRoutine);

    _titleController.clear();
    _timeController.clear();
    setState(() {
      dropdownDay = "monday";
      dropdownValue = null;
    });
  }
}
