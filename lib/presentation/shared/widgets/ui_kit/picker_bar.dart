import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:get/get.dart';

import '../../resources/_ui_resources.dart';

class PickerBarWidget extends StatefulWidget {
  final List<String> items;
  final Function(int index) onChanged;

  const PickerBarWidget({
    super.key,
    required this.items,
    required this.onChanged,
  });

  @override
  State<PickerBarWidget> createState() => _PickerBarWidgetState();
}

class _PickerBarWidgetState extends State<PickerBarWidget> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: padding16),
      width: double.infinity,
      height: 46,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: padding16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var isSelected = _selectedCategory == index;
          return TransparentGestureDetector(
            onTap: () => setState(() {
              _selectedCategory = index;
              widget.onChanged(index);
            }),
            child: AnimatedContainer(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              margin: const EdgeInsets.only(right: padding8),
              decoration: BoxDecoration(
                color: isSelected ? UIColors.primary : null,
                borderRadius: BorderRadius.circular(padding12),
              ),
              duration: 100.milliseconds,
              child: Text(
                widget.items[index],
                style: UITextStyles.boldSmall.copyWith(
                  color: isSelected ? UIColors.white : UIColors.primary40,
                ),
              ),
            ),
          );
        },
        itemCount: widget.items.length,
      ),
    );
  }
}
