import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';
import 'package:jr_case_boilerplate/core/helpers/bottom_sheet/bottom_sheet_helpers.dart';
import 'package:jr_case_boilerplate/core/helpers/bottom_sheet/bottom_sheet_helpers_impl.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';
import 'package:jr_case_boilerplate/core/models/movie/movie_model.dart';
import 'package:jr_case_boilerplate/core/models/offer_package_model.dart';
import 'package:jr_case_boilerplate/core/models/user/response/user_model.dart';
import 'package:jr_case_boilerplate/core/services/movie_service.dart';
import 'package:jr_case_boilerplate/core/widgets/bottom_sheet/offer_bottom_sheet.dart';

class ProfileController extends BaseController {
  final BottomSheetHelpers _bottomSheetHelpers = BottomSheetHelpersImpl();
  final AuthManager _authManager = AuthManager.instance;
  final MovieService _movieService = MovieService.instance;

  final List<OfferPackageModel> offerPackages = [
    OfferPackageModel(
      percentage: 10,
      oldAmount: 200,
      newAmount: 300,
      weeklyPrice: 99.99,
    ),
    OfferPackageModel(
      percentage: 70,
      oldAmount: 2000,
      newAmount: 3375,
      weeklyPrice: 799.99,
      isPopular: true,
    ),
    OfferPackageModel(
      percentage: 35,
      oldAmount: 1000,
      newAmount: 1350,
      weeklyPrice: 779.99,
    ),
  ];

  UserModel get user => _authManager.user;

  RxList<MovieModel> favoriteMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavoriteMovies();
  }

  Future<void> loadFavoriteMovies() async {
    try {
      setLoading(true);

      final result = await _movieService.getFavoriteMovies();
      favoriteMovies.clear();
      favoriteMovies.addAll(result.data);
    } catch (e) {
      debugPrint('loadFavoriteMovies error: $e');
    } finally {
      setLoading(false);
    }
  }

  void showOfferBottomSheet(BuildContext context) {
    _bottomSheetHelpers.offerBottomSheet(
      context,
      OfferBottomSheet(onClose: () => Get.back(), offerPackages: offerPackages),
    );
  }
}
