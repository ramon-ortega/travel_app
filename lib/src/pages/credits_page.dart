import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _CreditsSection(),
            _ContactSection(),
          ],
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contacto',
            style: TextStyle(
              color: Color.fromRGBO(10, 39, 83, 1),
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const ListTile(
            leading: Icon(
              FontAwesomeIcons.linkedin,
              color: Colors.black,
            ),
            title: Text(
              'linkedin.com/in/ramon-ortega',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.alternate_email_rounded,
              color: Colors.black,
            ),
            title: Text(
              'ramortega1594@gmail.com',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              FontAwesomeIcons.github,
              color: Colors.black,
            ),
            title: Text(
              'github.com/ramon-ortega',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(double.infinity, 50),
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

class _CreditsSection extends StatelessWidget {
  const _CreditsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Créditos',
            style: TextStyle(
              color: Color.fromRGBO(10, 39, 83, 1),
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Ramón de Jesús Ortega Guzmán',
                  style: TextStyle(
                      color: Color.fromRGBO(10, 39, 83, 1), fontSize: 16),
                ),
                SizedBox(height: 10),
                ClipOval(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        'https://media.licdn.com/dms/image/C5603AQGHp2cqrY0MYw/profile-displayphoto-shrink_800_800/0/1630607826523?e=1687392000&v=beta&t=1HAHh1RfW0pCwJclKRL3QyJlgy98FjtSK9jheISXwoI'),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Desarrollador web full stack apasionado por el desarrollo de aplicaciones multiplataforma con Flutter. Mi experiencia en el desarrollo de aplicaciones móviles me ha permitido obtener una comprensión sólida de las mejores prácticas de programación, así como una capacidad demostrada para diseñar e implementar soluciones innovadoras para problemas complejos.',
                    style: TextStyle(
                      color: Color.fromRGBO(
                        57,
                        65,
                        75,
                        1,
                      ),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
