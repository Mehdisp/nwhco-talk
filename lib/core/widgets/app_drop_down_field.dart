import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nwhco_app/core/util/extensions/num_extensions.dart';
import 'package:nwhco_app/core/widgets/app_text_from_field.dart';
import 'package:nwhco_app/core/values/colors.dart';

class AppDropdownField<T> extends StatefulWidget {
  final String hint;
  final String? label;
  final bool? required;
  final ThemeData? themeData;
  final List<AppDropdownMenuItem<T>> items;
  final dynamic value;
  final bool multiSelect;
  final String joinItemsString;
  final bool? filled;
  final Color? fillColor;
  final void Function(dynamic value)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const AppDropdownField({
    super.key,
    required this.hint,
    required this.items,
    this.focusNode,
    this.label,
    this.validator,
    this.joinItemsString = ', ',
    this.multiSelect = false,
    this.required,
    this.value,
    this.filled,
    this.fillColor,
    this.themeData,
    this.onChanged,
  }) : assert(
            (multiSelect && value is List) || (!multiSelect && value is! List));

  @override
  State<AppDropdownField<T>> createState() => _AppDropdownFieldState<T>();
}

class _AppDropdownFieldState<T> extends State<AppDropdownField<T>> {
  final focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;
  dynamic _value;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _value = widget.value;
    _textEditingController = TextEditingController();
    _setFieldTitle();
    super.initState();
  }

  _setFieldTitle() {
    if (widget.multiSelect) {
      List<AppDropdownMenuItem> selectedItems =
          widget.items.where((e) => widget.value.contains(e.value)).toList();
      final String? titles = selectedItems.isNotEmpty
          ? selectedItems
              .map((e) => e.selectedTitle ?? e.title)
              .toList()
              .join(widget.joinItemsString)
          : null;
      _textEditingController.text = titles ?? '';
    } else {
      AppDropdownMenuItem? selectedItem =
          widget.items.firstWhereOrNull((e) => e.value == _value);
      _textEditingController.text = selectedItem?.title ?? '';
    }
  }

  @override
  void didUpdateWidget(covariant AppDropdownField<T> oldWidget) {
    _value = widget.value;
    _setFieldTitle();
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (_overlayEntry != null) {
      if (_overlayEntry!.mounted) {
        _overlayEntry!.remove();
        _overlayEntry = null;
      }
    }
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final itemsHeight = widget.items.length * 48.0;
    final maxCardHeight = itemsHeight > 280.0 ? 280.0 : itemsHeight;
    return OverlayEntry(
      builder: (_) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _toggleDropdown,
        child: Theme(
          data: widget.themeData ?? Theme.of(context),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            child: StatefulBuilder(
              builder: (context, builderSetState) {
                return Stack(
                  children: [
                    Positioned(
                      left: offset.dx,
                      top: offset.dy + size.height + 10,
                      width: size.width,
                      child: Material(
                        elevation: 4.0,
                        color: isDark ? AppColors.grey5 : AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: maxCardHeight,
                            child: ListView(
                              padding: const EdgeInsets.only(bottom: 30),
                              shrinkWrap: true,
                              children: widget.items
                                  .map(
                                    (e) => _AppDropdownMenuItemWidget(
                                      isSelected: widget.multiSelect
                                          ? _value.contains(e.value)
                                          : e.value == _value,
                                      item: e,
                                      onTap: () {
                                        if (!widget.multiSelect) {
                                          if (widget.onChanged != null) {
                                            widget.onChanged!(e.value);
                                          }
                                          builderSetState(() {
                                            _value = e.value;
                                          });
                                          _setFieldTitle();
                                          Future.delayed(
                                              const Duration(milliseconds: 80),
                                              () {
                                            _toggleDropdown();
                                          });
                                        } else {
                                          if (_value.contains(e.value)) {
                                            _value.remove(e.value);
                                          } else {
                                            _value.add(e.value);
                                          }
                                          builderSetState(() {});
                                          if (widget.onChanged != null) {
                                            widget.onChanged!(_value);
                                          }
                                          _setFieldTitle();
                                        }
                                        setState(() {});
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return PopScope(
      canPop: !_isDropdownOpen,
      onPopInvoked: (value) {
        if (_isDropdownOpen) {
          _toggleDropdown();
        }
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          onTap: () async {
            final focusScope = FocusScope.of(context);

            if (focusScope.focusedChild != focusNode) {
              focusScope.requestFocus(focusNode);
              await 500.msDelay;
            }

            _toggleDropdown();
          },
          child: Container(
            color: Colors.transparent,
            child: IgnorePointer(
              child: AppTextFormField(
                focusNode: widget.focusNode,
                validator: widget.validator,
                controller: _textEditingController,
                required: widget.required ?? false,
                label: widget.label,
                filled: widget.filled,
                hint: widget.hint,
                fillColor: widget.fillColor,
                suffixIcon: Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/icons/drop-down-arrow-down.svg',
                    colorFilter: isDark
                        ? ColorFilter.mode(
                            Theme.of(context).iconTheme.color ??
                                AppColors.grey4,
                            BlendMode.srcIn,
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppDropdownMenuItem<T> {
  final String title;
  final T value;
  final String? selectedTitle;

  AppDropdownMenuItem({
    required this.title,
    required this.value,
    this.selectedTitle,
  });
}

class _AppDropdownMenuItemWidget extends StatelessWidget {
  final bool isSelected;
  final AppDropdownMenuItem item;
  final VoidCallback onTap;

  const _AppDropdownMenuItemWidget({
    required this.isSelected,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isDark ? AppColors.grey5 : AppColors.white,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(14, 13, 14, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 19,
              width: 19,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:
                      isSelected ? Theme.of(context).colorScheme.primary : null,
                  border: isSelected
                      ? null
                      : Border.all(
                          width: 1,
                          color: isDark ? AppColors.grey2 : AppColors.grey3)),
              child: isSelected
                  ? SvgPicture.asset('assets/icons/check.svg')
                  : null,
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? null : AppColors.grey3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
