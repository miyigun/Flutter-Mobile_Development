class SingSongModel{
  int? id;
  String sing;
  String? singer;

  SingSongModel(this.id, this.sing, this.singer);

  @override
  String toString() {
    return 'SingSongModel{id: $id, sing: $sing, singer: $singer}';
  }
}