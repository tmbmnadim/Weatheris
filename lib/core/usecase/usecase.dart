abstract class UseCase<Type, Params> {
  Future<Type> call({
    required double latitude,
    required double longitude,
    String? language,
  });
}
