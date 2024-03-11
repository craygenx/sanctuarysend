import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  final List<String> categories;
  final ValueChanged<String> onChanged;

  const CategoryDropdown({super.key, required this.categories, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: categories.isNotEmpty ? categories[0] : '',
        items: categories.map((String category) {
          return DropdownMenuItem<String>(
            value: category,
              child: Text(category),
          );
        }).toList(),
        onChanged: (String? newVal){
          onChanged(newVal!);
        },
      isExpanded: true,
      hint: const Text('Select an option'),
    );
  }
}
