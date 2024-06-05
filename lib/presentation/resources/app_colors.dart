part of presentation_resource;

class AppColors {
  static const Color black = Color.fromARGB(1000, 29, 29, 29);
  static const Color gray = Color.fromARGB(1000, 188, 188, 188);
  static const Color grayLight = Color.fromARGB(1000, 238, 238, 239);
  static const Color white = Color.fromARGB(1000, 255, 255, 255);
  static const Color main = Color.fromARGB(1000, 207, 73, 126);
  static const LinearGradient gradient = LinearGradient(
    colors: [
      Color.fromARGB(1000, 230, 150, 51),
      Color.fromARGB(1000, 207, 73, 126),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Color errorRed = Color.fromARGB(1000, 237, 62, 62);
  static const Color blue = Color.fromARGB(1000, 64, 158, 255);
}
