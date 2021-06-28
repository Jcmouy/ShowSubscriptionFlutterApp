import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:plataforma_app/generated/l10n.dart';

class CupertinoCountryPicker extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final TextEditingController phoneCodeController;
  final TextEditingController countryIsoCodeTextController;

  CupertinoCountryPicker(this.phoneCodeController, this.phoneNumberController, this.countryIsoCodeTextController) {
    phoneCodeController.text = '598';
    countryIsoCodeTextController.text = 'UY';
  }

  @override
  State<StatefulWidget> createState() {
    return _CupertinoCountryPicker();
  }
}

class _CupertinoCountryPicker extends State<CupertinoCountryPicker> {
  bool initialExecution = false;

  void _onCountryChange(Country country) {
    widget.phoneCodeController.text = country.phoneCode;
    widget.countryIsoCodeTextController.text = country.isoCode;
  }

  void completeNumber() {
    final String phoneNumber = widget.phoneNumberController.text;
    widget.phoneNumberController.text = phoneNumber != "" ? phoneNumber.substring(1) : phoneNumber;
  }

  @override
  Widget build(BuildContext context) {

    return Row(children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 1, right: 10, left: 4, bottom: 8),
          child: SizedBox(
            height: 50,
            width: 115,
            child: ListTile(
              title: _buildCupertinoSelectedItem(CountryPickerUtils.getCountryByIsoCode(widget.countryIsoCodeTextController.text)),
              onTap: _openCupertinoCountryPicker,
            ),
          ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 1, right: 14, left: 11, bottom: 8),
          child: TextFormField(
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              hintText: S.current.edit_phone,
              labelText: S.current.edit_phone,
              hintStyle: const TextStyle(fontSize: 15),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              suffixIcon: const Icon(Icons.phone),
            ),
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
            controller: widget.phoneNumberController,
            inputFormatters: [
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
      )
    ]);
  }

  void _openCupertinoCountryPicker() => showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerCupertino(
          backgroundColor: Colors.white,
          itemBuilder: _buildCupertinoItem,
          pickerSheetHeight: 300.0,
          pickerItemHeight: 75,
          initialCountry: CountryPickerUtils.getCountryByIsoCode('UY'),
          onValuePicked: (Country country) => setState(() {
            _onCountryChange(country);
          }),
        );
      });

  /*
  Country _getCurrentLocale(BuildContext context) {
    if (!initialExecution) {
      final Locale myLocale = Localizations.localeOf(context);
      _onCountryChange(CountryPickerUtils.getCountryByIsoCode(myLocale.countryCode));
      initialExecution = true;
      return CountryPickerUtils.getCountryByIsoCode(myLocale.countryCode);
    }
    return null;
  }
   */

  Widget _buildCupertinoItem(Country country) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: CupertinoColors.black,
        fontSize: 14.0,
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 10.0),
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 7.0),
          Text("+${country.phoneCode}"),
          const SizedBox(width: 7.0),
          Flexible(child: Text(country.name))
        ],
      ),
    );
  }

  Widget _buildCupertinoSelectedItem(Country country) {
    return Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Text("+${country.phoneCode}"),
      ],
    );
  }
}
