import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_bloc/core/app_routes.dart';
import 'package:hive_bloc/core/route_generator.dart';
import 'package:hive_bloc/features/cart/data/model/Cart_Product_model.dart';
import 'package:hive_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<CartProductModel>(CartProductModelAdapter());

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<CartBloc>(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        initialRoute: AppRoutes.home,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
