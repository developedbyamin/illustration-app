import 'package:interntask/data/models/image/grid_view_image_model.dart';
import '../../domain/repository/grid_view_image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  @override
  List<GridViewImageModel> getImages() {
    return [
      GridViewImageModel(path: 'assets/images/grid1.png'),
      GridViewImageModel(path: 'assets/images/grid2.jpg'),
      GridViewImageModel(path: 'assets/images/grid3.jpg'),
      GridViewImageModel(path: 'assets/images/grid4.jpg'),
      GridViewImageModel(path: 'assets/images/grid1.png'),
      GridViewImageModel(path: 'assets/images/grid2.jpg'),
      GridViewImageModel(path: 'assets/images/grid3.jpg'),
      GridViewImageModel(path: 'assets/images/grid4.jpg'),
      GridViewImageModel(path: 'assets/images/grid1.png'),
      GridViewImageModel(path: 'assets/images/grid2.jpg'),
      GridViewImageModel(path: 'assets/images/grid3.jpg'),
      GridViewImageModel(path: 'assets/images/grid4.jpg'),
    ];
  }
}
