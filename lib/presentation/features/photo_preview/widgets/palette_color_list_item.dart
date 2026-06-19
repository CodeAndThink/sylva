import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class PaletteColorListItem extends StatelessWidget {
  final Color color;
  final String hex;
  final VoidCallback onTap;
  final bool isSelected;

  const PaletteColorListItem({
    super.key,
    required this.color,
    required this.hex,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: 10.borderRadius,
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface,
                        borderRadius: 10.borderRadius,
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        color: theme.colorScheme.surface,
                        size: 18,
                      ),
                    ),
                  )
                : null,
          ),
          5.height,
          Text(
            hex,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
