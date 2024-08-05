import 'package:interntask/domain/repository/category_image_repository.dart';
import '../models/image/category_image_model.dart';

class ImageCategoryRepositoryImpl implements CategoryImageRepository {
  final List<CategoryImageModel> _images = [
    CategoryImageModel(
      imagePath: 'assets/images/4.jpg',
      description: 'Oil paintings',
    ),
    CategoryImageModel(
      imagePath: 'assets/images/1.jpg',
      description: 'Museums',
    ),
    CategoryImageModel(
      imagePath: 'assets/images/2.jpg',
      description: 'Wall arts',
    ),
    CategoryImageModel(
      imagePath: 'assets/images/3.jpg',
      description: 'Wall arts',
    ),
    CategoryImageModel(
      imagePath: 'assets/images/4.jpg',
      description: 'Wall arts',
    ),
    CategoryImageModel(
      imagePath: 'assets/images/1.jpg',
      description: 'Wall arts',
    ),
    CategoryImageModel(
      imagePath: 'assets/images/2.jpg',
      description: 'Wall arts',
    ),

  ];

  @override
  List<CategoryImageModel> getImages() => _images;
}

