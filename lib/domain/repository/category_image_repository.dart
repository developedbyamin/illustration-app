import 'package:interntask/data/models/image/category_image_model.dart';

abstract class CategoryImageRepository {
  List<CategoryImageModel> getImages();
}
