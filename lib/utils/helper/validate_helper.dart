class ValidateHelper {
  ValidateHelper._();
  static final ValidateHelper _singleton = ValidateHelper._();
  factory ValidateHelper() => _singleton;

  ///title validation
  static String? titleValidation(String? text) {
    if (text == null && text!.isEmpty) {
      return "Title is required";
    }

    return null;
  }

  /// noted validation
  static String? notedValidation(String? text) {
    if (text == null && text!.isEmpty) {
      return "Noted is required";
    }
    return null;
  }
}
