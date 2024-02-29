import 'package:delichi/cards/advertisement.dart';
import 'package:delichi/cards/cousine_type.dart';
import 'package:delichi/cards/restaurant_home.dart';
import 'package:delichi/widgets/appbar_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: AppBarHome(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              AdvertisementList(),
              Row(
                children: [
                  SizedBox(width: 30,),
                  Text(
                    'Elige el tipo de cocina',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CuisineTypeList(),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Icon(Icons.stars, color: Colors.orange, size: 18,),
                  SizedBox(width: 5,),
                  Text(
                    'Populares en Tuxtla Gutierrez',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              RestaurantList(),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Icon(Icons.add_circle, color: Colors.orange, size: 18,),
                  SizedBox(width: 5,),
                  Text(
                    'Nuevos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              RestaurantList(),
            ],
          ),
        ),
      )
    );
  }
}
class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          RestaurantHomeCard(
            name: 'El rábano',
            cuisine: 'Tacos',
            rating: 4.5,
            imageUrl: 'https://lbeautehomme.mx/wp-content/uploads/2023/08/SARDE-1-1536x1024.jpg',
          ),
          RestaurantHomeCard(
            name: 'Las brisas',
            cuisine: 'Chilaquiles',
            rating: 4.0,
            imageUrl: 'https://lbeautehomme.mx/wp-content/uploads/2023/08/SARDE-1-1536x1024.jpg',
          ),
          RestaurantHomeCard(
            name: 'Las brisas',
            cuisine: 'Pizza',
            rating: 4.8,
            imageUrl: 'https://lbeautehomme.mx/wp-content/uploads/2023/08/SARDE-1-1536x1024.jpg',
          ),

        ],
      ),
    );
  }
}

class AdvertisementList extends StatelessWidget {
  const AdvertisementList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 380,
      child: ListView(
        scrollDirection: Axis.horizontal, // Desplazamiento horizontal
        children: const [
          AdvertisementCard(imageUrl: 'https://www.menuspararestaurantes.com/wp-content/uploads/2022/12/promociones-en-tu-restaurante-combos2-696x390.jpg'),
          AdvertisementCard(imageUrl: 'https://www.menuspararestaurantes.com/wp-content/uploads/2022/12/promociones-en-tu-restaurante-combos2-696x390.jpg'),
          AdvertisementCard(imageUrl: 'https://www.menuspararestaurantes.com/wp-content/uploads/2022/12/promociones-en-tu-restaurante-combos2-696x390.jpg'),
        ],
      ),
    );
  }
}

class CuisineTypeList extends StatelessWidget {
  const CuisineTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CuisineTypeCard(label: 'Mexicana', imageUrl: 'https://cdn2.cocinadelirante.com/1020x600/filters:format(webp):quality(75)/sites/default/files/images/2021/07/5-menus-de-comida-mexicana-para-cocinar-en-el-extranjero.jpg',),
          CuisineTypeCard(label: 'Mexicana', imageUrl: 'https://cdn2.cocinadelirante.com/1020x600/filters:format(webp):quality(75)/sites/default/files/images/2021/07/5-menus-de-comida-mexicana-para-cocinar-en-el-extranjero.jpg',),
          CuisineTypeCard(label: 'Mexicana', imageUrl: 'https://cdn2.cocinadelirante.com/1020x600/filters:format(webp):quality(75)/sites/default/files/images/2021/07/5-menus-de-comida-mexicana-para-cocinar-en-el-extranjero.jpg',),
          CuisineTypeCard(label: 'Mexicana', imageUrl: 'https://cdn2.cocinadelirante.com/1020x600/filters:format(webp):quality(75)/sites/default/files/images/2021/07/5-menus-de-comida-mexicana-para-cocinar-en-el-extranjero.jpg',),
          CuisineTypeCard(label: 'Mexicana', imageUrl: 'https://cdn2.cocinadelirante.com/1020x600/filters:format(webp):quality(75)/sites/default/files/images/2021/07/5-menus-de-comida-mexicana-para-cocinar-en-el-extranjero.jpg',),

        ],
      ),
    );
  }
}