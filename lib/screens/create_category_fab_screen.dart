import 'package:baby_buy/services/cloud/cloud_category.dart';
import 'package:baby_buy/services/cloud/firebase_cloud_category_storage.dart';
import 'package:baby_buy/utilities/generics/get_arguments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryFabScreen extends StatefulWidget {
  const CategoryFabScreen({Key? key}) : super(key: key);

  @override
  State<CategoryFabScreen> createState() => _CategoryFabScreenState();
}

class _CategoryFabScreenState extends State<CategoryFabScreen> {
  CloudCategory? _category;

  late final FirebaseCloudCategoryStorage _categoryService;

  late final TextEditingController _title;
  late final TextEditingController _description;

  @override
  void initState() {
    _categoryService = FirebaseCloudCategoryStorage();
    _title = TextEditingController();
    _description = TextEditingController();
    super.initState();
  }

  void _textControllerListener() async {
    final category = _category;
    if (category == null) {
      return;
    }
    final title = _title.text;
    final description = _description.text;
    await _categoryService.updateCategory(
      documentId: category.documentId,
      title: title,
      description: description,
    );
  }

  void _setupTextControllerListener() {
    _title.removeListener(_textControllerListener);
    _title.addListener(_textControllerListener);
    _description.removeListener(_textControllerListener);
    _description.addListener(_textControllerListener);
  }

  // Future<CloudCategory> createOrGetExistingCategory(
  //     BuildContext context) async {
  //   final widgetCategory = context.getArgument<CloudCategory>();
  //
  //   if (widgetCategory != null) {
  //     _category = widgetCategory;
  //   }
  // }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  CupertinoIcons.clear_circled,
                  size: 40.0,
                ),
              ],
            ),
            const Text(
              'Enter new category',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'SpaceGrotesk',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30.0,
                  width: 3.0,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                SizedBox(
                  height: 40.0,
                  child: TextField(
                    obscureText: true,
                    controller: _description,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Title: Bags',
                      hintStyle: const TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _description,
            )
          ],
        ));
  }
}
