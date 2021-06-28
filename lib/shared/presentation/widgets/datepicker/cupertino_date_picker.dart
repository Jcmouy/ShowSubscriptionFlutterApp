import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plataforma_app/core/util/date_utils.dart' as date_utils;
import 'package:plataforma_app/generated/l10n.dart';

class CupertinoDatePickerWidget extends StatefulWidget {
  final TextEditingController controller;

  const CupertinoDatePickerWidget(this.controller);

  @override
  State<StatefulWidget> createState() {
    return _CupertinoDatePickerWidget();
  }
}

class _CupertinoDatePickerWidget extends State<CupertinoDatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 14, left: 14, bottom: 8),
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
                    icon: const Icon(Icons.calendar_today), onPressed: () => buildCupertinoDatePicker(context, widget.controller)),
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

  /// This builds cupertion date picker in iOS
  void buildCupertinoDatePicker(BuildContext context, TextEditingController controller) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    controller.text = date_utils.DateUtils.dateToString(picked);
                    selectedDate = picked;
                  });
                }
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }
}
