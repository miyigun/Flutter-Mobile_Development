import 'package:flutter/material.dart';

// Create a List of Menu Item for PopupMenuButton
List<TodoMenuItem> foodMenuList = [
  TodoMenuItem(title: 'Fast Food', icon: const Icon(Icons.fastfood)),
  TodoMenuItem(title: 'Remind Me', icon: const Icon(Icons.add_alarm)),
  TodoMenuItem(title: 'Flight', icon: const Icon(Icons.flight)),
  TodoMenuItem(title: 'Music', icon: const Icon(Icons.audiotrack)),
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: (){},
          ),
        ],
        flexibleSpace: const SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.white70,
          ),
        ),
        bottom:
          const PopupMenuButtonWidget(),
        /*PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
              child: const Center(
                child:Text('Bottom'),
              ),
          ),
        ),*/
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                ContainerWithBoxDecorationWidget(),
                Divider(),
                ColumnWidget(),
                Divider(),
                RowWidget(),
                Divider(),
                ColumnAndRowNestingWidget(),
                Divider(),
                ButtonsWidget(),
                Divider(),
                ButtonBarWidget(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.lightGreen.shade100,
        child: const Icon(Icons.play_arrow),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(padding: EdgeInsets.all(32.0))
          ],
        ),
        
      ),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16.0)),
            TextButton(
              onPressed: (){},
              child: const Text("Flag"),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.flag,color: Colors.lightGreen),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16.0)),
            TextButton(
                onPressed: (){},
                child: const Text("Save"),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.save,color: Colors.lightGreen),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16.0)),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.flight),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            IconButton(
              icon: const Icon(Icons.flight),
              iconSize: 42.0,
              color: Colors.lightGreen,
              tooltip: "Flight",
              onPressed: (){},
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.map)
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.airport_shuttle)
          ),
          IconButton(
              onPressed: (){},
              highlightColor: Colors.purple,
              icon: const Icon(Icons.brush)
          ),
        ],
      ),
    );
  }
}


class TodoMenuItem {
  final String title;
  final Icon icon;
  TodoMenuItem({required this.title, required this.icon});
}

class PopupMenuButtonWidget extends StatelessWidget implements PreferredSizeWidget {
  const PopupMenuButtonWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen.shade100,
      height: preferredSize.height,
      width: double.infinity,
      child: Center(
        child: PopupMenuButton<TodoMenuItem>(
          icon: const Icon(Icons.view_list),
          onSelected: ((valueSelected) {
          }),
          itemBuilder: (BuildContext context) {
            return foodMenuList.map((TodoMenuItem todoMenuItem) {
              return PopupMenuItem<TodoMenuItem>(
                value: todoMenuItem,
                child: Row(
                  children: <Widget>[
                    Icon(todoMenuItem.icon.icon),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    Text(todoMenuItem.title),
                  ],
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
  @override
// implement preferredSize
  Size get preferredSize => const Size.fromHeight(75.0);
}

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(10.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.lightGreen.shade500,
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10.0,
                  offset: Offset(0.0,10.0),
                ),
              ],
            ),
          child: Center(
            child: RichText(
              text: const TextSpan(
                text: 'Flutter World',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.deepPurple,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepPurpleAccent,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan> [
                  TextSpan(
                    text: ' for ',
                  ),
                  TextSpan(
                    text: 'Mobile',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget ({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: const <Widget>[
        Text('Column 1'),
        Divider(),
        Text('Column 2'),
        Divider(),
        Text('Column 3'),
      ],
    );
  }
  
  
}

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: const <Widget>[
        Text("Row 1"),
        Padding(padding: EdgeInsets.all(16.0)),
        Text("Row 2"),
        Padding(padding: EdgeInsets.all(16.0)),
        Text("Row 3"),
      ],
    );
  }
}

class ColumnAndRowNestingWidget extends StatelessWidget {
  const ColumnAndRowNestingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const Text("Columns and Row Nesting 1",),
        const Text("Columns and Row Nesting 2",),
        const Text("Columns and Row Nesting 3",),
        const Padding(padding: EdgeInsets.all(16.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text("Row Nesting 1"),
            Text("Row Nesting 2"),
            Text("Row Nesting 3"),
          ],
        ),
      ],
    );
  }
}

