import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/custom_dimensions.dart';
import '../../utils/custom_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String labelName;
  final String hint;
  final String? initialValue;
  final Function(String?)? onSave;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField({Key? key, required this.hint, required this.labelName,this.onSave, this.validator, this.initialValue, this.keyboardType = TextInputType.name,this.inputFormatters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: subTitle2_14ptMedium(color: const Color(0xff8e8e8e)),
        ),
        Container(
          margin: const EdgeInsets.only(top: px_10,bottom: px_20),
          padding: const EdgeInsets.symmetric(horizontal: px_8),
          decoration: BoxDecoration(
              color: const Color(0xfff7f7f7),
              borderRadius: BorderRadius.circular(px_8)),
          child: TextFormField(
            keyboardType: keyboardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: inputFormatters,
            initialValue: initialValue,
            style: caption12ptRegular(),
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: caption12ptRegular(),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
