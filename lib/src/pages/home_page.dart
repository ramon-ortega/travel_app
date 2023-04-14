import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Actualiza el estado de la aplicación
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Actualiza el estado de la aplicación
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          'pais.nombre',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://image.api.playstation.com/vulcan/img/rnd/202010/2621/H9v5o8vP6RKkQtR77LIGrGDE.png'),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _HeadTitles(),
          ],
        ),
      ),
    );
  }
}

class _HeadTitles extends StatelessWidget {
  const _HeadTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi Jhon,',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          'Where do you wanna go?',
          style: TextStyle(
            color: Color.fromRGBO(10, 39, 83, 1),
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
