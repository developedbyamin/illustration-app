import 'package:flutter/material.dart';
import 'package:interntask/data/models/image/grid_view_image_model.dart';

import '../../overview/overview_page.dart';


class GridViewWidget extends StatelessWidget {
  final List<GridViewImageModel> images;

  const GridViewWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              if (index % 2 == 0) {
                return RowOne(index: index, images: images);
              } else {
                return RowTwo(index: index, images: images);
              }
            },
            childCount: (images.length - 2).ceil(),
          ),
        ),
      ],
    );
  }
}

class RowTwo extends StatelessWidget {
  final int index;
  final List<GridViewImageModel> images;

  const RowTwo({super.key, required this.index, required this.images});

  @override
  Widget build(BuildContext context) {
    final nextIndex = index + 1;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OverviewPage(
                        imagePath: images[index].path,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: height * 0.2,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      images[index].path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OverviewPage(
                        imagePath: images[nextIndex].path,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: height * 0.2,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      images[nextIndex].path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OverviewPage(
                    imagePath: images[nextIndex + 1].path,
                  ),
                ),
              );
            },
            child: Container(
              height: height * 0.408,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  images[nextIndex + 1].path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RowOne extends StatelessWidget {
  final int index;
  final List<GridViewImageModel> images;

  const RowOne({super.key, required this.index, required this.images});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OverviewPage(
              imagePath: images[index].path,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: height * 0.25,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              images[index].path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
