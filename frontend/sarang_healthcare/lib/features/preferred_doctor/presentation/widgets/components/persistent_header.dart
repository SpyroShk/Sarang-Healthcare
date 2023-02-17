import 'package:flutter/material.dart';

class PersitentHeader extends SliverPersistentHeaderDelegate {
  PersitentHeader({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });

  final double maxHeight;
  final double minHeight;
  final Widget child;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child;

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
