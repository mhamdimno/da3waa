import '../my_res.dart';

extension ListOptionalsExtentions on List? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
  bool  validateInputs() {
    if (this.isNullOrEmpty) {
      return true;
    } else {

      return (this!
          .where((value) =>
      value == false ||
          value == null ||
          value == "null" ||
          value.toString().trim().isEmpty)
          .toList()
          .isEmpty)
          && (this!
              .where((value) => (value is TextEditingController)&&
              value.text.trim().isEmpty)
              .toList()
              .isEmpty);
    }
  }

}
extension MyIterable<E> on Iterable<E> {
  Iterable<E> sortedBy(Comparable key(E e)) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));
}