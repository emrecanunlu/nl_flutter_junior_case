import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  static final Locale locale = const Locale('tr', 'TR');

  /*   // Network hataları
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return 'error.connectionTimeout'.tr;
      case DioExceptionType.sendTimeout:
        return 'error.sendTimeout'.tr;
      case DioExceptionType.receiveTimeout:
        return 'error.connectionTimeout'.tr;
      case DioExceptionType.connectionError:
        return 'error.connectionError'.tr;
      default:
        return 'error.unknownError'.tr;
    }
  }

  String _getLocalizedMessage(String backendMessage) {
    switch (backendMessage) {
      case 'INVALID_CREDENTIALS':
        return 'error.invalidCredentials'.tr;
      case 'USER_NOT_FOUND':
        return 'error.userNotFound'.tr;
      case 'EMAIL_ALREADY_EXISTS':
        return 'error.emailAlreadyExists'.tr;
      default:
        return 'error.unknownError'.tr;
    }
  } */

  @override
  Map<String, Map<String, String>> get keys => {
    'tr_TR': {
      'screen.login.title': 'Giriş Yap',
      'screen.login.subtitle': 'Kullancı bilgilerinle giriş yap',

      'screen.register.title': 'Hesap Oluştur',
      'screen.register.subtitle': 'Kullancı bilgilerini girerek kaydol',

      'screen.uploadPhoto.title': 'Profil Detayı',
      'screen.uploadPhoto.uploadTitle': 'Fotoğraf Yükle',
      'screen.uploadPhoto.uploadSubtitle':
          'Profil fotoğrafın için görsel yükleyebilirsin',

      "error.termsAndConditions":
          "Lütfen kullanıcı sözleşmesini okuyup kabul ediniz!",

      "error.connectionTimeout":
          "Bağlantı zaman aşımı, lütfen tekrar deneyiniz.",
      "error.sendTimeout": "Gönderim zaman aşımı, lütfen tekrar deneyiniz.",
      "error.connectionError": "Bağlantı hatası, lütfen tekrar deneyiniz.",
      "error.unknownError": "Bilinmeyen hata, lütfen tekrar deneyiniz.",
      "error.invalidCredentials":
          "Geçersiz kimlik bilgileri, lütfen tekrar deneyiniz.",
      "error.userNotFound": "Kullanıcı bulunamadı, lütfen tekrar deneyiniz.",
      "error.emailAlreadyExists": "E-posta zaten mevcut.",

      "common.noFavoriteMovies": "Beğendiniz bir film bulunamadı.",
      "common.bonusPremium": "Premium Hesap",
      "common.bonusMatch": "Daha Fazla Eşleşme",
      "common.bonusHighlight": "Öne Çıkarma",
      "common.bonusLikes": "Daha Fazla Beğeni",
      "common.offerPackageListTitle":
          "Kilidi açmak için bir jeton paketi seçin",
      "common.jeton": "Jeton",
      "common.weeklyPrice": "Başına haftalık",
      "common.viewAllJetons": "Tüm Jetonları Gör",
      "common.offerSubtitle":
          "Jeton paketin’ni seçerek bonus kazanın ve yeni bölümlerin kilidini açın!",
      "common.bonusListTitle": "Alacağınız Bonuslar",

      "common.hasNoAccount": "Hesabın yok mu? ",
      "common.hasAccount": "Hesabın var mı? ",

      "common.termsAndConditions": "Kullanıcı sözleşmesinı ",
      "common.termsAndConditionsButton": "Okudum ve Kabul ediyorum. ",
      "common.termsAndConditionsSubtitle":
          " Bu sözleşmeyi okuyarak devam ediniz lütfen.",

      'common.profile': 'Profil',
      'common.limitedOffer': 'Sınırlı Teklif',
      'common.addPhoto': 'Fotoğraf Ekle',

      'common.email': 'E-Posta',
      'common.password': 'Şifre',
      'common.confirmPassword': 'Şifre Tekrar',
      'common.fullName': 'Ad Soyad',

      'common.continue': 'Devam Et',
      'common.skip': 'Atla',
      'common.forgotPassword': 'Şifre Unuttum',
      'common.signIn': 'Giriş Yap',
      'common.signUp': 'Kayıt Ol',
      'common.registerSuccess': 'Kayıt başarılı, giriş yapabilirsiniz.',

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
