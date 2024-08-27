// lib/utils/date_extensions.dart

extension DateTimeExtensions on DateTime {
  String toShortDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}
