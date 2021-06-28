import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plataforma_app/core/util/date_utils.dart' as date_utils;
import 'package:plataforma_app/generated/l10n.dart';

class MaterialDatePickerWidget extends StatefulWidget {
  final TextEditingController controller;

  const MaterialDatePickerWidget(this.controller);

  @override
  State<StatefulWidget> createState() {
    return _MaterialDatePickerWidget();
  }
}

class _MaterialDatePickerWidget extends State<MaterialDatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: TextFormField(
              readOnly: true,
              focusNode: FocusNode(),
              controller: widget.controller,
              enableInteractiveSelection: false,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                hintText: date_utils.DateUtils.dateToString(selectedDate),
                hintStyle: const TextStyle(fontSize: 15),
                labelText: S.current.edit_birthday,
                contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today), onPressed: () => buildMaterialDatePicker(context, widget.controller)),
              ),
              cursorColor: Colors.black,
              keyboardType: TextInputType.datetime,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> buildMaterialDatePicker(BuildContext context, TextEditingController controller) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1940),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        controller.text = date_utils.DateUtils.dateToString(picked);
        selectedDate = picked;
      });
    }
  }
}
