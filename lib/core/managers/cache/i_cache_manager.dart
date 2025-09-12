import 'package:jr_case_boilerplate/core/base/base_model.dart';

abstract class ICacheManager<T extends BaseModel<T>> {
  Future<void> saveString(String key, String value);
  String? getString(String key);

  Future<void> saveModel(String key, T model);
  T? getModel(String key, T model);

  Future<void> remove(String key);
}
