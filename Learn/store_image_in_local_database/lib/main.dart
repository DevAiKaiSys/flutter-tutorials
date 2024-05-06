import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_image_in_local_database/database_adapter.dart';
import 'package:store_image_in_local_database/isar_service.dart';

Future<void> main() async {
  /*await Hive.initFlutter();*/
  /*await Hive.initFlutter((await getApplicationSupportDirectory()).path);*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image save on Hive',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Image save on Hive'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*final DatabaseAdapter adapter = HiveService();*/
  late DatabaseAdapter adapter = IsarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Uint8List>>(
        future: _readImagesFromDatabase(),
        builder: (context, AsyncSnapshot<List<Uint8List>> snapshot) {
          if (snapshot.hasError) {
            return Text("Error appeared ${snapshot.error}");
          }

          if (snapshot.hasData) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Text("Nothing to show");
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Image.memory(
                snapshot.data![index],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    Uint8List imageBytes = await image.readAsBytes();
    await adapter.storeImage(imageBytes);
    setState(() {});
  }

  Future<List<Uint8List>> _readImagesFromDatabase() async {
    return adapter.getImages();
  }
}
