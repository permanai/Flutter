import 'package:dio/dio.dart';

class apiController {
  Future<List<dynamic>> getdatas() async {
    final response = await Dio().get('https://saiyaapi.site' + '/cnth/prak');
    final datas = response.data['payload'];
    return datas;
  }
}
