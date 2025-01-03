import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardTabItem {
  CardTabItem({
    required this.name,
    required this.child,
  });

  final String name;
  final Widget Function(void Function(CardTab page)) child;
}

class CardTab extends StatelessWidget {
  const CardTab({
    required this.initialPage,
    required this.items,
    required this.onPageChanged,
    required this.onPageAdded,
    required this.onPageRemoved,
    super.key,
  });

  final int initialPage;
  final List<CardTabItem> items;
  final void Function(int page) onPageChanged;
  final void Function(CardTab page) onPageAdded;
  final void Function(int page) onPageRemoved;

  CardTab copyWithNewItem({required CardTabItem item}) {
    final items = List<CardTabItem>.from(this.items)..add(item);
    return CardTab(
      items: items,
      initialPage: items.length - 1,
      onPageAdded: onPageAdded,
      onPageChanged: onPageChanged,
      onPageRemoved: onPageRemoved,
    );
  }

  CardTab copyWithSetPage({required int page}) {
    return CardTab(
      items: items,
      initialPage: page,
      onPageAdded: onPageAdded,
      onPageChanged: onPageChanged,
      onPageRemoved: onPageRemoved,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _MonthYearTitle(
                name: items[index].name,
                isSelected: index == initialPage,
                onRemove: () => onPageRemoved(index),
                onTap: () => onPageChanged(index),
              );
            },
            itemCount: items.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Gap(12);
            },
          ),
        ),
        const Gap(12),
        List.generate(
          items.length,
          (index) => items[index].child(onPageAdded),
        )[initialPage],
      ],
    );
  }
}

class _MonthYearTitle extends StatelessWidget {
  const _MonthYearTitle({
    required this.name,
    required this.isSelected,
    required this.onTap,
    required this.onRemove,
  });

  final bool isSelected;
  final String name;
  final void Function() onTap;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final foregroundColor = isSelected ? Colors.white : null;

    return Card(
      elevation: 5,
      color: isSelected ? primaryColor : Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(name, style: TextStyle(color: foregroundColor)),
              const Gap(12),
              InkWell(
                onTap: onRemove,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: kIsWeb ? 5 : 0),
                  child: Icon(Icons.cancel, color: foregroundColor, size: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
