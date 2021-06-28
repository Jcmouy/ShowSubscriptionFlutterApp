import 'package:plataforma_app/core/helpers/shared_preferences_helper.dart';
import 'package:plataforma_app/generated/l10n.dart';

class MensajeUtilWidgets {
  double getTextSize() {
    double textSize;
    final String labelSizeText = prefs.getFontSize();

    if (labelSizeText == S.current.profile_alert_dialog_option_font_s) {
      textSize = 12.0;
    } else if (labelSizeText == S.current.profile_alert_dialog_option_font_b) {
      textSize = 20.0;
    } else {
      textSize = 15.0;
    }

    return textSize;
  }
}
