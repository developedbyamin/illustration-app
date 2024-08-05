import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/configs/theme/app_colors.dart';
import '../illustrations/illustration_page.dart';
import 'bottom_navigation_bar/bloc/bottom_nav_bloc.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: context.read<BottomNavBloc>().state.selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: BlocListener<BottomNavBloc, BottomNavState>(
        listener: (context, state) {
          _pageController.jumpToPage(state.selectedIndex);
        },
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            context.read<BottomNavBloc>().add(ChangeBottomNavEvent(index));
          },
          children: const [
            Page1(),
            IllustrationPage(),
            Page3(),
            Page4(),
          ],
        ),
      ),
      floatingActionButton: const FlActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return CustomBottomNavigationBar(selectedIndex: state.selectedIndex);
        },
      ),
    );
  }
}

class FlActionButton extends StatelessWidget {
  const FlActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: const BoxDecoration(
        gradient: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: const Icon(Icons.add, color: Colors.white, size: 32,),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavigationBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(40.0),
      ),
      child: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/vectors/menu_1.svg',
                    colorFilter: ColorFilter.mode(
                        selectedIndex == 0 ? Colors.orangeAccent : Colors.grey,
                        BlendMode.srcIn),
                  ),
                  onPressed: () {
                    context.read<BottomNavBloc>().add(
                          ChangeBottomNavEvent(0),
                        );
                  },
                ),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/vectors/menu_2.svg',
                    colorFilter: ColorFilter.mode(
                        selectedIndex == 1 ? Colors.orangeAccent : Colors.grey,
                        BlendMode.srcIn),
                  ),
                  onPressed: () {
                    context.read<BottomNavBloc>().add(
                          ChangeBottomNavEvent(1),
                        );
                  },
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/vectors/menu_3.svg',
                    colorFilter: ColorFilter.mode(
                        selectedIndex == 2 ? Colors.orangeAccent : Colors.grey,
                        BlendMode.srcIn),
                  ),
                  color: selectedIndex == 2 ? Colors.orangeAccent : Colors.grey,
                  onPressed: () {
                    context.read<BottomNavBloc>().add(
                          ChangeBottomNavEvent(2),
                        );
                  },
                ),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/vectors/menu_4.svg',
                    colorFilter: ColorFilter.mode(
                        selectedIndex == 3 ? Colors.orangeAccent : Colors.grey,
                        BlendMode.srcIn),
                  ),
                  color: selectedIndex == 3 ? Colors.orangeAccent : Colors.grey,
                  onPressed: () {
                    context.read<BottomNavBloc>().add(
                          ChangeBottomNavEvent(3),
                        );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 1'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 3'),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 4'),
      ),
    );
  }
}
