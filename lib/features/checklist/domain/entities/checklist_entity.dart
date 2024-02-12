import 'package:equatable/equatable.dart';

class ChecklistPropertiesEntity extends Equatable {
  final String text;
  final bool isChecked;

  const ChecklistPropertiesEntity({
    required this.text,
    required this.isChecked,
  });

  @override
  List<Object> get props => [
        text,
        isChecked,
      ];
}
