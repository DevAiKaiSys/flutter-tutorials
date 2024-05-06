import 'package:isar/isar.dart';

part 'image_entity.g.dart';

@Collection()
class ImageEntity {
  Id? id;
  List<int> image;

  ImageEntity({required this.image});
}
