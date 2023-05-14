

import 'package:news_app/src/ui/pages.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AnimatedList(
        initialItemCount: 10,
        itemBuilder: (context, index, animation) {
          return ListTile(
            onFocusChange: (value) => print("value:$value"),
            onTap: () => print("clicked"),
            selectedTileColor: Colors.amber,
            title: Text("$index"),
          );
        },
      ),
    );
  }
}