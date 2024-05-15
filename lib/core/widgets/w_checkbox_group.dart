import 'package:flutter/material.dart';

import 'w_select_button.dart';

class WCheckboxGroup extends StatefulWidget {
  final Axis axis;
  final List<String> items;
   final SelectorType  selectorType;
  final Function(List<int>) onChange;

  const WCheckboxGroup({
    Key? key,
    this.axis = Axis.vertical,
    required this.items,
    required this.onChange,
     this.selectorType=SelectorType.checkbox,
  }) : super(key: key);

  @override
  State<WCheckboxGroup> createState() => _WCheckboxGroupState();
}

class _WCheckboxGroupState extends State<WCheckboxGroup> {
  @override
  Widget build(BuildContext context) {
    if (widget.axis == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: _getChildren(),
      );
    } else {
      return Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: 10,
        runSpacing: 10,
        children: _getChildren(),
      );
    }
  }

  List<int> selectedIndexes = [];
  _getChildren() => List.generate(
        widget.items.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            bottom: 24.0,
            right: widget.axis == Axis.horizontal ? 8.0 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (selectedIndexes.contains(index)) {
                  selectedIndexes.remove(index);
                } else {
                  selectedIndexes.add(index);
                }
              });
              widget.onChange(selectedIndexes);
            },
            child: WSelectButton(
              txt: widget.items[index],
              isSelected: selectedIndexes.contains(index),
              selectorType: widget.selectorType,
            ),
          ),
        ),
      );
}
