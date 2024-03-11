import 'package:calculator/models/item.dart';
import 'package:flutter/material.dart';

import 'paragraph_widget.dart';
import 'title_widget.dart';

class CustomDropdownMenuWidget extends StatefulWidget {
  const CustomDropdownMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final String icon;
  final List<Item> items;

  @override
  State<CustomDropdownMenuWidget> createState() => CustomDropdownMenuWidgetState();
}

class CustomDropdownMenuWidgetState extends State<CustomDropdownMenuWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          expandedHeaderPadding: const EdgeInsets.all(0),
          elevation: 1,
          animationDuration: const Duration(milliseconds: 500),
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) => ListTile(
                leading: Image.asset(widget.icon, width: 20, height: 20),
                onTap: () => _changeMenu(!isExpanded),
                title: TitleWidget(
                  widget.title,
                  textAlign: TextAlign.start,
                  fontSize: 20,
                ),
              ),
              body: Column(
                  children: widget.items
                      .map((item) => ListTile(
                            leading: const Icon(Icons.keyboard_double_arrow_right),
                            dense: true,
                            title: ParagraphWidget(item.title ?? ''),
                            tileColor: Colors.lightGreen.withOpacity(0.1),
                            onTap: item.action,
                          ))
                      .toList()),
              isExpanded: _isExpanded,
            ),
          ],
          expansionCallback: (int index, bool isExpanded) => _changeMenu(isExpanded),
        ),
      ),
    );
  }

  _changeMenu(bool state) {
    setState(() {
      _isExpanded = state;
    });
  }
}
