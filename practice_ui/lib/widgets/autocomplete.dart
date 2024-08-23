import 'package:flutter/material.dart';

class MyAutocomplete extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String> onSelected;

  const MyAutocomplete({
    super.key,
    required this.options,
    required this.onSelected,
  });

  @override
  State<MyAutocomplete> createState() => _MyAutocompleteState();
}

class _MyAutocompleteState extends State<MyAutocomplete> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        String input = textEditingValue.text.trim().toLowerCase();

        if (input.isEmpty) {
          return widget.options;
        }

        final filteredOptions = widget.options.where((String option) {
          bool match = option.toLowerCase().contains(input);
          return match;
        });

        return filteredOptions;
      },
      onSelected: widget.onSelected,
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        _textEditingController = textEditingController;
        return TextField(
          controller: _textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            filled: true,
            labelText: 'Type to search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _textEditingController.clear();
                focusNode.unfocus();
              },
            ),
          ),
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return ListTile(
                    title: Text(option),
                    onTap: () {
                      onSelected(option);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
