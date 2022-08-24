import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String) onFieldSubmit;
  final void Function() clearText;
  const TextFieldWidget({Key? key, required this.searchController, required this.onFieldSubmit, required this.clearText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextFormField(
                  controller: searchController,
                  onFieldSubmitted: onFieldSubmit,
                  decoration:  InputDecoration(
                      prefixIcon:  const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: clearText
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none
                  )),
            )));
  }
}
