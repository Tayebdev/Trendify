class AppValidator {
  static String? validateEmptyText(fieldName, value) {
    if (value.isEmpty || value == null) {
      return '$fieldName is required';
    }
    return null;
  }
}
