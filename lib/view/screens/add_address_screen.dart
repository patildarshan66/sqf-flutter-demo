import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sqlf_demo/model/address.dart';
import 'package:sqlf_demo/utils/validators.dart';
import 'package:sqlf_demo/view_model/address_view_model.dart';

import '../../utils/custom_dimensions.dart';
import '../widgets/custom_text_field.dart';

class AddAddressScreen extends StatefulWidget {
  final Address? data;
  final bool isUpdate;
  const AddAddressScreen({Key? key, this.data, this.isUpdate = false}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final AddressViewModel _addressViewModel = Get.find<AddressViewModel>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: widget.isUpdate ? const Text('Update Address') : const Text('Add Address'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(px_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  initialValue: widget.data?.name,
                  hint: 'Enter name',
                  labelName: 'Name',
                  validator: validateName,
                  onSave: (value) {
                    _addressViewModel.setName = value ?? '';
                  },
                ),
                CustomTextField(
                  initialValue: widget.data?.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  hint: 'Enter mobile number',
                  labelName: 'Mobile Number',
                  validator: validateMobile,
                  onSave: (value) {
                    _addressViewModel.setNumber = value ?? '';
                  },
                ),
                CustomTextField(
                  initialValue: widget.data?.address,
                  hint: 'Enter address',
                  labelName: 'Address',
                  validator: validateAddress,
                  onSave: (value) {
                    _addressViewModel.setAddress = value ?? '';
                  },
                ),
                CustomTextField(
                  initialValue: widget.data?.landmark,
                  hint: 'Enter landmark',
                  labelName: 'Landmark',
                  validator: validateLandmark,
                  onSave: (value) {
                    _addressViewModel.setLandmark = value ?? '';
                  },
                ),
                CustomTextField(
                  initialValue: widget.data?.pincode,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  hint: 'Enter pincode',
                  labelName: 'Pincode',
                  validator: validatePincode,
                  onSave: (value) {
                    _addressViewModel.setPincode = value ?? '';
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {
                    if(!(_formKey.currentState?.validate() ?? false)){
                      return;
                    }
                    _formKey.currentState?.save();
                    if(widget.isUpdate){
                      _addressViewModel.updateAddress(widget.data?.id ?? 0);
                    }else{
                      _addressViewModel.addAddress();
                    }
                  },
                  child: const Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
