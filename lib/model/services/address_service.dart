import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';

import '../../sqfLite/sqf_lite_operations.dart';
import '../apis/app_exception.dart';
import 'base_service.dart';


class AddressService extends BaseService {

  @override
  Future getEntries() async {
    dynamic responseJson;
    try {
      final sqfController = Get.find<SQFLiteOperations>();
      responseJson = await sqfController.getEntries(addressTableName);
    } on SocketException catch (e){
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  @override
  Future addEntry(String tableName, Map<String, dynamic> data) async {
    dynamic responseJson;
    try {
      final sqfController = Get.find<SQFLiteOperations>();
      responseJson = await sqfController.addEntry(addressTableName,data);
    } on SocketException catch (e){
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  @override
  Future deleteEntry(String tableName,int id) async {
    dynamic responseJson;
    try {
      final sqfController = Get.find<SQFLiteOperations>();
      responseJson = await sqfController.deleteEntry(addressTableName,id);
    } on SocketException catch (e){
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  @override
  Future updateEntry(String tableName, int id, Map<String, dynamic> data) async {
    dynamic responseJson;
    try {
      final sqfController = Get.find<SQFLiteOperations>();
      responseJson = await sqfController.updateEntry(addressTableName,id,data);
    } on SocketException catch (e){
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  dynamic returnResponse(response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
