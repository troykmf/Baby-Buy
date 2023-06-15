import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateItem extends StatefulWidget {
  const CreateItem({Key? key}) : super(key: key);

  @override
  State<CreateItem> createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {
  late final TextEditingController _item;

  @override
  void initState() {
    _item = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _item.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.create_outlined,
                      size: 30.0,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.black,
                      size: 30.0,
                    )),
              ],
            ),
            const SizedBox(
              height: 150.0,
              width: double.infinity,
              child: Image(
                image: AssetImage('lib/image/motherandchild.jpg'),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: _item,
              decoration: const InputDecoration(
                hintText: 'Enter new item',
              ),
            )
          ],
        ),
      ),
    );
  }
}
