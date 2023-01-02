import 'package:sqlf_demo/model/services/address_service.dart';
import 'package:sqlf_demo/model/services/base_service.dart';

import 'address.dart';


class AddressRepository {
  final BaseService _addressService = AddressService();

  Future<List<Address>> fetchAddressList() async {
    dynamic response = await _addressService.getEntries();
    List<Address> addressList = List<Address>.from(response.map((tagJson) => Address.fromJson(tagJson)));
    return addressList;
  }

  Future<bool> updateAddress(String tableName,int id, Map<String,dynamic> data) async {
    dynamic response = await _addressService.updateEntry(tableName, id, data);
    return response;
  }

  Future<bool> addAddress(String tableName, Map<String,dynamic> data) async {
    dynamic response = await _addressService.addEntry(tableName, data);
    return response;
  }

  Future<bool> deleteAddress(String tableName,int id) async {
    dynamic response = await _addressService.deleteEntry(tableName, id);
    return response;
  }

}
