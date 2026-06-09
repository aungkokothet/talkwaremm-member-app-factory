import 'package:flutter_test/flutter_test.dart';
import 'package:profile_challenge_app/app/features/wallet/model/wallet_transaction_history_model.dart';
import 'package:profile_challenge_app/app/features/wallet/service/wallet_transaction_history_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('stores successful and failed transaction history records', () async {
    final service = WalletTransactionHistoryService();
    final success = WalletTransactionHistoryModel(
      id: '1',
      timestamp: DateTime.parse('2026-06-09T10:00:00Z'),
      senderPublicKey: 'G${List.filled(55, 'A').join()}',
      recipientPublicKey: 'G${List.filled(55, 'B').join()}',
      amount: '10',
      assetCode: 'TALK',
      assetIssuer: 'G${List.filled(55, 'C').join()}',
      network: 'Test SDF Network ; September 2015',
      status: WalletTransactionStatus.success,
      transactionHash: 'abc123',
    );
    final failed = WalletTransactionHistoryModel(
      id: '2',
      timestamp: DateTime.parse('2026-06-09T10:01:00Z'),
      senderPublicKey: success.senderPublicKey,
      recipientPublicKey: success.recipientPublicKey,
      amount: '20',
      assetCode: 'TALK',
      assetIssuer: success.assetIssuer,
      network: success.network,
      status: WalletTransactionStatus.failed,
      errorMessage: 'Insufficient balance',
    );

    await service.saveRecord(success);
    await service.saveRecord(failed);

    final records = await service.loadHistory();

    expect(records, hasLength(2));
    expect(records.first.status, WalletTransactionStatus.failed);
    expect(records.last.transactionHash, 'abc123');
    expect(records.first.errorMessage, 'Insufficient balance');
  });
}
