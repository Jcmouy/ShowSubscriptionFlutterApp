import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/services.dart';
import 'package:plataforma_app/generated/l10n.dart';

class MaterialCountryPicker extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final TextEditingController phoneCodeController;
  final TextEditingController countryIsoCodeTextController;

  MaterialCountryPicker(this.phoneCodeController, this.phoneNumberController, this.countryIsoCodeTextController) {
    phoneCodeController.text = '598';
    countryIsoCodeTextController.text = 'UY';
  }

  @override
  State<StatefulWidget> createState() {
    return _MaterialCountryPicker();
  }
}

class _MaterialCountryPicker extends State<MaterialCountryPicker> {
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
    final double dropdownButtonWidth = MediaQuery.of(context).size.width * 0.4;
    final double dropdownItemWidth = dropdownButtonWidth - 30;
    //final double dropdownSelectedItemWidth = dropdownButtonWidth - 30;

    const filtered = true;
    //const hasPriorityList = false;
    const sortedByIsoCode = true;
    const hasSelectedItemBuilder = false;

    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 1, right: 14, left: 4, bottom: 8),
            child: CountryPickerDropdown(
              underline: Container(
                height: 1,
                color: Colors.black,
              ),
              //show'em (the text fields) you're in charge now
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              //if you have menu items of varying size, itemHeight being null respects
              //that, IntrinsicHeight under the hood ;).
              itemHeight: null,
              /*
              //itemHeight being null and isDense being true doesn't play along
              //well together. One is trying to limit size and other is saying
              //limit is the sky, therefore conflicts.
              //false is default but still keep that in mind.
              //isDense: false,
              */
              /*
              //if you want your dropdown button's selected item UI to be different
              //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
              selectedItemBuilder: hasSelectedItemBuilder == true
                  ? (Country country) => _buildDropdownSelectedItemBuilder(country, dropdownSelectedItemWidth)
                  : null,
              */
              itemBuilder: (Country country) => hasSelectedItemBuilder == true
                  ? _buildDropdownItemWithLongText(country, dropdownItemWidth)
                  : _buildDropdownItem(country, dropdownItemWidth),
              initialValue: 'UY',
              itemFilter: filtered ? (c) => ['UY'].contains(c.isoCode) : null,
              /*
              //priorityList is shown at the beginning of list
              priorityList: hasPriorityList
                  ? [
                      CountryPickerUtils.getCountryByIsoCode('GB'),
                      CountryPickerUtils.getCountryByIsoCode('CN'),
                    ]
                  : null,
              */
              sortComparator: sortedByIsoCode ? (Country a, Country b) => a.isoCode.compareTo(b.isoCode) : null,
              onValuePicked: (Country country) {
                _onCountryChange(country);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 1, right: 2, left: 11, bottom: 8),
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
      ],
    );
  }

  /*String _getCurrentLocale(BuildContext context) {
    if (!initialExecution) {
      final Locale myLocale = Localizations.localeOf(context);
      _onCountryChange(CountryPickerUtils.getCountryByIsoCode(myLocale.countryCode));
      initialExecution = true;
      return myLocale.countryCode;
    }
    return null;
  }*/

  Widget _buildDropdownItem(Country country, double dropdownItemWidth) => SizedBox(
        width: dropdownItemWidth,
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(child: Text("+${country.phoneCode}(${country.isoCode})")),
          ],
        ),
      );

  Widget _buildDropdownItemWithLongText(Country country, double dropdownItemWidth) => SizedBox(
        width: dropdownItemWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(child: Text(country.name)),
            ],
          ),
        ),
      );

  /*Widget _buildDropdownSelectedItemBuilder(Country country, double dropdownItemWidth) => SizedBox(
        width: dropdownItemWidth,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Text(
                  country.name,
                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );*/
}
