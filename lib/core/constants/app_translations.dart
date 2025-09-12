import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'tr_TR': {
      'screen.login.title': 'Giriş Yap',
      'screen.login.subtitle': 'Kullancı bilgilerinle giriş yap',

      'screen.register.title': 'Hesap Oluştur',
      'screen.register.subtitle': 'Kullancı bilgilerini girerek kaydol',

      'common.email': 'E-Posta',
      'common.password': 'Şifre',
      'common.confirmPassword': 'Şifre Tekrar',
      'common.fullName': 'Ad Soyad',

      'common.forgotPassword': 'Şifre Unuttum',
      'common.signIn': 'Giriş Yap',
      'common.signUp': 'Kayıt Ol',

      'validation.required': 'Bu alan zorunludur',
      'validation.invalidEmail': 'Geçersiz e-posta adresi',
      'validation.password': 'Şifre en az @length karakter olmalıdır',
      'validation.minLength': 'Ad soyad en az @length karakter olmalıdır',
      'validation.confirmPassword': 'Şifreler eşleşmiyor',
      'validation.invalidConfirmPassword': 'Şifreler eşleşmiyor',
      'validation.invalidPassword': 'Şifre en az @length karakter olmalıdır',
    },
  };
}
