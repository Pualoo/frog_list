import 'package:frog_list/features/checklist/domain/entities/checklist_entity.dart';

class ChecklistPropertiesModel extends ChecklistPropertiesEntity {
  const ChecklistPropertiesModel({
    required super.text,
    required super.isChecked,
  });

  factory ChecklistPropertiesModel.fromJson(Map<String, dynamic> json) {
    return ChecklistPropertiesModel(
      text: json['text'],
      isChecked: json['is_checked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'is_checked': isChecked,
    };
  }
}
