import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/core/configs/theme/app_colors.dart';
import 'package:interntask/presentation/root/bottom_navigation_bar/bloc/bottom_nav_bloc.dart';
import 'package:interntask/presentation/root/root.dart';
import 'package:provider/provider.dart';
import 'data/repository/grid_view_image_rep_impl.dart';
import 'domain/repository/grid_view_image_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBloc>(create: (context) => BottomNavBloc()),
      ],

      child: MultiProvider(
        providers: [
          Provider<ImageRepository>(create: (_) => ImageRepositoryImpl()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Intern Task',
          home: Root(),
        ),
      ),
    );
  }
}

