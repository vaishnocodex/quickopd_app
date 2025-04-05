import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/core/themes/horizontal_list.dart';

class ChipWidget extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final Function(int) onSelect;

  const ChipWidget({super.key, 
    required this.options,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      itemCount: options.length,
      itemBuilder: (context, index) {
        IconData genderIcon;
        switch (options[index]) {
          case 'Male':
            genderIcon = Icons.male;
            break;
          case 'Female':
            genderIcon = Icons.female;
            break;
          default:
            genderIcon = Icons.accessibility;
        }

        return GestureDetector(
          onTap: () {
            onSelect(index);
          },
          child: Container(
            decoration: DecorationWidget.boxDecorationWithRoundedCorners(
              backgroundColor: selectedIndex == index
                  ? AppColor.primaryColor
                  : AppColor.viewLineColor,
              borderRadius: BorderRadius.circular(kTextTabBarHeight),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Icon(
                  genderIcon,
                  color: selectedIndex == index
                      ? AppColor.whiteColor
                      : AppColor.appBackgroundColorDark,
                ),
                5.sWidth,
                Text(
                  options[index],
                  style: boldTextStyle(
                    color: selectedIndex == index
                        ? AppColor.whiteColor
                        : AppColor.appBackgroundColorDark,
                  ),
                ),
                6.sWidth,
              ],
            ),
          ),
        );
      },
    );

    // Wrap(
    //   spacing: 8.0,
    //   children: List.generate(
    //     options.length,
    //     (index) {
    //       return Container(
    //         child: Row(
    //           children: [
    //             Icon(Icons.person),
    //             8.sWidth,
    //             Text(
    //               options[index],
    //               style: boldTextStyle(),
    //             )
    //           ],
    //         ),
    //       );

    //       ChoiceChip(
    //         label: Text(options[index]),
    //         selected: selectedIndex == index,
    //         onSelected: (selected) {
    //           onSelect(index); // Pass index to callback
    //         },
    //         selectedColor: selectedIndex == index
    //             ? AppColor.primaryColor
    //             : AppColor.appBackgroundColorDark,
    //         backgroundColor: Colors.grey[200],
    //         labelStyle: TextStyle(
    //           fontWeight: FontWeight.bold,
    //           color:
    //               selectedIndex == index ? AppColor.whiteColor : Colors.black,
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
