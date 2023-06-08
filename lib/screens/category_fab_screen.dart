import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryFabScreen extends StatefulWidget {
  const CategoryFabScreen({Key? key}) : super(key: key);

  @override
  State<CategoryFabScreen> createState() => _CategoryFabScreenState();
}

class _CategoryFabScreenState extends State<CategoryFabScreen> {
  late final TextEditingController _title;
  late final TextEditingController _description;

  @override
  void initState() {
    _title = TextEditingController();
    _description = TextEditingController();
    super.initState();
  }

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
