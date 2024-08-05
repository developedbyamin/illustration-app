import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interntask/core/configs/theme/app_colors.dart';
import 'package:interntask/domain/repository/category_image_repository.dart';
import 'package:interntask/presentation/illustrations/widgets/category_widget.dart';
import 'package:interntask/presentation/illustrations/widgets/grid_view_widget.dart';
import 'package:provider/provider.dart';
import '../../data/repository/image_category_rep_impl.dart';
import '../../domain/repository/grid_view_image_repository.dart';

class IllustrationPage extends StatelessWidget {
  const IllustrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gridImageRepository = Provider.of<ImageRepository>(context);
    final images = gridImageRepository.getImages();

    // final imageRepository = ImageCategoryRepositoryImpl();
    final imageRepository = Provider.of<CategoryImageRepository>(context);



    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset('assets/vectors/back.svg',),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0,),
            child: Column(
              children: [
                Text(
                  'Illustrations',
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'TTNorms',
                    color: Color(0xFF474747),
                  ),
                ),
                Text(
                  'C U R A T E D  G A L L E R I E S',
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: 14,
                    color: Color(0xFF686868)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16,),
          _buildCategoryRow(imageRepository),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridViewWidget(images: images,),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRow(imageRepository) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 150.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageRepository.getImages().length,
          itemBuilder: (context, index) {
            final item = imageRepository.getImages()[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CategoryWidget(imagePath: item.imagePath, description: item.description,),
            );
          },
        ),
      ),
    );
  }
}
