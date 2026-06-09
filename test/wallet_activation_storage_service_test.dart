import 'package:flutter_test/flutter_test.dart';
import 'package:profile_challenge_app/app/features/wallet/model/customer_wallet_access.dart';
import 'package:profile_challenge_app/app/features/wallet/service/wallet_activation_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('saves and restores wallet activation metadata', () async {
    final service = WalletActivationStorageService();
    const walletAccess = CustomerWalletAccess(
      customerName: 'Maya Chen',
      customerId: 'member-001',
      phone: '+959000000000',
      publicKey: 'GAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
      assetCode: 'TALK',
      secret: 'do-not-persist',
      recoveryPhrase: 'do not persist this either',
      derivationPath: "m/44'/148'/0'",
    );

    await service.saveWalletAccess(walletAccess);

    final restoredAccess = await service.restoreWalletAccess();

    expect(restoredAccess, isNotNull);
    expect(restoredAccess?.customerName, walletAccess.customerName);
    expect(restoredAccess?.customerId, walletAccess.customerId);
    expect(restoredAccess?.phone, walletAccess.phone);
    expect(restoredAccess?.publicKey, walletAccess.publicKey);
    expect(restoredAccess?.assetCode, walletAccess.assetCode);
    expect(restoredAccess?.secret, isNull);
    expect(restoredAccess?.recoveryPhrase, isNull);
    expect(restoredAccess?.derivationPath, isNull);
  });

  test('clears persisted wallet activation metadata', () async {
    final service = WalletActivationStorageService();
    const walletAccess = CustomerWalletAccess(
      customerName: '',
      customerId: '',
      phone: '',
      publicKey: 'GAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
      assetCode: 'TALK',
    );

    await service.saveWalletAccess(walletAccess);
    await service.clearWalletAccess();

    expect(await service.restoreWalletAccess(), isNull);
  });
}
