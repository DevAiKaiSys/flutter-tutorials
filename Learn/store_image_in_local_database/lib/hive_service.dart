import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_image_in_local_database/database_adapter.dart';

class HiveService extends DatabaseAdapter {
  @override
  Future<List<Uint8List>> getImages() async {
    var box = await Hive.openBox('imageBox');

    /*List<dynamic> result = box.get('images');

    return result.cast<Uint8List>();*/
    // Check if the value exists in the box
    if (box.containsKey('images')) {
      var result = box.get('images');

      // Check if the result is not null
      if (result != null) {
        // Cast each element to Uint8List
        return result.cast<Uint8List>();
      }
    }
    // Return an empty list if the value is not found or null
    return [];
  }

  @override
  Future<void> storeImage(Uint8List imageBytes) async {
    List<Uint8List> images = [];

    // Open the box
    var box = await Hive.openBox('imageBox');

    List<dynamic>? allImages = box.get('images');

    // https://dart.dev/effective-dart/usage#dont-use-cast-when-a-nearby-operation-will-do
    if (allImages != null) {
      images.addAll(allImages.cast<Uint8List>());
    }

    images.add(imageBytes);
    box.put("images", images);
  }
}
