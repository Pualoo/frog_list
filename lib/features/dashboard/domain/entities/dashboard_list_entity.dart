import 'package:equatable/equatable.dart';
import 'package:frog_list/features/checklist/domain/entities/checklist_entity.dart';

class DashboardListEntity extends Equatable {
  final String name;
  final List<ChecklistPropertiesEntity> checklistPropertiesEntityList;

  const DashboardListEntity({
    required this.name,
    required this.checklistPropertiesEntityList,
  });

  @override
  List<Object> get props => [
        name,
        checklistPropertiesEntityList,
      ];
}
