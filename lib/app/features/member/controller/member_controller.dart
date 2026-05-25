import 'package:get/get.dart';
import 'package:profile_challenge_app/app/core/base/base_controller.dart';
import 'package:profile_challenge_app/app/features/member/model/member_status.dart';

class MemberController extends BaseController {
  final Rx<MemberStatus> status = const MemberStatus(
    label: 'Builder Member',
    description: 'Activated for Week 2 learning participation.',
  ).obs;
}
