import 'package:flutter/material.dart';

class TalkwareShadows {
  TalkwareShadows._();

  static List<BoxShadow> get subtle {
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 18,
        offset: const Offset(0, 8),
      ),
    ];
  }
}
