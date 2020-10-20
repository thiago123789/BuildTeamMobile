class PrimitiveWrapper {
  int value;

  PrimitiveWrapper(this.value);

  @override
  String toString() {
    return value.toString();
  }
}

class Integer {
  int value;

  Integer();

  Integer.int(this.value);

  @override
  String toString() {
    return value.toString();
  }
}
