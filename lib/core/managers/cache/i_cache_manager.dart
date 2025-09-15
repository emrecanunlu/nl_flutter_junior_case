import 'package:jr_case_boilerplate/core/base/base_model.dart';

abstract class ICacheManager {
  Future<void> saveString(String key, String value);
  String? getString(String key);

  Future<void> saveModel<T extends BaseModel>(String key, T model);
  T? getModel<T extends BaseModel>(String key, T model);

  Future<bool> remove(String key);
}
