String? validateName(String? value) {
  if ((value ?? '').length < 3) {
    return 'Name must be more than 2 characters';
  } else {
    return null;
  }
}

String? validateAddress(String? value) {
  if ((value ?? '').isEmpty) {
    return 'Enter valid address';
  } else {
    return null;
  }
}

String? validateLandmark(String? value) {
  if ((value ?? '').isEmpty) {
    return 'Enter valid landmark';
  } else {
    return null;
  }
}

String? validateMobile(String? value) {
  String regs = "^[6789]\\d{9}\$";
  final RegExp numRegex = RegExp(regs);
  if (!numRegex.hasMatch(value ?? '')) {
    return 'Enter valid mobile number';
  } else {
    return null;
  }
}

String? validatePincode(String? value) {
  if ((value ?? '').length != 6) {
    return 'Pincode must be of 6 digit';
  } else {
    return null;
  }
}
