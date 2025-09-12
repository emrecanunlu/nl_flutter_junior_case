import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';

class UploadPhotoController extends BaseController {
  Rx<String?> selectedImagePath = Rx<String?>(null);

  void onPhotoPickerTap() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (photo != null) {
      selectedImagePath.value = photo.path;
    }
  }

  void clearSelectedImagePath() {
    selectedImagePath.value = null;
  }
}
