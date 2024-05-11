import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_bloc/core/const.dart';
import 'package:hive_bloc/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:hive_bloc/features/cart/data/model/Cart_Product_model.dart';
import 'package:hive_bloc/features/cart/data/repositories/cart_repository_imp.dart';
import 'package:hive_bloc/features/cart/domain/repositories/cart_repostiory.dart';
import 'package:hive_bloc/features/cart/domain/usecase/cart_usecases.dart';
import 'package:hive_bloc/features/cart/presentation/bloc/cart_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => CartBloc(
      getCartUseCase: sl(),
      addToCartUseCase: sl(),
      deletFromCartUseCase: sl(),
      editToCartCartUseCase: sl(),
      cartIncreaseUseCase: sl(),
      cartDecreaseUseCase: sl()));

  // Usecases
  sl.registerLazySingleton(() => GetCartUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => AddToCartUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => DeletFromCartUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => EditToCartCartUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => CartIncreaseUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => CartDecreaseUseCase(repostiory: sl()));

  // Repository
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(cartlocalDataSource: sl()));

  // Datasources ProductsLocalDataSource
  sl.registerLazySingleton<CartlocalDataSource>(
      () => CartlocalDataSourceHive(box: sl()));

  // Core

  // External
  final cartBox = await Hive.openBox<CartProductModel>(boxName);
  sl.registerLazySingleton(() => cartBox);
}
