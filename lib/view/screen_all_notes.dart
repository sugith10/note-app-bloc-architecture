import 'package:flutter/material.dart';
import 'package:new_note/view/note_item.dart';

class AllNotesScrn extends StatelessWidget {
  const AllNotesScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Notes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(8),
        children: List.generate(
            10,
            (index) => NoteItem(
                id: index.toString(),
                title: 'Lorem Ipsum Title $index',
                content:
                    'Lorem Ipsum is simply dummy text of ajfjsdjwoefdksajlajjsdjajsdjajjdjasjfajldjjajdlajfdjajsdhhedwhnnvedhfiwhfbddvahedfhhvhjsje')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
