extension Regex on String {
  String? get validateEmail {
    String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (isEmpty || !regex.hasMatch(this)) {
      return 'Entered email format is wrong.';
    } else {
      return null;
    }
  }

  String? get validatePassword {
    if (length < 6) {
      return "Please insert minimum 6 characters";
    } else {
      null;
    }
    return null;
  }
}
