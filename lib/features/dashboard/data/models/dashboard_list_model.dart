import 'package:frog_list/features/checklist/data/models/checklist_properties_model.dart';
import 'package:frog_list/features/checklist/domain/entities/checklist_entity.dart';
import 'package:frog_list/features/dashboard/domain/entities/dashboard_list_entity.dart';

class DashboardListModel extends DashboardListEntity{
  const DashboardListModel({
    required super.name,
    required super.checklistPropertiesEntityList,
  });

  factory DashboardListModel.fromJson(Map<String, dynamic> json) {
    final List<ChecklistPropertiesEntity> checklistPropertiesListEntity = [];
    if(json['checklist_properties'] != null && json['checklist_properties'] is List) {
      for (var checklist in (json['checklist_properties_list'] as List)) {
        checklistPropertiesListEntity.add(ChecklistPropertiesModel.fromJson(checklist),);
      }
    }

    return DashboardListModel(name: json['name'],
      checklistPropertiesEntityList: checklistPropertiesListEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'checklist_properties_list': checklistPropertiesEntityList,
    };
  }
}