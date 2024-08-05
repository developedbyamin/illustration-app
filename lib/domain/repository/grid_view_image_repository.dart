import 'package:interntask/data/models/image/grid_view_image_model.dart';

abstract class ImageRepository {
  List<GridViewImageModel> getImages();
}
