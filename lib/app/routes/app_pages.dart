import 'package:get/get.dart';

import '../modules/allFishermanTeam/bindings/all_fisherman_team_binding.dart';
import '../modules/allFishermanTeam/views/all_fisherman_team_view.dart';
import '../modules/allNewOffer/bindings/all_new_offer_binding.dart';
import '../modules/allNewOffer/views/all_new_offer_view.dart';
import '../modules/allProvince/bindings/all_province_binding.dart';
import '../modules/allProvince/views/all_province_view.dart';
import '../modules/balance/bindings/balance_binding.dart';
import '../modules/balance/views/balance_view.dart';
import '../modules/deposit/bindings/deposit_binding.dart';
import '../modules/deposit/views/deposit_view.dart';
import '../modules/editPersonalData/bindings/edit_personal_data_binding.dart';
import '../modules/editPersonalData/views/edit_personal_data_view.dart';
import '../modules/editProfile/bindings/edit_profile_binding.dart';
import '../modules/editProfile/views/edit_profile_view.dart';
import '../modules/fishermanDetail/bindings/fisherman_detail_binding.dart';
import '../modules/fishermanDetail/views/fisherman_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/howtopayDeposit/bindings/howtopay_deposit_binding.dart';
import '../modules/howtopayDeposit/views/howtopay_deposit_view.dart';
import '../modules/investNow/bindings/invest_now_binding.dart';
import '../modules/investNow/views/invest_now_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/portfolio/bindings/portfolio_binding.dart';
import '../modules/portfolio/views/portfolio_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';
import '../modules/withdrawal/bindings/withdrawal_binding.dart';
import '../modules/withdrawal/views/withdrawal_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PORTFOLIO,
      page: () => PortfolioView(),
      binding: PortfolioBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => TransactionView(),
      binding: TransactionBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.BALANCE,
      page: () => BalanceView(),
      binding: BalanceBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.FISHERMAN_DETAIL,
      page: () => const FishermanDetailView(),
      binding: FishermanDetailBinding(),
    ),
    GetPage(
      name: _Paths.ALL_FISHERMAN_TEAM,
      page: () => const AllFishermanTeamView(),
      binding: AllFishermanTeamBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PERSONAL_DATA,
      page: () => const EditPersonalDataView(),
      binding: EditPersonalDataBinding(),
    ),
    GetPage(
      name: _Paths.ALL_NEW_OFFER,
      page: () => const AllNewOfferView(),
      binding: AllNewOfferBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PROVINCE,
      page: () => const AllProvinceView(),
      binding: AllProvinceBinding(),
    ),
    GetPage(
      name: _Paths.WITHDRAWAL,
      page: () => const WithdrawalView(),
      binding: WithdrawalBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT,
      page: () => const DepositView(),
      binding: DepositBinding(),
    ),
    GetPage(
      name: _Paths.INVEST_NOW,
      page: () => InvestNowView(),
      binding: InvestNowBinding(),
    ),
    GetPage(
      name: _Paths.HOWTOPAY_DEPOSIT,
      page: () => HowtopayDepositView(),
      binding: HowtopayDepositBinding(),
    ),
  ];
}
