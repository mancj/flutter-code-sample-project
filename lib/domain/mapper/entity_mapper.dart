abstract class EntityMapper<S, T> {
  T map(S model);

  S reverseMap(T model) {
    throw UnimplementedError("Reverse map function is not implemented for this mapper");
  }
}
