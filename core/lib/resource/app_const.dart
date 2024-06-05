part of core;

class AppConst {
  static const String baseUrl = 'https://gallery.prod1.webant.ru';
  static const String registerUrl = '/api/users';
  static const String loginUrl = '/oauth/v2/token';
  static const String refreshUrl = '/oauth/v2/token';
  static const String photosUrl = '/api/photos';
  static const String userIdUrl = '/api/users/{id}';
  static const String updatePasswordUrl = '/api/users/update_password/{id}';
  static const String mediaObjectUrl = '/api/media_objects';
  static const String currentUserUrl = '/api/users/current/';
  static const String clientId = '1_3fxvjh2ky7s44cskwcgo0k8cwwogkocs8k4cwcwsg0skcsw4ok';
  static const String clientSecret = '4tf1qez2dc4ksg8w4og4co4w40s0gokwwkwkss8gc400owkokc';
  static const String phoneMaskString = '+7(###) ###-##-##';
  static const String dateMaskString = '##.##.####';
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static const int limitOfMedia = 10;
  static const int limitUserMedia = 28;
  static const String grantTypeForLogin = 'password';
  static const String grantTypeForRefresh = 'refresh_token';
  static const String empty = '';
  static const String enLocale = 'en';
  static const String ruLocale = 'ru';
  static final Map<String, RegExp> numberRegExp = {"#": RegExp(r'[0-9]')};
  static final phoneMask = MaskTextInputFormatter(
    mask: phoneMaskString,
    filter: numberRegExp,
  );
  static final dateMask = MaskTextInputFormatter(
    mask: dateMaskString,
    filter: numberRegExp,
  );
}
