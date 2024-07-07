// ignore_for_file: non_constant_identifier_names

class UIImages {
  static final sample = _jpg("splash");

  static String _png(String img) {
    return "assets/img/$img.png";
  }

  static String _jpg(String img) {
    return "assets/img/$img.jpg";
  }
}
