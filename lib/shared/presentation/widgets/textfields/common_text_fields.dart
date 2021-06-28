import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/widgets/countrypicker/cupertino_country_picker.dart';
import 'package:plataforma_app/shared/presentation/widgets/datepicker/cupertino_date_picker.dart';
import 'package:plataforma_app/shared/presentation/widgets/countrypicker/material_country_picker.dart';
import 'package:plataforma_app/shared/presentation/widgets/datepicker/material_date_picker.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

class CommonAppText extends StatelessWidget {
  final String text;

  const CommonAppText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CommonAppTextWidget(text: text, fontSize: 14.0);
  }
}

class CommonAppTextResalted extends StatelessWidget {
  final String text;

  const CommonAppTextResalted({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CommonAppTextWidget(text: text, fontSize: 16.5);
  }
}

class _CommonAppTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;

  const _CommonAppTextWidget({Key key, this.text, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: palette.Text.primaryColor, fontSize: fontSize),
    );
  }
}

class CommonTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool required;
  final Icon icon;
  final TextEditingController controller;

  const CommonTextField({Key key, this.label, this.hint, this.controller, this.required, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: _commonTextFieldStyle(),
      decoration: _commonTextFieldDecoration(label, hint, icon),
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      controller: controller,
    );
  }
}

class CommonPasswordTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const CommonPasswordTextField({Key key, this.label, this.hint, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: _commonTextFieldStyle(),
      decoration: _commonTextFieldDecoration(label, hint, null),
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      controller: controller,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}

class CommonTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final bool required;
  final TextEditingController controller;

  const CommonTextFormField({Key key, this.label, this.hint, this.controller, this.required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: _commonTextFieldStyle(),
      decoration: _commonTextFieldDecoration(label, hint, null),
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      controller: controller,
      validator: (value) => (required != null && required == true) ? _validateTextFieldRequired(value) : null,
    );
  }
}

class CommonPasswordTextFormField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const CommonPasswordTextFormField({Key key, this.label, this.hint, this.controller}) : super(key: key);

  @override
  _CommonPasswordTextFormFieldState createState() => _CommonPasswordTextFormFieldState();
}

class _CommonPasswordTextFormFieldState extends State<CommonPasswordTextFormField> {
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: _commonTextFieldStyle(),
      decoration: _commonTextFieldDecoration(widget.label, widget.hint, buildIconButton()),
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      controller: widget.controller,
      obscureText: !_passwordVisible,
      enableSuggestions: false,
      autocorrect: false,
      validator: (value) => _validatePassword(value),
    );
  }

  Widget buildIconButton() {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        _passwordVisible ? Icons.visibility : Icons.visibility_off,
        color: Theme.of(context).primaryColorDark,
      ),
      onPressed: () {
        // Update the state i.e. toogle the state of passwordVisible variable
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
    );
  }
}

class AppTextLabelField extends StatelessWidget {
  final String labelText;
  final String text;

  const AppTextLabelField({
    Key key,
    this.labelText,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String label = '';
    if (labelText.isNotEmpty) {
      label = '$labelText:';
    }
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CommonAppText(
        text: '$label $text',
      ),
    );
  }
}

Widget buildPhoneTextField(BuildContext context, TextEditingController phoneCodeController, TextEditingController phoneNumberController,
    TextEditingController countryIsoCodeController) {
  final ThemeData theme = Theme.of(context);
  assert(theme.platform != null);
  switch (theme.platform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      final cupertinoCountryPicker = CupertinoCountryPicker(phoneCodeController, phoneNumberController, countryIsoCodeController);
      return cupertinoCountryPicker;
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
    default:
      final countryPicker = MaterialCountryPicker(phoneCodeController, phoneNumberController, countryIsoCodeController);
      return countryPicker;
  }
}

Widget buildBirthdayTextField(BuildContext context, TextEditingController controller) {
  final ThemeData theme = Theme.of(context);
  assert(theme.platform != null);
  switch (theme.platform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      final cupertinoCountryPicker = CupertinoDatePickerWidget(controller);
      return cupertinoCountryPicker;
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
    default:
      final materialDatepicker = MaterialDatePickerWidget(controller);
      return materialDatepicker;
  }
}

String _validatePassword(String value1) {
  if (value1.isEmpty) {
    return S.current.form_validation_password_empty;
  }
  if (value1.isNotEmpty && (value1.length < 8)) {
    return S.current.form_validation_password_length;
  }
  return null;
}

String _validateTextFieldRequired(String userInput) {
  if (userInput.isEmpty) {
    return S.current.form_validation_field_required;
  }

  return null;
}

TextStyle _commonTextFieldStyle() {
  return const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15);
}

InputDecoration _commonTextFieldDecoration(String label, String hint, Widget icon) {
  return InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    labelText: label,
    hintText: hint,
    hintStyle: const TextStyle(fontSize: 15),
    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    suffixIcon: icon,
  );
}
