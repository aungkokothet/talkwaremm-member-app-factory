import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/core/base/base_controller.dart';
import 'package:profile_challenge_app/app/features/member/model/member_status.dart';

class MemberController extends BaseController {
  final Rx<MemberStatus> status = const MemberStatus(
    label: AppString.memberStatusLabel,
    description: AppString.memberStatusDescription,
  ).obs;
}
