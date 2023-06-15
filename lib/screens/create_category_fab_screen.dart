import 'package:baby_buy/services/auth/auth_service.dart';
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

  Future<CloudCategory> createOrGetExistingCategory(
      BuildContext context) async {
    final widgetCategory = context.getArgument<CloudCategory>();

    if (widgetCategory != null) {
      _category = widgetCategory;
      _title.text = widgetCategory.title;
      _description.text = widgetCategory.description;
      return widgetCategory;
    }

    final existingCategory = _category;
    if (existingCategory != null) {
      return existingCategory;
    }

    final currentUser = AuthService.firebase().currentUser!;

    final userId = currentUser.id;
    final newCategory =
        await _categoryService.createCategory(ownerUserId: userId);
    _category = newCategory;
    return newCategory;
  }

  void _deleteCategoryIfTextIsEmpty() {
    final category = _category;
    if (_title.text.isEmpty && _description.text.isEmpty && category != null) {
      _categoryService.deleteCategory(documentId: category.documentId);
    }
  }

  // void _saveCategoryIfTextNotEmpty() async {
  //   final category = _category;
  //   final title = _title.text;
  //   final description = _description.text;
  //   if (category != null && title.isNotEmpty && description.isNotEmpty) {
  //     await _categoryService.updateCategory(
  //       documentId: category.documentId,
  //       title: title,
  //       description: description,
  //     );
  //   }
  // }

  @override
  void dispose() {
    _deleteCategoryIfTextIsEmpty();
    // _saveCategoryIfTextNotEmpty();
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFCEE7EF),
        onPressed: () {
          createOrGetExistingCategory(context);
          Navigator.of(context).pop();
        },
        label: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage(assetName))
            //   ),
            // ),
            Icon(
              CupertinoIcons.check_mark,
              color: Colors.black,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Save',
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),

      /// must understand
      /// since I already have a category ListTile screen, all i nned now is a
      /// category container inside a singleChildScrollView wrapped inside a
      /// sizedBox or Container to give it a constraint or constant height of
      /// how much space it can occupy on the main screen. The tile is going to
      /// be inside the container as another screen but created inside the
      /// container screen, that is, as the container screen is created, the
      /// listview screen is also created.
      backgroundColor: Colors.deepPurple.shade500,
      body: FutureBuilder(
        future: createOrGetExistingCategory(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              _setupTextControllerListener();
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            CupertinoIcons.clear_circled,
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 90.0,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.0,
                          width: 3.0,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        SizedBox(
                          width: 350.0,
                          child: TextField(
                            controller: _title,
                            enableSuggestions: true,
                            autocorrect: true,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'Title: Bags',
                              hintStyle: TextStyle(
                                fontFamily: 'SpaceGrotesk',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(20.0),
                              //   borderSide: BorderSide.none,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 35.0,
                          width: 3.0,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        SizedBox(
                          width: 350.0,
                          child: TextField(
                            controller: _description,
                            enableSuggestions: true,
                            autocorrect: true,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'describe the item',
                              hintStyle: TextStyle(
                                fontFamily: 'SpaceGrotesk',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(20.0),
                              //   borderSide: BorderSide.none,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            default:
              const CircularProgressIndicator();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
