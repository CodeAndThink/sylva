import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sylva/core/constants/iap_constants.dart';
import 'package:sylva/core/constants/key_constants.dart';

@lazySingleton
class IapService {
  final entitlementID = IapConstants.entitlementId;

  // You can customize the IDs according to your RevenueCat setup
  final monthlyPackageId = IapConstants.monthly;
  final lifetimePackageId = IapConstants.lifetime;

  Future<void> init() async {
    await Purchases.setLogLevel(LogLevel.debug);

    PurchasesConfiguration? configuration;

    if (Platform.isAndroid) {
      final apiKey = dotenv.env[KeyConstants.revenuecatAndroidKey];
      if (apiKey != null && apiKey.isNotEmpty) {
        configuration = PurchasesConfiguration(apiKey);
      }
    } else if (Platform.isIOS) {
      final apiKey = dotenv.env[KeyConstants.revenuecatIosKey];
      if (apiKey != null && apiKey.isNotEmpty) {
        configuration = PurchasesConfiguration(apiKey);
      }
    }

    if (configuration != null) {
      await Purchases.configure(configuration);
    }
  }

  Future<bool> checkPremium() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.all[entitlementID]?.isActive == true;
    } catch (e) {
      return false;
    }
  }

  Future<List<String>> getActiveProductIdentifiers() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.all.values
          .where((e) => e.isActive)
          .map((e) => e.productIdentifier)
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Package>> getOfferings() async {
    try {
      final offerings = await Purchases.getOfferings();
      if (offerings.current != null &&
          offerings.current!.availablePackages.isNotEmpty) {
        return offerings.current!.availablePackages;
      }
    } on PlatformException catch (e) {
      debugPrint("Error fetching offerings: ${e.message}");
    }
    return [];
  }

  Future<bool> purchasePackage({required Package package}) async {
    try {
      final purchaseResult = await Purchases.purchase(
        PurchaseParams.package(package),
      );
      return purchaseResult
              .customerInfo
              .entitlements
              .all[entitlementID]
              ?.isActive ==
          true;
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        debugPrint("Purchase error: ${e.message}");
      }
      return false;
    }
  }

  Future<bool> restorePurchases() async {
    try {
      final customerInfo = await Purchases.restorePurchases();
      return customerInfo.entitlements.all[entitlementID]?.isActive == true;
    } on PlatformException catch (e) {
      debugPrint("Restore error: ${e.message}");
      return false;
    }
  }

  /// Logs in to RevenueCat with the given [userId].
  /// Returns `true` if the user has an active premium entitlement after login
  /// (including any anonymous → identified transfer).
  Future<bool> logIn(String userId) async {
    try {
      final result = await Purchases.logIn(userId);
      return result.customerInfo.entitlements.all[entitlementID]?.isActive ==
          true;
    } catch (e) {
      debugPrint("RevenueCat Login error: $e");
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      await Purchases.logOut();
    } catch (e) {
      debugPrint("RevenueCat Logout error: $e");
    }
  }
}
