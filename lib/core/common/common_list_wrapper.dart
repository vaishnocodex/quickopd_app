import 'package:flutter/material.dart';

enum ListType { horizontal, listView, gridView }

class CommonListWrapper<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final ListType listType;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Widget? emptyStateWidget;
  final int gridCrossAxisCount;
  final double gridSpacing;
  final double? spacing;
  final double? runSpacing;
  final bool reverse;
  final ScrollController? controller;
  final WrapAlignment? wrapAlignment;
  final WrapCrossAlignment? crossAxisAlignment;
// final Axis scrollDirection;
  const CommonListWrapper({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.listType = ListType.listView,
    this.padding,
    this.physics,
    this.reverse = false,
    this.emptyStateWidget,
    this.gridCrossAxisCount = 4,
    this.gridSpacing = 8.0,
    this.controller,
    this.wrapAlignment,
    this.crossAxisAlignment,
    this.spacing,
    this.runSpacing,
    // this.scrollDirection = Axis.vertical, // Default to vertical
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return emptyStateWidget ??
          const Center(
            child: Text("No data available"),
          );
    }

    return listType == ListType.listView
        ? SingleChildScrollView(
            physics: physics,
            padding: padding ?? const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            // direction: scrollDirection == Axis.horizontal
            //     ? Axis.horizontal
            //     : Axis.vertical, // Adjust direction based on scrollDirection
            reverse: reverse,
            controller: controller,
            child: Wrap(
              spacing: spacing ?? 8,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              direction: Axis.horizontal,
              runAlignment: wrapAlignment ?? WrapAlignment.start,
              crossAxisAlignment:
                  crossAxisAlignment ?? WrapCrossAlignment.start,
              runSpacing: runSpacing ?? 8,
              children: List.generate(
                  items.length, (index) => itemBuilder(context, items[index])),
            ),
          )
        : SingleChildScrollView(
            physics: physics,
            padding: padding ?? const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            // scrollDirection: scrollDirection, // Use the scrollDirection
            child: Wrap(
              spacing: spacing ?? 0,
              runSpacing: gridSpacing,
              children: items
                  .map((item) => SizedBox(
                        width: (MediaQuery.of(context).size.width /
                                gridCrossAxisCount) -
                            (gridSpacing *
                                (gridCrossAxisCount - 1) /
                                gridCrossAxisCount),
                        child: itemBuilder(context, item),
                      ))
                  .toList(),
            ),
          );
  }
}
