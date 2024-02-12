import 'package:dartz/dartz.dart';
import 'package:frog_list/core/shared/error/failures.dart';
import 'package:frog_list/features/dashboard/domain/entities/dashboard_list_entity.dart';

abstract class DashboardRepository {
  Either<Failure, List<DashboardListEntity>> getDashboardLists();

  Future<Either<Failure, List<DashboardListEntity>>> addNewList(String name);

  Future<Either<Failure, List<DashboardListEntity>>> deleteList(String name);
}
