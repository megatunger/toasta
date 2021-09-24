import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'enum.dart';

class Toast {
  double? height;
  double? width;
  bool? darkMode;
  bool? fadeInSubtitle;
  dynamic title;
  dynamic subtitle;
  Widget? leading;
  Widget? trailing;
  VoidCallback? onTap;
  VoidCallback? onAppear;
  VoidCallback? onExit;
  ToastStatus? status;
  Color? backgroundColor;
  Duration? duration;

  Toast(
      {this.title,
      this.subtitle,
      this.leading,
      this.trailing,
      this.fadeInSubtitle,
      this.onTap,
      this.onAppear,
      this.onExit,
      this.darkMode,
      this.backgroundColor,
      this.status,
      this.duration});
}
