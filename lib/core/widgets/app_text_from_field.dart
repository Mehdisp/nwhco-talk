import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? labelSuffix;
  final String hint;
  final String? initText;
  final bool required;
  final bool readOnly;
  final bool canRequestFocus;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final int lines;
  final bool? enabled;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? prefixText;
  final EdgeInsetsGeometry? contentPadding;
  final bool? filled;
  final Color? fillColor;
  final FocusNode? focusNode;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool disposeControllerFromHere;
  final bool obscureText;
  final TextDirection? textDirection;
  final TextDirection? hintTextDirection;

  const AppTextFormField({
    required this.hint,
    this.contentPadding,
    this.label,
    this.labelSuffix,
    this.initText,
    this.focusNode,
    this.enabledBorder,
    this.border,
    this.suffixIcon,
    this.focusedBorder,
    this.prefixText,
    this.controller,
    this.prefixIcon,
    this.prefix,
    this.filled,
    this.fillColor,
    this.autovalidateMode,
    this.required = false,
    this.canRequestFocus = true,
    this.autoFocus = false,
    this.enabled,
    this.textInputAction,
    this.lines = 1,
    this.onChanged,
    this.onSubmit,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.textDirection,
    this.hintTextDirection,
    this.disposeControllerFromHere = true,
    super.key,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late final TextEditingController _controller;
  String? _validationError;
  TextDirection? _textDirection;

  @override
  void initState() {
    super.initState();
    _textDirection = widget.textDirection;
    _controller = widget.controller ?? TextEditingController();

    if (widget.initText != null) {
      _controller.text = widget.initText!;
      _controller.selection = TextSelection.collapsed(
        offset: _controller.text.length,
      );

      if (widget.textDirection == null) {
        final isRTL = Bidi.detectRtlDirectionality(_controller.text);
        _textDirection = isRTL ? TextDirection.rtl : TextDirection.ltr;
      }
    }

    _controller.addListener(() {
      if (widget.textDirection != null) return;

      final isRTL = _controller.text.isEmpty
          ? context.isRtl
          : Bidi.detectRtlDirectionality(_controller.text);
      if (!mounted) return;

      setState(() {
        _textDirection = isRTL ? TextDirection.rtl : TextDirection.ltr;
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputDecorationTheme = Theme.of(context).inputDecorationTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                if (widget.required)
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: Colors.red),
                  ),
                if (widget.labelSuffix != null)
                  TextSpan(
                    text: ' ${widget.labelSuffix}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey3,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 9)
        ],
        Directionality(
          textDirection: widget.textDirection ?? Directionality.of(context),
          child: TextFormField(
            controller: _controller,
            focusNode: widget.focusNode,
            autofocus: widget.autoFocus,
            maxLines: widget.lines,
            onFieldSubmitted: widget.onSubmit,
            canRequestFocus: widget.canRequestFocus,
            enabled: widget.enabled,
            minLines: widget.lines,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            maxLength: widget.maxLength,
            onTap: widget.onTap,
            obscureText: widget.obscureText,
            textInputAction: widget.textInputAction,
            autovalidateMode: widget.autovalidateMode,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            textDirection: _textDirection,
            validator: (value) {
              final error = widget.validator?.call(value);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _validationError = error;
                });
              });
              return error;
            },
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              counter: const SizedBox(),
              contentPadding:
                  widget.contentPadding ?? inputDecorationTheme.contentPadding,
              filled: widget.filled,
              hintTextDirection: widget.hintTextDirection,
              fillColor: widget.fillColor,
              suffixIcon: widget.suffixIcon,
              suffixIconConstraints: widget.suffixIconConstraints,
              prefixIconConstraints: widget.prefixIconConstraints,
              prefixIcon: widget.prefixIcon,
              prefix: widget.prefix,
              prefixText: widget.prefixText,
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: widget.hint,
              prefixStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey3,
                height: widget.lines != 1 ? 1.6 : null,
              ),
              border: _validationError != null
                  ? inputDecorationTheme.errorBorder
                  : widget.border,
              enabledBorder: _validationError != null
                  ? inputDecorationTheme.errorBorder
                  : widget.enabledBorder,
              focusedBorder: _validationError != null
                  ? inputDecorationTheme.errorBorder
                  : widget.focusedBorder,
              errorStyle: TextStyle(height: 0, fontSize: 0),
            ),
          ),
        ),
        if (_validationError != null)
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/meet_alert.svg',
                width: 13.5,
                height: 13.5,
              ),
              const SizedBox(width: 6),
              Text(
                _validationError!,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffC83532),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
