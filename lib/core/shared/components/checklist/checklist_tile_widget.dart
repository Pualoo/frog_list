import 'package:animated_line_through/animated_line_through.dart';
import 'package:flutter/material.dart';
import 'package:frog_list/core/shared/components/generic_widgets/generic_list_tile_widget.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class ChecklistTileWidget extends StatefulWidget {
  const ChecklistTileWidget({super.key, required this.checkListTileParams});
  final CheckListTileParams checkListTileParams;

  @override
  State<ChecklistTileWidget> createState() => _ChecklistTileWidgetState();
}

class _ChecklistTileWidgetState extends State<ChecklistTileWidget> {
  late String text;
  late bool isChecked;

  _changeCheckState(bool newCheckState) {
    setState(() {
      isChecked = newCheckState;
    });
  }

  @override
  void initState() {
    text = widget.checkListTileParams.text;
    isChecked = widget.checkListTileParams.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericListTileWidget(
        leading: _CheckBoxWidget(
          changeCheckState: _changeCheckState,
          isChecked: isChecked,
        ),
        title: _CheckBoxTextWidget(
          isChecked: isChecked,
          text: text,
        ),
        onTap: () => _changeCheckState(!isChecked),
    );
  }
}

class _CheckBoxWidget extends StatefulWidget {
  const _CheckBoxWidget({
    required this.isChecked,
    required this.changeCheckState,
  });
  final bool isChecked;
  final Function(bool) changeCheckState;

  @override
  State<_CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<_CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return MSHCheckbox(
      style: MSHCheckboxStyle.fillScaleCheck,
      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
        checkedColor: Colors.teal,
      ),
      duration: const Duration(seconds: 1),
      onChanged: (newCheckBoxValue) =>
          widget.changeCheckState(newCheckBoxValue),
      value: widget.isChecked,
    );
  }
}

class _CheckBoxTextWidget extends StatelessWidget {
  const _CheckBoxTextWidget({
    required this.isChecked,
    required this.text,
  });
  final bool isChecked;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedLineThrough(
      isCrossed: isChecked,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCirc,
      child: Text(text),
    );
  }
}

class CheckListTileParams {
  final String text;
  final bool isChecked;

  CheckListTileParams({
    required this.text,
    this.isChecked = false,
  });
}
