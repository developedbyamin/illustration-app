import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interntask/presentation/overview/state/favorite_state.dart';
import 'package:provider/provider.dart';
import 'package:interntask/core/configs/theme/app_colors.dart';

class OverviewPage extends StatelessWidget {
  final String imagePath;

  const OverviewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoriteState(),
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundImage(imagePath: imagePath),
            const OverViewPageIcons(),
            const BottomContainer(),
            const GetDetails(),
          ],
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/vectors/menu_3.svg'),
            const SizedBox(width: 8),
            const Text(
              'Digital Illustration',
              style: TextStyle(
                fontFamily: 'TTNorms',
                color: Color(0xFF999999),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetDetails extends StatelessWidget {
  const GetDetails({
    super.key,
  });

  void showGradientDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'This is a illustrator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'TTNorms',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close', style: TextStyle(color: Colors.orange),),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.09,
      left: (MediaQuery.of(context).size.width - 163) / 2,
      child: GestureDetector(
        onTap: () {
          showGradientDialog(context);
        },
        child: Container(
          height: 41,
          width: 163,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: AppColors.primary,
          ),
          child: const Center(
            child: Text(
              'Overview',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'TTNorms',
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class OverViewPageIcons extends StatelessWidget {
  const OverViewPageIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/vectors/back.svg',
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          Consumer<FavoriteState>(
            builder: (context, favoriteState, _) {
              return IconButton(
                onPressed: () {
                  favoriteState.toggleFavorite();
                },
                icon: Icon(
                  Icons.favorite,
                  color: favoriteState.isFavorite ? Colors.red : Colors.white,
                  size: 28,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
