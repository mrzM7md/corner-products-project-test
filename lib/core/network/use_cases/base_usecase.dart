abstract class BaseUseCase<T, Parameters>{
  T call({required Parameters parameters});
}