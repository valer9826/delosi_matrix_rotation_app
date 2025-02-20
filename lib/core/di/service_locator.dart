import 'package:get_it/get_it.dart';
import '../../data/repositories/matrix_repository_impl.dart';
import '../../domain/repositories/matrix_repository.dart';
import '../../domain/usecases/rotate_matrix_usecase.dart';
import '../../presentation/state/matrix_provider.dart';

final GetIt sl = GetIt.instance;

void setupDependencies() {
  //Repositorio
  sl.registerLazySingleton<MatrixRepository>(() => MatrixRepositoryImpl());

  //Caso de uso
  sl.registerLazySingleton(() => RotateMatrixUseCase(sl<MatrixRepository>()));

  //Provider
  sl.registerFactory(() => MatrixProvider(sl<RotateMatrixUseCase>()));
}
