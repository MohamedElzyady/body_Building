import 'package:body_buliding/core/utils/app_router.dart';
import 'package:body_buliding/core/utils/app_theme.dart';
import 'package:body_buliding/features/exercises/data/weight_repository.dart';
import 'package:body_buliding/features/exercises/view_model/cubit/weight_cubit.dart';
import 'package:body_buliding/features/user/data/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              UserCubit(UserRepository(prefs))..loadUser(),
        ),
        BlocProvider(
          create: (context) =>
              WeightCubit(WeightRepository(prefs))..loadWeights(),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'IronFit',
      ),
    );
  }
}

