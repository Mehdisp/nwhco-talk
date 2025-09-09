import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nwhco_app/core/util/extensions/num_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';

class SelectNumberField extends StatelessWidget {
  final String hint;
  final int min;
  final int max;
  final void Function(int?) onSubmit;
  final void Function(int?) onChanged;

  const SelectNumberField({
    required this.hint,
    required this.onSubmit,
    required this.onChanged,
    this.min = 1,
    this.max = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) => onSubmit(int.tryParse(value)),
      onChanged: (value) => onChanged(int.tryParse(value)),
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text.isEmpty) return newValue;

          final num = int.tryParse(newValue.text);

          if (num == null || num <= min) {
            return newValue.copyWith(
              text: min.toString(),
              selection: newValue.selection.copyWith(
                baseOffset: min.length,
                extentOffset: min.length,
              ),
            );
          }

          if (num > max) {
            return newValue.copyWith(
              text: max.toString(),
              selection: newValue.selection.copyWith(
                baseOffset: max.length,
                extentOffset: max.length,
              ),
            );
          }

          return newValue;
        }),
      ],
      decoration: InputDecoration(
        filled: false,
        hintText: hint,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          color: Color(0xFF8F8F8F),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.grey2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.grey4),
        ),
      ),
    );
  }
}
