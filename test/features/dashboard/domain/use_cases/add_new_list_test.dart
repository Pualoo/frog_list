import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frog_list/features/dashboard/domain/entities/dashboard_list_entity.dart';
import 'package:frog_list/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:frog_list/features/dashboard/domain/use_cases/add_new_list.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_new_list_test.mocks.dart';


@GenerateMocks([DashboardRepository])

void main() {
  late AddNewList useCase;
  late MockDashboardRepository mockDashboardRepository;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    useCase = AddNewList(mockDashboardRepository);
  });

  const String tNameTest = 'Test';
  final tListContacts = [
    const DashboardListEntity(name: tNameTest, checklistPropertiesEntityList: []),
  ];

  test(
    'should add new list and return all lists of dashboard from the repository',
        () async {
      // arrange
      when(mockDashboardRepository.addNewList(any))
          .thenAnswer((_) async => Right(tListContacts));
      // act.
      final result =
      await useCase(const AddNewListParams(name: tNameTest));
      // assert
      expect(result, Right(tListContacts));
      verify(mockDashboardRepository.addNewList(tNameTest));
      verifyNoMoreInteractions(mockDashboardRepository);
    },
  );
}