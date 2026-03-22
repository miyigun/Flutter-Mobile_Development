import 'package:drawer_example_2/views/favourites_page.dart';
import 'package:drawer_example_2/views/home_page.dart';
import 'package:drawer_example_2/views/user_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              builderHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget builderHeader(BuildContext context) {
    return Material(
      color: Colors.blue.shade700,
      child: InkWell(
        onTap: () {
          //Close navigation drawer before
          Navigator.pop(context);

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const UserPage(),
          ));
        },
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: const Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage(
                  "assets/images/tang_san.jpg",
                ),
              ),
              Text(
                'Tang San',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              Text(
                'tangsan@abf.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(runSpacing: 16, children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border),
          title: const Text('Favourites'),
          onTap: () {
            //Close navigation drawer before
            Navigator.pop(context);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FavouritesPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.workspaces_outline),
          title: const Text('Workflow'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.update),
          title: const Text('Updates'),
          onTap: () {},
        ),
        const Divider(color: Colors.black54),
        ListTile(
          leading: const Icon(Icons.account_tree_outlined),
          title: const Text('Plugins'),
          onTap: () {},
        ),
      ]),
    );
  }
}
