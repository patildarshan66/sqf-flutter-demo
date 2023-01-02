import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlf_demo/utils/custom_dimensions.dart';
import 'package:sqlf_demo/utils/custom_text_styles.dart';
import 'package:sqlf_demo/view_model/address_view_model.dart';
import '../../routes/route_strings.dart';
import '../../utils/enums.dart';
import '../widgets/address_list_item.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({Key? key}) : super(key: key);

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  final AddressViewModel _addressViewModel = Get.put(AddressViewModel());

  @override
  void initState() {
    _addressViewModel.getAddressList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: const Text('My Address'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.toNamed(RoutePath.addAddressRoute);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: GetBuilder(
          init: _addressViewModel,
          builder: (context) {
            return _getBody();
          }),
    );
  }

  Widget _getBody() {
    switch (_addressViewModel.response.status) {
      case Status.COMPLETED:
        return _addressViewModel.addressList.isNotEmpty
            ? ListView.builder(
                itemBuilder: (ctx, i) =>
                    AddressListItem(data: _addressViewModel.addressList[i]),
                itemCount: _addressViewModel.addressList.length,
              )
            : Center(
                child: Text(
                  'No address available',
                  style: subTitle2_14ptRegular(),
                ),
              );
      case Status.ERROR:
      case Status.NOINTERNET:
        return Center(
          child: Text(_addressViewModel.response.message ?? ''),
        );
      case Status.LOADING:
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
