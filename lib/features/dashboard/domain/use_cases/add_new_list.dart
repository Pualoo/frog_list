import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:frog_list/core/shared/error/failures.dart';
import 'package:frog_list/core/shared/use_cases/use_case.dart';
import 'package:frog_list/features/dashboard/domain/entities/dashboard_list_entity.dart';
import 'package:frog_list/features/dashboard/domain/repositories/dashboard_repository.dart';

class AddNewList
    extends UseCase<List<DashboardListEntity>, AddNewListParams> {
  final DashboardRepository dashboardRepository;

  AddNewList(this.dashboardRepository);

  @override
  Future<Either<Failure, List<DashboardListEntity>>> call(params) async {
    return await dashboardRepository.addNewList(params.name);
  }
}

class AddNewListParams extends Equatable {
  final String name;

  const AddNewListParams({required this.name});

  @override
  List<Object> get props => [name];
}