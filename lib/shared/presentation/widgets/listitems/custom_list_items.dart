import 'package:flutter/material.dart';
import 'package:plataforma_app/shared/presentation/widgets/listitems/list_items_styles.dart';

abstract class ListItem {
  /// The padding to show in a list item.
  EdgeInsets buildPadding(BuildContext context);

  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  EdgeInsets buildPadding(BuildContext context) => null;

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: ListItemsStyles.getListViewTitleStyle(),
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => null;
}

ListTile buildHeadingListTile(BuildContext buildContext, String lineText){
  final HeadingItem item = HeadingItem(lineText);

  return ListTile(
    title: item.buildTitle(buildContext),
  );
}

/// A ListItem that contains data to display a message.
class CommonListItem implements ListItem {
  final String lineText;

  CommonListItem(this.lineText);

  @override
  EdgeInsets buildPadding(BuildContext context) => null;

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      lineText,
      style: ListItemsStyles.getListviewRowStyle(),
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => null;
}

ListTile buildCommonListTile(BuildContext buildContext, String lineText){
  final CommonListItem item = CommonListItem(lineText);

  return ListTile(
    title: item.buildTitle(buildContext),
  );
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  EdgeInsets buildPadding(BuildContext context) => null;

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}