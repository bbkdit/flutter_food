// import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_application_1/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  // late String token =
  // "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjQxZWEyYzdhZDgwODEwNjlkZGU3YTg2ZjY2ZmM4MzdmYmQ4YmY0ODIxYTRmN2U5YTZlYjcxOWY0NjEzMDg1MDJlZTBiNTE3NDMzMGY0ZmYiLCJpYXQiOjE2NTg4NDEwNTEuNDcxOTkyLCJuYmYiOjE2NTg4NDEwNTEuNDcxOTk3LCJleHAiOjE2OTAzNzcwNTEuNDY4MjY1LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.bURyxygxjchoA881UzXDmPagZkHb53szi7b4K3S_Z5kNeQXClMV1RmhmNANWWig9AZk2UvmKdfRKCISZAd_1TYyVoXvEMYfxqJac0MNTrkcTa8_6wgeKfXjFu62XUsgWH7nRlSzFSGYOwi7bzQq0JHJGFDIxmCMfPgC-PnG6pujI0Sya5WIYafrUvI3HZ8BLwfoi__IzlNuz4LL1TRSenPus2tfgu_mu9SCYLFwKyXYism9qaUeCjuYEJJs4FKvX5o7E9rZJuAnQDFHKDr2RD6OmS5r13Y89eXLo1fG8525K9GjxPHuWJmI4WO0znNd6m9gDzqIu7pUFgxOWTotejrGd06FYimXr1tVDiXheE8nVThXkCEvm3E27zzO5JmBX_G_8JclP7VkNC2EaZHGYSWXl7EBWBKu4o3iGEoEZ2tMPLlMLsvNnoHnKl5SNHG1mTjUERN_YHvNWgxo05584TW33bS0VfT1xAl35h_isExwK40uzc2bYBYQYmIWWQ1ZZU5l33xIWYxCdnL4H3VerhqsZk7YW8NjDBKRtRZZEEKih9RvgJOuQ0vm6af4gqXqWl6mMS8GAL1SxfJ4w6EynKB6L3jG0topFPLHa8QZ";
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late List<int> zoneIDs = [1];

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 60);
    zoneIDs = zoneIDs;
    // var zoneIDs = [1];
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'zoneId': '1',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjQxZWEyYzdhZDgwODEwNjlkZGU3YTg2ZjY2ZmM4MzdmYmQ4YmY0ODIxYTRmN2U5YTZlYjcxOWY0NjEzMDg1MDJlZTBiNTE3NDMzMGY0ZmYiLCJpYXQiOjE2NTg4NDEwNTEuNDcxOTkyLCJuYmYiOjE2NTg4NDEwNTEuNDcxOTk3LCJleHAiOjE2OTAzNzcwNTEuNDY4MjY1LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.bURyxygxjchoA881UzXDmPagZkHb53szi7b4K3S_Z5kNeQXClMV1RmhmNANWWig9AZk2UvmKdfRKCISZAd_1TYyVoXvEMYfxqJac0MNTrkcTa8_6wgeKfXjFu62XUsgWH7nRlSzFSGYOwi7bzQq0JHJGFDIxmCMfPgC-PnG6pujI0Sya5WIYafrUvI3HZ8BLwfoi__IzlNuz4LL1TRSenPus2tfgu_mu9SCYLFwKyXYism9qaUeCjuYEJJs4FKvX5o7E9rZJuAnQDFHKDr2RD6OmS5r13Y89eXLo1fG8525K9GjxPHuWJmI4WO0znNd6m9gDzqIu7pUFgxOWTotejrGd06FYimXr1tVDiXheE8nVThXkCEvm3E27zzO5JmBX_G_8JclP7VkNC2EaZHGYSWXl7EBWBKu4o3iGEoEZ2tMPLlMLsvNnoHnKl5SNHG1mTjUERN_YHvNWgxo05584TW33bS0VfT1xAl35h_isExwK40uzc2bYBYQYmIWWQ1ZZU5l33xIWYxCdnL4H3VerhqsZk7YW8NjDBKRtRZZEEKih9RvgJOuQ0vm6af4gqXqWl6mMS8GAL1SxfJ4w6EynKB6L3jG0topFPLHa8QZ',
      // AppConstants.ZONE_ID: zoneIDs,
      AppConstants.LOCALIZATION_KEY: 'en'
    };
  }
  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
