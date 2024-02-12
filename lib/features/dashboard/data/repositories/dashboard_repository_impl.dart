import 'package:frog_list/core/shared/error/exceptions.dart';
import 'package:frog_list/core/shared/error/failures.dart';
import 'package:frog_list/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:frog_list/features/dashboard/domain/entities/dashboard_list_entity.dart';
import 'package:frog_list/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource localDataSource;

  DashboardRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<DashboardListEntity>>> addNewList(
      String name) async {
    try {
      final dashBoardList = await localDataSource.addNewList(name);
      return Right(dashBoardList);
    } on AlreadyExistException {
      return Left(AlreadyExistFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<DashboardListEntity>>> deleteList(
      String name) async {
    try {
      final dashBoardList = await localDataSource.deleteList(name);
      return Right(dashBoardList);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Either<Failure, List<DashboardListEntity>> getDashboardLists() {
    try {
      final dashBoardList = localDataSource.getDashboardLists();
      return Right(dashBoardList);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
