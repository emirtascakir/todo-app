import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategory.values.toList();
    return SizedBox(
      height: 60,
      child: Row(children: [
        Text(
          'Category',
          style: context.textTheme.titleLarge,
        ),
        const Gap(10),
        Expanded(
            child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  final category = categories[index];
                  return InkWell(
                    onTap: () {
                      ref.read(categoryProvider.notifier).state = category;
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: CircleContainer(
                      color: category.color.withOpacity(.3),
                      child: Icon(
                        category.icon,
                        color: category == selectedCategory
                            ? context.colorScheme.primary
                            : category.color,
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => const Gap(10),
                itemCount: categories.length))
      ]),
    );
  }
}
