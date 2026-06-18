import 'package:equatable/equatable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sylva/core/constants/iap_constants.dart';
import 'package:sylva/core/enums/load_status.dart';

class SubscriptionState extends Equatable {
  final bool isPremium;
  final LoadStatus initStatus;
  final LoadStatus refreshStatus;
  final LoadStatus purchaseStatus;
  final LoadStatus restoreStatus;
  final List<Package> packages;
  final String? errorMessage;
  final List<String> activeProductIdentifiers;

  const SubscriptionState({
    this.isPremium = false,
    this.initStatus = LoadStatus.initial,
    this.refreshStatus = LoadStatus.initial,
    this.purchaseStatus = LoadStatus.initial,
    this.restoreStatus = LoadStatus.initial,
    this.packages = const [],
    this.errorMessage,
    this.activeProductIdentifiers = const [],
  });

  Package? get monthlyPackage {
    for (var p in packages) {
      if (p.packageType == PackageType.monthly ||
          IapConstants.monthlyIds.contains(p.identifier)) {
        return p;
      }
    }
    return null;
  }

  Package? get lifetimePackage {
    for (var p in packages) {
      if (p.packageType == PackageType.lifetime ||
          IapConstants.lifetimeIds.contains(p.identifier)) {
        return p;
      }
    }
    return null;
  }

  bool get isMonthlyActive {
    return activeProductIdentifiers.any(
      (id) =>
          IapConstants.monthlyIds.contains(id) ||
          monthlyPackage?.storeProduct.identifier == id,
    );
  }

  bool get isLifetimeActive {
    return activeProductIdentifiers.any(
      (id) =>
          IapConstants.lifetimeIds.contains(id) ||
          lifetimePackage?.storeProduct.identifier == id,
    );
  }

  SubscriptionState copyWith({
    bool? isPremium,
    LoadStatus? initStatus,
    LoadStatus? refreshStatus,
    LoadStatus? purchaseStatus,
    LoadStatus? restoreStatus,
    List<Package>? packages,
    String? errorMessage,
    List<String>? activeProductIdentifiers,
  }) {
    return SubscriptionState(
      isPremium: isPremium ?? this.isPremium,
      initStatus: initStatus ?? this.initStatus,
      refreshStatus: refreshStatus ?? this.refreshStatus,
      purchaseStatus: purchaseStatus ?? this.purchaseStatus,
      restoreStatus: restoreStatus ?? this.restoreStatus,
      packages: packages ?? this.packages,
      errorMessage: errorMessage,
      activeProductIdentifiers:
          activeProductIdentifiers ?? this.activeProductIdentifiers,
    );
  }

  @override
  List<Object?> get props => [
    isPremium,
    initStatus,
    refreshStatus,
    purchaseStatus,
    restoreStatus,
    packages,
    errorMessage,
    activeProductIdentifiers,
  ];
}
