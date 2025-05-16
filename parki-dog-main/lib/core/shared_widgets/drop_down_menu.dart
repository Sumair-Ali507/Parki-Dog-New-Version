import 'package:parki_dog/core/utils/custom_types.dart';
import 'package:parki_dog/core/utils/strings_manager.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//just modify styles and borders validation
class CustomDropdownButton<T> extends StatefulWidget {
  final T? value;
  final List<T> itemsList;
  final String? hint;
  final IconData? icon;
  final bool isEnabled;
  final bool showMenuTitle;
  final bool isRequired;
  final double menuMaxHeight;
  final T? initSelectedItem;
  final DropDownItemName<T> dropDownItemName;
  final DropDownItemChange<T>? dropDownItemChange;

  const CustomDropdownButton({
    super.key,
    required this.itemsList,
    this.value,
    this.hint,
    this.icon,
    this.isEnabled = true,
    this.isRequired = false,
    this.showMenuTitle = false,
    this.menuMaxHeight = AppDouble.d300,
    required this.dropDownItemName,
    this.dropDownItemChange,
    this.initSelectedItem,
  });

  @override
  State<CustomDropdownButton<T>> createState() =>
      _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  late T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: _selectedValue,
          icon: widget.icon != null
              ? Icon(
                  widget.icon,
                )
              : null,
          isExpanded: true,
          menuMaxHeight: widget.menuMaxHeight.h,
          dropdownColor: Colors.white,
          // dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          style: const TextStyle(color: Colors.indigo),
          //style
          items: _buildMenuItems(),
          validator: (value) {
            return widget.isRequired && _selectedValue == null
                ? "${widget.hint} ${""}"
                : null;
          },
          onChanged: widget.isEnabled
              ? (T? newValue) {
                  if (newValue != null) {
                    if (widget.dropDownItemChange != null) {
                      widget.dropDownItemChange!(newValue);
                    }
                    setState(() {
                      _selectedValue = newValue;
                    });
                  }
                }
              : null,
          hint: widget.hint != null
              ? Text(
                  widget.hint!,
                  style: const TextStyle(color: Colors.indigo),
                )
              : null,
        ),
      ),
    );
  }

  List<DropdownMenuItem<T>> _buildMenuItems() {
    var list = List<DropdownMenuItem<T>>.empty(growable: true);
    if (widget.showMenuTitle) {
      list.add(DropdownMenuItem<T>(
        enabled: false,
        value: null,
        child: Text(
          widget.hint ?? StringsManager.emptyString,
          // style: ,
        ),
      ));
    }
    list.addAll(widget.itemsList.map((T item) {
      return DropdownMenuItem<T>(
        value: item,
        child: Text(
          widget.dropDownItemName(item),
          // style: ,
        ),
      );
    }).toList());
    return list;
  }
}
