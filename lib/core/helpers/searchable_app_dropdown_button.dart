import 'package:dropdown_search/dropdown_search.dart';
import 'package:final_project/core/helpers/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';
class DropdownCustomWidget<T> extends StatefulWidget {
  const DropdownCustomWidget({
    super.key,
    this.selectedItem,
    this.selectedItems,
    required this.items,
    required this.compareFn,
    required this.hintText,
    this.onChanged,
    this.onChangedList,
    this.itemAsString,
    this.searchHintText,
    this.enabled = false,
    this.multiSelect = false,
    this.canOpenPopup = false,
    this.validateList,
    this.validate,
    this.iconColor,
    this.customDropdown = false,
    this.lable,
    this.popUpraints,
    this.validateMode,
    this.dropKey,
  });
  final GlobalKey<DropdownSearchState<T>>? dropKey;

  final AutovalidateMode? validateMode;
  final T? selectedItem;
  final List<T>? selectedItems;
  final List<T> items;
  final Function(T?)? onChanged;
  final Function(List<T>?)? onChangedList;
  final String Function(T)? itemAsString;
  final bool Function(T, T) compareFn;
  final String hintText;
  final String? searchHintText;
  final bool enabled;
  final bool multiSelect;
  final bool canOpenPopup;
  final String? Function(T?)? validate;
  final String? Function(List<T>?)? validateList;
  final String? lable;
  final bool customDropdown;
  final BoxConstraints? popUpraints;
  final Color? iconColor;

  @override
  State<DropdownCustomWidget<T>> createState() =>
      DropdownCustomWidgetState<T>();
}

class DropdownCustomWidgetState<T> extends State<DropdownCustomWidget<T>> {
  late GlobalKey<DropdownSearchState<T>> _key;

  @override
  void initState() {
    _key = widget.dropKey ?? GlobalKey<DropdownSearchState<T>>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      locale: const Locale('ar', 'EG'),
      context: context,
      child: SafeArea(
        child: Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  // decoration: AppStyles.cardShadow(),
                  child:  DropdownSearch<T>(
                          filterFn: (item, filter) {
                            if (filter.isEmpty) {
                              return true;
                            }
                            return widget.itemAsString
                                    ?.call(item)
                                    .toLowerCase()
                                    .startsWith(filter.toLowerCase()) ??
                                false;
                          },
                          key: _key,
                          enabled: widget.enabled,
                          selectedItem: widget.selectedItem,
                          items: widget.items,
                          validator: (value) {
                            return widget.validate?.call(value);
                          },
                          autoValidateMode: widget.validateMode,
                          onChanged: widget.onChanged,
                          dropdownButtonProps: DropdownButtonProps(
                            icon: Icon(
                              CupertinoIcons.chevron_down,
                              color: widget.iconColor ??
                                  ColorsManager.darkBlue,
                              size: 25,
                            ),
                          ),
                          popupProps: PopupPropsMultiSelection.menu(
                            constraints: widget.popUpraints ??
                                const BoxConstraints(maxHeight: 350),
                            searchDelay: const Duration(milliseconds: 0),
                            showSelectedItems: true,
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                              enabled: widget.enabled,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                isDense: true,
                                hintText: widget.searchHintText,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: ColorsManager.darkBlue),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: ColorsManager.darkBlue),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: ColorsManager.lighterBlue,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: ColorsManager.darkBlue,
                                  ),
                                ),
                                hintStyle: const TextStyle(fontSize: 13),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: ColorsManager.darkBlue),
                                ),
                                fillColor: widget.enabled
                                    ? Colors.white
                                    : ColorsManager.lighterBlue,
                              ),
                            ),
                          ),
                          itemAsString: widget.itemAsString,
                          compareFn: widget.compareFn,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            baseStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0,
                            ),
                            dropdownSearchDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              isDense: true,
                              hintText: widget.hintText,
                              enabled: widget.enabled,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: ColorsManager.lighterBlue,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: ColorsManager.lighterBlue,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: ColorsManager.lighterBlue,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: ColorsManager.darkBlue,
                                ),
                              ),
                              hintStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                    color: ColorsManager.darkBlue),
                              ),
                              fillColor: widget.enabled
                                  ? Colors.white
                                  : ColorsManager.lighterBlue,
                            ),
                          ),
                        ),
                ),
              ),
      ),
    );
  }

  void clearSelection() {
    _key.currentState?.clear();
  }

  bool hasSelection() {
    return _key.currentState?.getSelectedItem != null &&
        notNullNorEmpty(_key.currentState?.getSelectedItems);
  }
}

class AppCheckboxTile extends StatelessWidget {
  const AppCheckboxTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.textColor,
    this.activeColor,
  });

  final String title;
  final bool value;
  final Function(bool?) onChanged;

  final bool enabled;
  final Color? textColor;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: enabled
            ? () {
                onChanged(!value);
              }
            : null,
        child: Row(
          children: [
            Checkbox(
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return (activeColor ?? ColorsManager.darkBlue)
                        .withOpacity(.32);
                  }
                  if (states.contains(MaterialState.selected)) {
                    return activeColor ?? ColorsManager.darkBlue;
                  }
                  return Colors.black.withOpacity(0.3);
                },
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              value: value,
              // activeColor: activeColor ?? ColorsManager.darkBlue,
              onChanged: enabled
                  ? (val) {
                      onChanged(val);
                    }
                  : null,
            ),
            Text(
              title,
              style: TextStyle(
                color: enabled ? textColor : ColorsManager.darkBlue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
