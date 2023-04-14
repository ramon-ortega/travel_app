import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app/src/models/place_response.dart';
import 'package:travel_app/src/pages/place_detail.dart';
import 'package:travel_app/src/services/places_service.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _HeadTitles(),
              _CustomCarousel(),
              _CategoryButtons(),
              _PlacesSlider()
            ],
          ),
        ),
      ),
    );
  }
}

class _PlacesSlider extends StatelessWidget {
  const _PlacesSlider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Place>>(
        future: PlacesService.readFileJson(),
        builder: (context, snapshot) {
          return SizedBox(
            height: 230,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const PlaceDetail();
                        }),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 8,
                                    offset: const Offset(0, 5),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  height: 140,
                                  width: 240,
                                  child: Image.asset(
                                    snapshot.data![index].imagen,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 240,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].nombre,
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(10, 39, 83, 1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.place_outlined,
                                            size: 12,
                                            color: Colors.red,
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            snapshot.data![index].ubicacion,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: Colors.amber[900],
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('4.8'),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}

class _CategoryButtons extends StatelessWidget {
  const _CategoryButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Text('Hola'),
          Text('Lake'),
          Text('Beach'),
          Text('Mountains'),
        ],
      ),
    );
  }
}

class _CustomCarousel extends StatelessWidget {
  const _CustomCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final items = [1, 2, 3, 4, 5];
    return CarouselSlider(
      items: items.map((e) {
        return Builder(builder: (context) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 6.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.network(
              'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          );
        });
      }).toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
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
