import 'package:flutter/material.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

class ChoiceChips extends StatefulWidget {
  final List chipName;
  const ChoiceChips({Key key, this.chipName}) : super(key: key);

  @override
  _ChoiceChipsState createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  String _isSelected = "";

  List<Widget> _buildChoiceList() {
    final List<Widget> choices = [];
    // ignore: avoid_function_literals_in_foreach_calls
    widget.chipName.forEach((item) {
      // ignore: avoid_unnecessary_containers
      choices.add(Container(
        child: ChoiceChip(
          label: Text(item as String),
          labelStyle: const TextStyle(color: palette.Text.primaryColor),
          selectedColor: palette.Text.secondaryColor,
          backgroundColor: palette.Text.secondaryColor,
          selected: _isSelected == item,
          onSelected: (selected) {
            setState(() {
              _isSelected = item as String;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2.0,
      runSpacing: 1.0,
      children: _buildChoiceList(),
    );
  }
}