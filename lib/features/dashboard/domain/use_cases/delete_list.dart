import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:frog_list/core/shared/error/failures.dart';
import 'package:frog_list/core/shared/use_cases/use_case.dart';
import 'package:frog_list/features/dashboard/domain/entities/dashboard_list_entity.dart';
import 'package:frog_list/features/dashboard/domain/repositories/dashboard_repository.dart';

class DeleteList extends UseCase<List<DashboardListEntity>, DeleteListParams> {
  final DashboardRepository dashboardRepository;

  DeleteList(this.dashboardRepository);

  @override
  Future<Either<Failure, List<DashboardListEntity>>> call(params) async {
    return await dashboardRepository.deleteList(params.name);
  }
}

class DeleteListParams extends Equatable {
  final String name;

  const DeleteListParams({required this.name});

  @override
  List<Object> get props => [name];
}
