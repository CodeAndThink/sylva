import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/core/services/iap_service.dart';
import 'package:sylva/generated/l10n.dart';
import 'subscription_state.dart';

@lazySingleton
class SubscriptionCubit extends Cubit<SubscriptionState> {
  final IapService _iapService;

  SubscriptionCubit(this._iapService) : super(const SubscriptionState());

  Future<void> init() async {
    if (state.initStatus.isLoading) return;
    emit(state.copyWith(initStatus: LoadStatus.loading));
    await _iapService.init();

    final isPremium = await _iapService.checkPremium();
    final activeProductIdentifiers = await _iapService
        .getActiveProductIdentifiers();
    final packages = await _iapService.getOfferings();

    emit(
      state.copyWith(
        isPremium: isPremium,
        activeProductIdentifiers: activeProductIdentifiers,
        packages: packages,
        initStatus: LoadStatus.success,
      ),
    );
  }

  /// Re-check premium status from RevenueCat and update state + Supabase.
  /// Call this after login/logout when the RevenueCat user identity changes.
  Future<void> refreshStatus() async {
    if (state.refreshStatus.isLoading) return;
    emit(state.copyWith(refreshStatus: LoadStatus.loading));
    final isPremium = await _iapService.checkPremium();
    final activeProductIdentifiers = await _iapService
        .getActiveProductIdentifiers();

    emit(
      state.copyWith(
        isPremium: isPremium,
        activeProductIdentifiers: activeProductIdentifiers,
        refreshStatus: LoadStatus.success,
      ),
    );
  }

  Future<void> purchase({required Package package}) async {
    if (state.purchaseStatus.isLoading) return;
    emit(state.copyWith(purchaseStatus: LoadStatus.loading));
    final success = await _iapService.purchasePackage(package: package);
    if (success) {
      final activeProductIdentifiers = await _iapService
          .getActiveProductIdentifiers();
      emit(
        state.copyWith(
          isPremium: true,
          activeProductIdentifiers: activeProductIdentifiers,
          purchaseStatus: LoadStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          purchaseStatus: LoadStatus.failure,
          errorMessage: S.current.purchaseFailureMessage,
        ),
      );
    }
  }

  Future<void> restore() async {
    emit(state.copyWith(restoreStatus: LoadStatus.loading));
    final success = await _iapService.restorePurchases();
    if (success) {
      final activeProductIdentifiers = await _iapService
          .getActiveProductIdentifiers();
      emit(
        state.copyWith(
          isPremium: true,
          activeProductIdentifiers: activeProductIdentifiers,
          restoreStatus: LoadStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          restoreStatus: LoadStatus.failure,
          errorMessage: S.current.restoreFailureMessage,
        ),
      );
    }
  }
}
