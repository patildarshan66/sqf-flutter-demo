import 'package:get/get.dart';
import 'package:sqlf_demo/sqfLite/sqf_lite_operations.dart';
import '../model/address.dart';
import '../model/apis/api_response.dart';
import '../model/address_repository.dart';
import '../utils/utils.dart';

class AddressViewModel extends GetxController {
  final AddressRepository _addressRepository = AddressRepository();
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  List<Address>  _addressList = [];

  String _name = '';
  String _number = '';
  String _address = '';
  String _landmark = '';
  String _pincode = '';

  set setName(String name) {
    _name = name;
  }

  set setNumber(String value) {
    _number = value;
  }

  set setAddress(String value) {
    _address = value;
  }

  set setLandmark(String value) {
    _landmark = value;
  }

  set setPincode(String value) {
    _pincode = value;
  }

  List<Address> get addressList {
    return _addressList;
  }

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> getAddressList() async {
    await isConnected().then((value) async {
      _apiResponse = ApiResponse.loading('Data Received');
      update();
      try{
        _addressList =  await _addressRepository.fetchAddressList();
        _apiResponse = ApiResponse.completed('Data Received');
        update();
      }catch(e){
        _apiResponse = ApiResponse.error(e.toString());
        customPrinter(e.toString());
        showSnackBar(e.toString(), title: 'Error');
        update();
      }
    }).onError((error, stackTrace){
      _apiResponse = ApiResponse.notInternet('No internet connection!');
      update();
    });
  }

  Future<void> addAddress() async {
    await isConnected().then((value) async {
      try{
        final Address data = Address(address: _address, pincode: _pincode, number: _number, landmark: _landmark, name: _name);
        final result =  await _addressRepository.addAddress(addressTableName, data.toJson());
        if(result){
          Get.back();
          showSnackBar('Address added successfully!', title: 'Success');
          getAddressList();
        }else{
          showSnackBar('Something went wrong!!', title: 'Error');
        }
      }catch(e){
        customPrinter(e.toString());
        showSnackBar(e.toString(), title: 'Error');
      }
    }).onError((e, stackTrace){
      customPrinter(e.toString());
      showSnackBar('No internet connection!', title: 'Error');
    });
  }

  Future<void> updateAddress(int id) async {
    await isConnected().then((value) async {
      try{
        final Address data = Address(address: _address, pincode: _pincode, number: _number, landmark: _landmark, name: _name,id: id);
        final result =  await _addressRepository.updateAddress(addressTableName,data.id ?? 0 ,data.toJson());
        if(result){
          Get.back();
          showSnackBar('Address updated successfully!', title: 'Success');
          getAddressList();
        }else{
          showSnackBar('Something went wrong!!', title: 'Error');
        }
      }catch(e){
        customPrinter(e.toString());
        showSnackBar(e.toString(), title: 'Error');
      }
    }).onError((e, stackTrace){
      customPrinter(e.toString());
      showSnackBar('No internet connection!', title: 'Error');
    });
  }

  Future<void> deleteAddress(int id) async {
    await isConnected().then((value) async {
      try{
        final result =  await _addressRepository.deleteAddress(addressTableName,id);
        if(result){
          showSnackBar('Address deleted successfully!', title: 'Success');
          getAddressList();
        }else{
          showSnackBar('Something went wrong!!', title: 'Error');
        }
      }catch(e){
        customPrinter(e.toString());
        showSnackBar(e.toString(), title: 'Error');
      }
    }).onError((e, stackTrace){
      customPrinter(e.toString());
      showSnackBar('No internet connection!', title: 'Error');
    });
  }

}