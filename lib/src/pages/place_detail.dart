import 'package:flutter/material.dart';
import 'package:travel_app/src/models/place_response.dart';

import 'home_page.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _CustomAppBar(place: place),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _HeadTitles(
                  place: place,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CategoryButtons(),
                ),
                const SizedBox(height: 20),
                _DescriptionBox(place: place),
                const SizedBox(height: 60),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DescriptionBox extends StatelessWidget {
  const _DescriptionBox({
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            place.description,
            style: const TextStyle(
              color: Color.fromRGBO(57, 65, 75, 1),
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              // Función a ejecutar cuando se presiona el botón
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Color de fondo del botón
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), // Radio de las esquinas curveadas
              ),
              minimumSize:
                  const Size(double.infinity, 50), // Tamaño mínimo del botón
            ),
            child: const Text(
              'Reservar Ahora',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeadTitles extends StatelessWidget {
  const _HeadTitles({required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place.nombre,
            style: const TextStyle(
              fontSize: 36,
              color: Color.fromRGBO(10, 39, 83, 1),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.place_outlined,
                size: 20,
                color: Color.fromRGBO(235, 87, 87, 1),
              ),
              const SizedBox(width: 5),
              Text(
                place.ubicacion,
                style: const TextStyle(
                  color: Color.fromRGBO(106, 119, 139, 1),
                  fontSize: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      backgroundColor: Colors.red,
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(
              place.imagen,
            ),
          ),
        ),
      ),
    );
  }
}
