import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  final Function(String)? onItemSelected;
  const MyDropdown({super.key, this.onItemSelected});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  final List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grapes',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Pear',
    'Pineapple',
    'Strawberry',
    'Watermelon'
  ];
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return items.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        setState(() {
          selectedItem = selection;
        });
        if (widget.onItemSelected != null) {
          widget.onItemSelected!(selection);
        }
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: const InputDecoration(
            labelText: 'Enter Church Name',
            border: OutlineInputBorder(),
          ),
          onChanged: (String value) {
            setState(() {
              selectedItem = value;
            });
          },
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: 200.0,
              child: ListView(
                padding: EdgeInsets.zero,
                children: options
                    .map((String option) => ListTile(
                        title: Text(option), onTap: () => onSelected(option)))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
