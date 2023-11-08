import 'package:flutter/material.dart';

import '../../models/classification.dart';

class ParentalRating extends StatelessWidget {
  final Classification? classification;

  const ParentalRating({super.key, required this.classification});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: classification != null
            ? classification!.backgroundColor
            : Colors.grey,
      ),
      margin: const EdgeInsets.only(right: 8.0),
      child: Center(
        child: Text(
          classification != null ? classification!.code : '?',
          style: textTheme.labelMedium!
              .copyWith(color: classification!.foregroundColor),
        ),
      ),
    );
  }
}
