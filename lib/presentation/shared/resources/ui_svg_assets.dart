// ignore_for_file: non_constant_identifier_names

class UISVGAssets {
  static final timer = _path("timer");
  static final bookmark = _path("bookmark");
  static final no_wifi = _path("no_wifi");
  static final salad = _path("salad");
  static final soup = _path("soup");

  static String _path(String svgPath) {
    return "assets/svg/$svgPath.svg";
  }
}
