import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'tr_TR': {
      'screen.login.title': 'Giriş Yap',
      'screen.login.subtitle': 'Kullancı bilgilerinle giriş yap',
      'common.email': 'E-Posta',
      'common.password': 'Şifre',
      'common.forgotPassword': 'Şifre Unuttum',
      'common.signIn': 'Giriş Yap',
    },
  };
}
