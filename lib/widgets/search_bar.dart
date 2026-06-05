import 'package:flutter/material.dart';

import '../models/models.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required this.currentUser});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 56,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: colorScheme.surface,
        ),
        padding: const EdgeInsets.fromLTRB(31, 12, 12, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.search, color: colorScheme.onSurfaceVariant),

            const SizedBox(width: 23.5),
            Expanded(
              child: TextField(
                maxLines: 1,
                style: TextStyle(color: colorScheme.onSurface),
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: 'Search replies',

                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
            CircleAvatar(backgroundImage: AssetImage(currentUser.avatarUrl)),
          ],
        ),
      ),
    );
  }
}