import 'package:delichi/cards/advertisement.dart';
import 'package:delichi/cards/cousine_type.dart';
import 'package:delichi/cards/restaurant_home.dart';
import 'package:delichi/widgets/appbar_home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';      // required to encode/decode json data
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> restaurantData = [];

  @override
  void initState() {
    super.initState();
    fetchRestaurantData().then((data) {
      setState(() {
        restaurantData = data;
      });
    }).catchError((error) {
      print('Error fetching restaurant data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const AppBarHome(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const AdvertisementList(),
              const Row(
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
              const SizedBox(height: 10),
              const CuisineTypeList(),
              const SizedBox(height: 20),
              const Row(
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
              RestaurantList(restaurantData: restaurantData),
              const Row(
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
              RestaurantList(restaurantData: restaurantData),
            ],
          ),
        ),
      ),
    );

  }
}
class RestaurantList extends StatelessWidget {
  final List<Map<String, dynamic>> restaurantData;

  const RestaurantList({super.key, required this.restaurantData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurantData.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> restaurant = restaurantData[index];
          return RestaurantHomeCard(
            name: restaurant['name'],
            cuisine: restaurant['cuisine'],
            rating: restaurant['rating'],
            imageUrl: restaurant['imageUrl'],
          );
        },
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

Future<List<Map<String, dynamic>>> fetchRestaurantData() async {
  final response = await http.get(Uri.parse('URL_DE_TU_API_AQUÍ'));
  if (response.statusCode == 200) {
    final List<Map<String, dynamic>> restaurantDataList =
    List<Map<String, dynamic>>.from(json.decode(response.body));
    return restaurantDataList;
  } else {
    throw Exception('Failed to load restaurant data');
  }
}
