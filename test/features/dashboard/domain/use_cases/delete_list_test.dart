import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frog_list/core/shared/error/failures.dart';
import 'package:frog_list/core/shared/error/failures.dart';
import 'package:frog_list/features/checklist/domain/entities/checklist_entity.dart';
import 'package:frog_list/features/dashboard/domain/entities/dashboard_list_entity.dart';
import 'package:frog_list/features/dashboard/domain/use_cases/delete_list.dart';

import 'package:mockito/mockito.dart';

import 'add_new_list_test.mocks.dart';

void main() {
  late DeleteList useCase;
  late MockDashboardRepository mockDashboardRepository;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    useCase = DeleteList(mockDashboardRepository);
  });

  test(
    'should delete a list and return empty list of dashboard from the repository',
        () async {
      // arrange
      const String tNameTest = 'Test';
      final tList = [
        const DashboardListEntity(
            name: tNameTest, checklistPropertiesEntityList: []),
      ];
      when(mockDashboardRepository.deleteList(any))
          .thenAnswer((_) async => Right(tList));
      // act
      final result = await useCase(const DeleteListParams(name: tNameTest));
      // assert
      expect(result, Right(tList));
      verify(mockDashboardRepository.deleteList(tNameTest));
      verifyNoMoreInteractions(mockDashboardRepository);
    },
  );

  test(
    'should delete a list and return all lists of dashboard from the repository',
        () async {
      // arrange
      const String tNameTest = 'Test';
      final checklistPropertiesEntityList = [const ChecklistPropertiesEntity(text: 'Test1', isChecked: false), const ChecklistPropertiesEntity(text: 'Test2', isChecked: false), const ChecklistPropertiesEntity(text: 'Test3', isChecked: false),];
      final tList = [
        DashboardListEntity(
          name: tNameTest, checklistPropertiesEntityList: checklistPropertiesEntityList,),
      ];
      when(mockDashboardRepository.deleteList(any))
          .thenAnswer((_) async => Right(tList));
      // act
      final result = await useCase(const DeleteListParams(name: tNameTest));
      // assert
      expect(result, Right(tList));
      verify(mockDashboardRepository.deleteList(tNameTest));
      verifyNoMoreInteractions(mockDashboardRepository);
    },
  );

  test(
    'should try delete list but return Cache Failure from the repository',
        () async {
      // arrange
      const String tNameTest = 'Test';
      when(mockDashboardRepository.deleteList(any))
          .thenAnswer((_) async => Left(CacheFailure()));
      // act
      final result = await useCase(const DeleteListParams(name: tNameTest));
      // assert
      expect(result, Left(CacheFailure()));
      verify(mockDashboardRepository.deleteList(tNameTest));
      verifyNoMoreInteractions(mockDashboardRepository);
    },
  );
}
