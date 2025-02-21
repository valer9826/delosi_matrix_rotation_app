import 'package:get_it/get_it.dart';
import '../../data/repositories/matrix_repository_impl.dart';
import '../../domain/repositories/matrix_repository.dart';
import '../../domain/usecases/rotate_matrix_usecase.dart';
import '../../domain/usecases/rotate_matrix_usecase_impl.dart';
import '../../presentation/state/matrix_provider.dart';

final GetIt sl = GetIt.instance;

void setupDependencies() {
  sl.registerLazySingleton<MatrixRepository>(() => MatrixRepositoryImpl());

  sl.registerLazySingleton<RotateMatrixUseCase>(() => RotateMatrixUseCaseImpl(sl<MatrixRepository>()));

  sl.registerFactory(() => MatrixProvider(sl<RotateMatrixUseCase>()));
}
