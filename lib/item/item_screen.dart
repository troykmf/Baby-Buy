// import 'package:baby_buy/services/cloud/cloud_category.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ItemScreen extends StatefulWidget {
//   const ItemScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ItemScreen> createState() => _ItemScreenState();
// }
//
// class _ItemScreenState extends State<ItemScreen> {
//   CloudCategory? _category;
//
//   @override
//   Widget build(BuildContext context) {
//     final category = _category;
//     return FutureBuilder(
//         future: ,
//         builder: (context, snapshot) {
//             return ListView(
//               children: [
//                 Container(
//                   color: Colors.green.shade600,
//                   height: 220.0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 CupertinoIcons.arrow_left,
//                                 color: Colors.white,
//                                 size: 20.0,
//                               ),
//                             ),
//                             Container(
//                               width: 210.0,
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 Icons.edit_outlined,
//                                 color: Colors.white,
//                                 size: 20.0,
//                               ),
//                             ),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   Icons.create_new_folder,
//                                   size: 20.0,
//                                 ))
//                           ],
//                         ),
//                         // const SizedBox(
//                         //   height: 15.0,
//                         // ),
//                         const Column(
//                           children: [
//                             Text(
//                               'Dress',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 22.0,
//                                 fontFamily: 'SpaceGrotesk',
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 5.0,
//                             ),
//                             Text(
//                               'Description',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: 'SpaceGrotesk',
//                               ),
//                             ),
//                             SizedBox(
//                               height: 13.0,
//                             ),
//                             Icon(
//                               CupertinoIcons.check_mark_circled,
//                               color: Colors.white,
//                             ),
//                             Text(
//                               'category.length items',
//                               style: TextStyle(color: Colors.white),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             );
//           }
//           );
//
//
//     // Scaffold(
//     //   body: F
//
//
//   }
// }
import 'package:baby_buy/constants/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../category/category_list_view.dart';
import '../services/auth/auth_service.dart';
import '../services/cloud/cloud_category.dart';
import '../services/cloud/firebase_cloud_category_storage.dart';

class ItemDisplayScreen extends StatefulWidget {
  const ItemDisplayScreen({Key? key}) : super(key: key);

  @override
  State<ItemDisplayScreen> createState() => _ItemDisplayScreenState();
}

class _ItemDisplayScreenState extends State<ItemDisplayScreen> {
  CloudCategory? category;
  late final FirebaseCloudCategoryStorage _categoryService;
  String get userId => AuthService.firebase().currentUser!.id;

  @override
  void initState() {
    _categoryService = FirebaseCloudCategoryStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: _categoryService.allCategories(ownerUserId: userId),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            if (snapshot.hasData) {
              final _category = category;
              final allCategory = snapshot.data as Iterable<CloudCategory>;
              return Column(
                children: [
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.blue.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.arrow_left,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ),
                              const SizedBox(
                                width: 210.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.create_new_folder,
                                  size: 20.0,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Title',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontFamily: 'SpaceGrotesk',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SpaceGrotesk',
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Icon(
                            CupertinoIcons.check_mark_circled,
                            color: Colors.white,
                          ),
                          const Text(
                            'No items',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SpaceGrotesk',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: CategoryListView(
                        category: allCategory,
                        onDeleteCategory: (category) async {
                          await _categoryService.deleteCategory(
                            documentId: category.documentId,
                          );
                        },
                        onTap: (category) {
                          Navigator.of(context).pushNamed(
                            categoryFabRoute,
                            arguments: category,
                          );
                        }),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    ));
  }
}

// Container(
// height: 220.0,
// width: double.infinity,
// color: Colors.blue.shade400,
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// Row(
// children: [
// IconButton(
// onPressed: () {},
// icon: const Icon(
// CupertinoIcons.arrow_left,
// color: Colors.white,
// size: 20.0,
// ),
// ),
// const SizedBox(
// width: 210.0,
// ),
// IconButton(
// onPressed: () {},
// icon: const Icon(
// Icons.edit_outlined,
// color: Colors.white,
// size: 20.0,
// ),
// ),
// IconButton(
// onPressed: () {},
// icon: const Icon(
// Icons.create_new_folder,
// size: 20.0,
// ),
// ),
// ],
// ),
// const Text('Title'),
// const Text('Description'),
// const Icon(
// CupertinoIcons.check_mark_circled,
// color: Colors.white,
// ),
// const Text('no items'),
// ],
// ),
// ),
// ),
// ListView.builder(
// itemCount: 3,
// itemBuilder: (context, index) {
// Row(
// children: [
// Container(
// height: 50.0,
// width: 50.0,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(10.0),
// bottomLeft: Radius.circular(10.0),
// ),
// ),
// child: const Icon(Icons.person)),
// Container(
// height: 50.0,
// width: 100.0,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(10.0),
// bottomLeft: Radius.circular(10.0),
// ),
// ),
// child: const Icon(Icons.person)),
// ],
// );
// },
// ),
