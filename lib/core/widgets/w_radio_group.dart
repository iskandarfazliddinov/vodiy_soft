import 'package:flutter/material.dart';

import 'w_select_button.dart';

class WRadioGroup extends StatefulWidget {
  final Axis axis;
  final List<String> items;
  final int? initialIndex;
  final Function(int) onChange;
  final double? horizontalPadding;

  const WRadioGroup({
    Key? key,
    this.axis = Axis.vertical,
    required this.items,
    this.initialIndex,
    this.horizontalPadding,
    required this.onChange,
  }) : super(key: key);

  @override
  State<WRadioGroup> createState() => _WRadioGroupState();
}

class _WRadioGroupState extends State<WRadioGroup> {
  @override
  void initState() {
    super.initState();
    if (widget.initialIndex != null) {
      selectedIndex = widget.initialIndex!;
    }
  }

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

  int selectedIndex = -1;
  _getChildren() => List.generate(
        widget.items.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            bottom: widget.horizontalPadding == null? 8.0:widget.horizontalPadding??0,

            right: widget.axis == Axis.horizontal ? 8.0 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onChange(selectedIndex);
            },
            child: WSelectButton(
              txt: widget.items[index],
              isSelected: selectedIndex == index,
            ),
          ),
        ),
      );
}
