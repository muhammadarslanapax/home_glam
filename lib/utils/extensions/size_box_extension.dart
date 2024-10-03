import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

extension SizedBoxExtension on double {
  Widget get space => Gap(this);
}
