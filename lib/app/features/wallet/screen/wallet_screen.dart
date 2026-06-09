import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/core/base/base_view.dart';
import 'package:profile_challenge_app/app/design/talkware_radius.dart';
import 'package:profile_challenge_app/app/design/talkware_spacing.dart';
import 'package:profile_challenge_app/app/design/widgets/talkware_app_bar.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';
import 'package:profile_challenge_app/app/features/wallet/controller/wallet_controller.dart';
import 'package:profile_challenge_app/app/widget/member_app_drawer.dart';
import 'package:profile_challenge_app/app/widget/section_card.dart';

class WalletScreen extends BaseView<WalletController> {
  const WalletScreen({super.key});

  @override
  Widget buildView(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: TalkwareAppBar(
        onMenuPressed: () => scaffoldKey.currentState?.openEndDrawer(),
        menuTooltip: AppString.walletMenuTitle,
      ),
      endDrawer: MemberAppDrawer(authController: Get.find<AuthController>()),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(TalkwareSpacing.lg),
                child: _BalanceCard(
                  balance: controller.currentBalance.value,
                  pointName: controller.pointName,
                  onRefresh: controller.refreshWalletBalance,
                ),
              ),
              Expanded(child: _WalletBody(controller: controller)),
              TextButton(
                onPressed: controller.openHistory,
                child: const Text(AppString.walletHistoryLink),
              ),
              const SizedBox(height: TalkwareSpacing.sm),
            ],
          ),
        ),
      ),
    );
  }
}

class _WalletBody extends StatelessWidget {
  const _WalletBody({required this.controller});

  final WalletController controller;

  @override
  Widget build(BuildContext context) {
    switch (controller.walletState.value) {
      case WalletState.loading:
        return const _StatusPanel(
          title: AppString.walletStatusTitle,
          description: AppString.walletLoadingConfigMessage,
        );
      case WalletState.configMissing:
      case WalletState.error:
        return _StatusPanel(
          title: AppString.walletStatusTitle,
          description: controller.message.value,
        );
      case WalletState.ready:
        return _ActivationPanel(controller: controller);
      case WalletState.activated:
        return _WalletActions(controller: controller);
    }
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    required this.balance,
    required this.pointName,
    required this.onRefresh,
  });

  final String balance;
  final String pointName;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final formattedBalance =
        double.tryParse(balance)?.toStringAsFixed(2) ?? balance;

    return Container(
      padding: const EdgeInsets.all(TalkwareSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(TalkwareRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppString.walletBalanceLabel,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: TalkwareSpacing.sm),
          Text(
            formattedBalance,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: TalkwareSpacing.xs),
          Text(
            pointName,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: TalkwareSpacing.sm),
          TextButton.icon(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh_outlined),
            label: const Text(AppString.walletRefreshBalance),
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivationPanel extends StatelessWidget {
  const _ActivationPanel({required this.controller});

  final WalletController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(TalkwareSpacing.lg),
      children: [
        SectionCard(
          title: AppString.walletStatusTitle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppString.walletReadyToActivateMessage),
              const SizedBox(height: TalkwareSpacing.sm),
              FilledButton.icon(
                onPressed: controller.activateWallet,
                icon: const Icon(Icons.account_balance_wallet_outlined),
                label: const Text(AppString.walletActivateButton),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WalletActions extends StatelessWidget {
  const _WalletActions({required this.controller});

  final WalletController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(TalkwareSpacing.lg),
      children: [
        SectionCard(
          title: AppString.walletActionsTitle,
          child: Wrap(
            spacing: TalkwareSpacing.sm,
            runSpacing: TalkwareSpacing.sm,
            children: [
              FilledButton.icon(
                onPressed: controller.openReceive,
                icon: const Icon(Icons.qr_code_2_outlined),
                label: const Text(AppString.walletReceiveTitle),
              ),
              FilledButton.icon(
                onPressed: controller.openSendScan,
                icon: const Icon(Icons.send_outlined),
                label: const Text(AppString.walletSendTitle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatusPanel extends StatelessWidget {
  const _StatusPanel({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(TalkwareSpacing.lg),
      children: [SectionCard(title: title, child: Text(description))],
    );
  }
}
