import 'package:dartz/dartz.dart';
import 'package:frog_list/core/shared/error/failures.dart';
import 'package:frog_list/core/shared/use_cases/use_case.dart';
import 'package:frog_list/features/dashboard/domain/entities/dashboard_list_entity.dart';
import 'package:frog_list/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardLists
    extends UseCase<List<DashboardListEntity>, NoParams> {
  final DashboardRepository dashboardRepository;

  GetDashboardLists(this.dashboardRepository);

  @override
  Future<Either<Failure, List<DashboardListEntity>>> call(params) async {
    return await dashboardRepository.getDashboardLists();
  }
}