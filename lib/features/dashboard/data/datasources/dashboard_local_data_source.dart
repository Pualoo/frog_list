import 'dart:convert';

import 'package:frog_list/core/shared/constants/constants.dart';
import 'package:frog_list/core/shared/error/exceptions.dart';
import 'package:frog_list/features/dashboard/data/models/dashboard_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DashboardLocalDataSource {
  /// Gets the cached list of [DashboardListModel]
  ///
  /// Throws [CacheException] if no cached data is present.
  List<DashboardListModel> getDashboardLists();

  /// Add one item of [DashboardListModel] to the cache.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<DashboardListModel>> addNewList(
    String name,
  );

  /// Delete one item of [DashboardListModel] from the cache.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<DashboardListModel>> deleteList(
    String name,
  );
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final SharedPreferences sharedPreferences;

  DashboardLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<DashboardListModel>> addNewList(String name) async {
    final jsonString = sharedPreferences.getString(kDashboardList);

    List<DashboardListModel> dashboardList = [];

    if (jsonString != null) {
      dashboardList = (jsonDecode(jsonString) as List<dynamic>)
          .map<DashboardListModel>(
              (contact) => DashboardListModel.fromJson(contact))
          .toList();
    }

    dashboardList.add(DashboardListModel(
        name: name, checklistPropertiesEntityList: const []));

    final cacheResponse = await sharedPreferences.setString(kDashboardList,
        jsonEncode(dashboardList.map((contact) => contact.toJson()).toList()));

    if (cacheResponse) {
      return dashboardList;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<DashboardListModel>> deleteList(String name) async {
    final jsonString = sharedPreferences.getString(kDashboardList);

    List<DashboardListModel> dashboardList = [];

    if (jsonString != null) {
      dashboardList = (jsonDecode(jsonString) as List<dynamic>)
          .map<DashboardListModel>(
              (contact) => DashboardListModel.fromJson(contact))
          .toList();
    }

    DashboardListModel? deleteThisList;

    for (var list in dashboardList) {
      if (list.name == name) {
        deleteThisList = list;
      }
    }

    if (deleteThisList == null) {
      return throw CacheException();
    }

    dashboardList.remove(deleteThisList);

    final cacheResponse = await sharedPreferences.setString(kDashboardList,
        jsonEncode(dashboardList.map((contact) => contact.toJson()).toList()));

    if (cacheResponse) {
      return dashboardList;
    } else {
      throw CacheException();
    }
  }

  @override
  List<DashboardListModel> getDashboardLists() {
    final jsonString = sharedPreferences.getString(kDashboardList);

    if (jsonString == null) {
      return [];
    }

    final listContact = (jsonDecode(jsonString) as List<dynamic>)
        .map<DashboardListModel>(
            (contact) => DashboardListModel.fromJson(contact))
        .toList();

    return listContact;
  }
}
