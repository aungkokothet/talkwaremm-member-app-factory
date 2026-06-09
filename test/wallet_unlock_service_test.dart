import 'package:flutter_test/flutter_test.dart';
import 'package:profile_challenge_app/app/features/wallet/service/wallet_unlock_service.dart';

void main() {
  test(
    'encrypts secret and unlocks it with the customer passcode only',
    () async {
      final service = WalletUnlockService();
      final encryptedSecret = await service.encryptSecret(
        secret: 'SSECRETSEED',
        passcode: '123456',
      );

      expect(encryptedSecret.cipherText, isNot(contains('SSECRETSEED')));

      await service.unlock(
        encryptedSecret: encryptedSecret,
        passcode: '123456',
      );

      expect(service.unlockedSecret, 'SSECRETSEED');
      service.lock();
      expect(service.isUnlocked, isFalse);
    },
  );

  test('rejects an incorrect customer passcode', () async {
    final service = WalletUnlockService();
    final encryptedSecret = await service.encryptSecret(
      secret: 'SSECRETSEED',
      passcode: '123456',
    );

    expect(
      () => service.unlock(
        encryptedSecret: encryptedSecret,
        passcode: 'bad-passcode',
      ),
      throwsA(isA<WalletUnlockFailure>()),
    );
  });
}
