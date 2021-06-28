import 'package:flutter/material.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/core/helpers/shared_preferences_helper.dart';
import 'package:plataforma_app/core/util/url_launcher.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/presentation/widgets/textfields/common_text_fields.dart';

class PerfilSettingsWidget extends StatefulWidget {
  @override
  _PerfilSettingsWidgetState createState() => _PerfilSettingsWidgetState();
}

class _PerfilSettingsWidgetState extends State<PerfilSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        S.current.profile_title,
        style: CommonAppStyles.getSubTitleStyle(),
      ),
      const SizedBox(height: 20.0),
      CheckboxListTile(
        activeColor: Colors.blue[800],
        contentPadding: const EdgeInsets.all(0),
        value: prefs.getAutomaticDownload(),
        title: CommonAppText(text: S.current.profile_download_title),
        subtitle: CommonAppText(text: S.current.profile_download_subtitle),
        onChanged: (value) {
          setState(() {
            prefs.setAutomaticDownload(automaticDownload: value);
          });
        },
      ),
      const SizedBox(height: 60.0),
      Text(
        S.current.profile_notif_title,
        style: CommonAppStyles.getSubTitleStyle(),
      ),
      const SizedBox(height: 20.0),
      SwitchListTile(
        activeColor: Colors.blue[800],
        contentPadding: const EdgeInsets.all(0),
        value: prefs.getNotificationPriority(),
        title: CommonAppText(text: S.current.profile_notif_title_priority),
        subtitle: CommonAppText(text: S.current.profile_notif_subtitle_priority),
        onChanged: (val) {
          setState(() {
            prefs.setNotificationPriority(notificationPriority: val);
          });
        },
      ),
      _buildDivider(),
      SwitchListTile(
        activeColor: Colors.blue[800],
        contentPadding: const EdgeInsets.all(0),
        value: prefs.getSoundNotification(),
        title: CommonAppText(text: S.current.profile_notif_title_ringtone),
        subtitle: CommonAppText(text: S.current.profile_notif_subtitle_ringtone),
        onChanged: (val) {
          setState(() {
            prefs.setSoundNotification(soundNotification: val);
          });
        },
      ),
      _buildDivider(),
      SwitchListTile(
        activeColor: Colors.blue[800],
        contentPadding: const EdgeInsets.all(0),
        value: prefs.getVibrationNotification(),
        title: CommonAppText(text: S.current.profile_notif_title_vibrate),
        subtitle: CommonAppText(text: S.current.profile_notif_title_subvibrate),
        onChanged: (val) {
          setState(() {
            prefs.setVibrationNotification(vibrationNotification: val);
          });
        },
      ),
      const SizedBox(height: 20.0),
      Text(
        S.current.profile_about_title,
        style: CommonAppStyles.getSubTitleStyle(),
      ),
      const SizedBox(height: 20.0),
      CommonAppTextResalted(text: S.current.profile_about_title_presentation),
      const SizedBox(height: 30.0),
      Align(
        alignment: Alignment.centerLeft,
        child: CommonAppTextResalted(
          text: S.current.profile_about_title_version,
        ),
      ),
      const SizedBox(height: 20.0),
      _buildDivider(),
      const SizedBox(height: 20.0),
      Align(
        alignment: Alignment.centerLeft,
        child: CommonAppTextResalted(
          text: S.current.profile_about_title_send_t,
        ),
      ),
      const SizedBox(height: 8.0),
      Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            UrlLauncher.openEmail(
              toEmail: 'contact@uydevs.com',
              subject: S.current.profile_email_subject,
              body: S.current.profile_email_body,
            );
          },
          child: Text(
            S.current.profile_about_title_send_st,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.blue[800],
            ),
          ),
        ),
      ),
      const SizedBox(height: 20.0),
      _buildDivider(),
      const SizedBox(height: 20.0),
      Align(
        alignment: Alignment.centerLeft,
        child: CommonAppTextResalted(
          text: S.current.profile_about_title_faq_t,
        ),
      ),
      const SizedBox(height: 8.0),
      Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            UrlLauncher.openLink(
              url: 'http://www.uydevs.com/info/faq/',
            );
          },
          child: Text(
            S.current.profile_about_title_faq_st,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.blue[800],
            ),
          ),
        ),
      ),
      const SizedBox(height: 20.0),
      _buildDivider(),
      const SizedBox(height: 20.0),
      Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            UrlLauncher.openLink(
              url: 'http://www.uydevs.com/info/privacy-policy/',
            );
          },
          child: Text(
            S.current.profile_about_title_pp_t,
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.normal,
              color: Colors.blue[800],
            ),
          ),
        ),
      ),
      const SizedBox(height: 20.0),
      _buildDivider(),
      const SizedBox(height: 20.0),
      Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            UrlLauncher.openLink(
              url: 'http://www.uydevs.com/info/terms-conditions/',
            );
          },
          child: Text(
            S.current.profile_about_title_tc_t,
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.normal,
              color: Colors.blue[800],
            ),
          ),
        ),
      ),
      const SizedBox(height: 20.0),
      _buildDivider(),
      const SizedBox(height: 10.0),
    ]);
  }
}

Container _buildDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    width: double.infinity,
    height: 1.0,
    color: Colors.grey.shade400,
  );
}
