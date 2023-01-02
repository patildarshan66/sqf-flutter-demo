import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlf_demo/model/address.dart';
import 'package:sqlf_demo/routes/route_strings.dart';

import '../../utils/custom_dimensions.dart';
import '../../utils/custom_text_styles.dart';
import '../../view_model/address_view_model.dart';

class AddressListItem extends StatelessWidget {
  final Address data;
  AddressListItem({Key? key, required this.data}) : super(key: key);
  final AddressViewModel _addressViewModel = Get.find<AddressViewModel>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: px_20, vertical: px_10),
      padding: const EdgeInsets.all(px_15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(px_15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
              color: Colors.black26,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(RoutePath.editAddressRoute, arguments: data);
                },
                child: const Icon(Icons.edit_outlined),
              ),
              const SizedBox(width: px_8),
              InkWell(
                onTap: () {
                  _addressViewModel.deleteAddress(data.id ?? 0);
                },
                child: const Icon(Icons.delete_outline),
              ),
            ],
          ),
          Text(data.name, style: subTitle1_16ptBold()),
          const SizedBox(height: px_8),
          Text('+91 ${data.number}'),
          const SizedBox(height: px_8),
          Text('${data.address}, ${data.landmark} - ${data.pincode}'),
        ],
      ),
    );
  }
}
