import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frog_list/core/shared/error/failures.dart';
import 'package:frog_list/core/shared/use_cases/use_case.dart';
import 'package:frog_list/features/checklist/domain/entities/checklist_entity.dart';
import 'package:frog_list/features/dashboard/domain/entities/dashboard_list_entity.dart';
import 'package:frog_list/features/dashboard/domain/use_cases/get_dashboard_lists.dart';

import 'package:mockito/mockito.dart';

import 'add_new_list_test.mocks.dart';

void main() {
  late GetDashboardLists useCase;
  late MockDashboardRepository mockDashboardRepository;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    useCase = GetDashboardLists(mockDashboardRepository);
  });

  test(
    'should get empty list of dashboard from the repository',
        () async {
      // arrange
      const String tNameTest = 'Test';
      final tList = [
        const DashboardListEntity(
            name: tNameTest, checklistPropertiesEntityList: []),
      ];
      when(mockDashboardRepository.getDashboardLists())
          .thenAnswer((_) => Right(tList));
      // act
      final result = await useCase(NoParams());
      // assert
      expect(result, Right(tList));
      verify(mockDashboardRepository.getDashboardLists());
      verifyNoMoreInteractions(mockDashboardRepository);
    },
  );

  test(
    'should get all lists of dashboard from the repository',
        () async {
      // arrange
      const String tNameTest = 'Test';
      final checklistPropertiesEntityList = [const ChecklistPropertiesEntity(text: 'Test1', isChecked: false), const ChecklistPropertiesEntity(text: 'Test2', isChecked: false), const ChecklistPropertiesEntity(text: 'Test3', isChecked: false),];
      final tList = [
        DashboardListEntity(
          name: tNameTest, checklistPropertiesEntityList: checklistPropertiesEntityList,),
      ];
      when(mockDashboardRepository.getDashboardLists())
          .thenAnswer((_) => Right(tList));
      // act
      final result = await useCase(NoParams());
      // assert
      expect(result, Right(tList));
      verify(mockDashboardRepository.getDashboardLists());
      verifyNoMoreInteractions(mockDashboardRepository);
    },
  );

  test(
    'should try get list but return Cache Failure from the repository',
        () async {
      // arrange
      when(mockDashboardRepository.getDashboardLists())
          .thenAnswer((_) => Left(CacheFailure()));
      // act
      final result = await useCase(NoParams());
      // assert
      expect(result, Left(CacheFailure()));
      verify(mockDashboardRepository.getDashboardLists());
      verifyNoMoreInteractions(mockDashboardRepository);
    },
  );
}
