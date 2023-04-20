import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/src/models/place_response.dart';
import 'package:travel_app/src/pages/cubit/category_bloc.dart';
import 'package:travel_app/src/pages/place_detail.dart';
import 'package:travel_app/src/services/places_service.dart';
import 'package:travel_app/src/widgets/custom_category_button.dart';
import 'package:travel_app/src/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.place_outlined,
              size: 20,
              color: Color.fromRGBO(235, 87, 87, 1),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Zacatecas, México',
              style: TextStyle(
                color: Color.fromRGBO(106, 119, 139, 1),
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5.0,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  maxRadius: 16,
                  backgroundImage: NetworkImage(
                      'https://image.api.playstation.com/vulcan/img/rnd/202010/2621/H9v5o8vP6RKkQtR77LIGrGDE.png'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _HeadTitles(),
              SizedBox(height: 10),
              _CustomCarousel(),
              SizedBox(height: 20),
              CategoryButtons(),
              SizedBox(height: 20),
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
    List<Place>? list = [];
    return BlocBuilder<CategoryCubit, int>(builder: (context, index) {
      return FutureBuilder<List<Place>>(
          future: PlacesService.readFileJson(),
          builder: (context, snapshot) {
            if (index == 0) {
              list = snapshot.data?.where((element) {
                return element.categoria == "popular";
              }).toList();
            } else if (index == 1) {
              list = snapshot.data?.where((element) {
                return element.categoria == "colonial";
              }).toList();
            } else if (index == 2) {
              list = snapshot.data?.where((element) {
                return element.categoria == "playa";
              }).toList();
            } else if (index == 3) {
              list = snapshot.data?.where((element) {
                return element.categoria == "bosque";
              }).toList();
            }

            return SizedBox(
              height: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return PlaceDetail(
                              place: list![index],
                            );
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
                              Stack(
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
                                          list![index].imagen,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
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
                                          list![index].nombre,
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
                                              list![index].ubicacion,
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
                                        Text("${list![index].calificacion}"),
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
    });
  }
}

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, int>(
      builder: (context, index) {
        return SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CustomCategoryButton(
                icon: Icons.star_border,
                title: 'Popular',
                isSelected: index == 0,
                onPressed: (value) {
                  context.read<CategoryCubit>().selectCategoryIndex(0);
                },
              ),
              CustomCategoryButton(
                icon: Icons.church_outlined,
                title: 'Colonial',
                isSelected: index == 1,
                onPressed: (value) {
                  context.read<CategoryCubit>().selectCategoryIndex(1);
                },
              ),
              CustomCategoryButton(
                icon: Icons.beach_access_outlined,
                title: 'Playa',
                isSelected: index == 2,
                onPressed: (value) {
                  context.read<CategoryCubit>().selectCategoryIndex(2);
                },
              ),
              CustomCategoryButton(
                icon: Icons.hiking_outlined,
                title: 'Bosque',
                isSelected: index == 3,
                onPressed: (value) {
                  context.read<CategoryCubit>().selectCategoryIndex(3);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomCarousel extends StatelessWidget {
  const _CustomCarousel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PlacesService.readFileJson(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return CarouselSlider(
            items: snapshot.data!.map((e) {
              return Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PlaceDetail(place: e);
                        },
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                        tag: e.nombre,
                        child: Image.asset(
                          e.imagen,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
            options: CarouselOptions(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}

class _HeadTitles extends StatelessWidget {
  const _HeadTitles();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hola Jesús,',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: const Text(
            '¿A donde quieres ir?',
            style: TextStyle(
              color: Color.fromRGBO(10, 39, 83, 1),
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
