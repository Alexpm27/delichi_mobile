import 'package:delichi/cards/restaurant_search.dart';
import 'package:flutter/material.dart';

class RestaurantSearchPage extends StatefulWidget {
  const RestaurantSearchPage({super.key});

  @override
  State<RestaurantSearchPage> createState() => _RestaurantSearchPageState();
}

class _RestaurantSearchPageState extends State<RestaurantSearchPage> {
  String? _orderBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 100, // Ancho del TextFormField
              height: 45,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Buscar restaurantes...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 30),
                  _buildFilterDropdownButton(
                    'Cocina',
                    ['Cocina 1', 'Cocina 2'], // Opciones de tipo de cocina
                  ),
                  const SizedBox(width: 10),
                  _buildFilterDropdownButton(
                    'Servicios',
                    ['Servicio 1', 'Servicio 2'], // Opciones de servicios
                  ),
                  const SizedBox(width: 120),
                  GestureDetector(
                    onTap: _showOrderByOptions,
                    child: const Icon(Icons.sort, color: Colors.orange,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Reemplaza con el número real de restaurantes
                itemBuilder: (context, index) {
                  return const RestaurantCard(
                    name: 'Las Brisas',
                    image: 'https://i0.wp.com/foodandpleasure.com/wp-content/uploads/2020/08/el-lago.jpg?resize=768%2C768&ssl=1', // URL de la imagen del restaurante
                    rating: 4.5, // Calificación del restaurante
                    reviews: 100, // Número de reseñas del restaurante
                    location: 'Coita/San Antonio',
                    cuisine: 'Tacos',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdownButton(
      String label,
      List<String> options,
      ) {
    return DropdownButton<String>(
      hint: Text(label),
      value: null,
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: (String? value) {
        // Manejar la selección aquí
      },
    );
  }

  void _showOrderByOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              title: const Text('Ascendente'),
              onTap: () {
                setState(() {
                  _orderBy = 'Ascendente';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Descendente'),
              onTap: () {
                setState(() {
                  _orderBy = 'Descendente';
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}



