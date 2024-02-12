import 'package:flutter/material.dart';
import 'package:frog_list/core/shared/components/checklist/checklist_tile_add_widget.dart';
import 'package:frog_list/core/shared/components/checklist/checklist_tile_widget.dart';
import 'package:frog_list/core/shared/components/generic_widgets/generic_column_widget.dart';

class ChecklistWidget extends StatefulWidget {
  const ChecklistWidget({super.key, required this.checklistItems});
  final List<CheckListTileParams> checklistItems;

  @override
  State<ChecklistWidget> createState() => _ChecklistWidgetState();
}

class _ChecklistWidgetState extends State<ChecklistWidget> {
  @override
  Widget build(BuildContext context) {
    return GenericColumnWidget(children: [
      ...widget.checklistItems.map(
          (checkListItem) => ChecklistTileWidget(
        checkListTileParams: checkListItem,
      ),
    ),
      const ChecklistTileAddWidget(),
      const SizedBox(height: 70,),],);
  }
}
