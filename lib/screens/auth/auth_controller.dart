import 'package:flutter/foundation.dart';
import 'package:the_planet/screens/auth/providers/tooltip_provider.dart';

class AuthController {
  final TooltipProvider tooltipProvider;

  AuthController({@required this.tooltipProvider});

  void questionIconIsPressed(int index) {
    tooltipProvider.updateMesage(index);
  }
}