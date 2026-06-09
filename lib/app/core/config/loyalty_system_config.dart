import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LoyaltySystemConfig {
  const LoyaltySystemConfig({
    required this.merchantName,
    required this.pointName,
    required this.assetCode,
    required this.totalSupply,
    required this.issuerPublicKey,
    required this.distributorPublicKey,
    required this.networkName,
    required this.horizonUrl,
    required this.nownodeApiKey,
    required this.importSource,
    required this.packageVersion,
  });

  static const String localAssetPath =
      'assets/config/loyalty-system-config.local.json';
  static const String exampleAssetPath =
      'assets/config/loyalty-system-config.example.json';
  static const String missingConfigMessage =
      'Missing loyalty system config. Copy assets/config/loyalty-system-config.example.json to assets/config/loyalty-system-config.local.json and fill in your own values.';

  final String merchantName;
  final String pointName;
  final String assetCode;
  final int totalSupply;
  final String issuerPublicKey;
  final String distributorPublicKey;
  final String networkName;
  final String horizonUrl;
  final String nownodeApiKey;
  final String importSource;
  final String packageVersion;

  static Future<LoyaltySystemConfig> loadLocal() async {
    try {
      final contents = await rootBundle.loadString(localAssetPath);
      final json = jsonDecode(contents) as Map<String, dynamic>;
      return LoyaltySystemConfig.fromJson(json);
    } on FlutterError catch (error) {
      if (error.message.contains(localAssetPath) ||
          error.message.contains('Unable to load asset')) {
        throw const LoyaltySystemConfigMissing();
      }
      rethrow;
    } on FormatException {
      throw const LoyaltySystemConfigFailure(
        'Loyalty system config is not valid JSON.',
      );
    }
  }

  factory LoyaltySystemConfig.fromJson(Map<String, dynamic> json) {
    final businessProfile = _map(json['businessProfile']);
    final loyaltyProgram = _map(json['loyaltyProgram']);
    final systemAccounts = _map(json['systemAccounts']);
    final issuer = _map(systemAccounts['issuer']);
    final distributor = _map(systemAccounts['distributor']);
    final network = _map(json['network']);

    return LoyaltySystemConfig(
      merchantName: _string(businessProfile['merchantName']),
      pointName: _string(loyaltyProgram['pointName']),
      assetCode: _string(loyaltyProgram['assetCode']),
      totalSupply: _int(loyaltyProgram['totalSupply']),
      issuerPublicKey: _string(issuer['publicKey']),
      distributorPublicKey: _string(distributor['publicKey']),
      networkName: _string(network['networkName']),
      horizonUrl: _string(network['horizonUrl']).replaceAll(RegExp(r'/+$'), ''),
      nownodeApiKey: _string(network['nownodeApiKey']),
      importSource: _string(json['importSource']),
      packageVersion: _string(json['packageVersion']),
    );
  }

  static Map<String, dynamic> _map(Object? value) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return <String, dynamic>{};
  }

  static String _string(Object? value) => value?.toString().trim() ?? '';

  static int _int(Object? value) {
    if (value is int) {
      return value;
    }
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}

class LoyaltySystemConfigMissing implements Exception {
  const LoyaltySystemConfigMissing();

  String get message => LoyaltySystemConfig.missingConfigMessage;
}

class LoyaltySystemConfigFailure implements Exception {
  const LoyaltySystemConfigFailure(this.message);

  final String message;
}
