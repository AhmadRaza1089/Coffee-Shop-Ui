import 'package:flutter/material.dart';
import 'package:flutter_app/pages/coffeetypes.dart';
import 'package:flutter_app/pages/utill/coffee_tiles.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types, selected
  final List coffeeTypes = [
    ["Cappuccino", true],
    ["Latte", false],
    ["Black", false]
  ];

  // coffee type selected
  void coffeeTypeSelected(int index) {
    setState(() {
      for (var i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 60),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find your coffee..",
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // Coffee types list
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTypes.length,
              itemBuilder: (context, index) {
                return Coffeetypes(
                  coffeeTypes: coffeeTypes[index][0],
                  isSelected: coffeeTypes[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),
          // Coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:  const [
                CoffeeTiles(
                  coffeeImagePath: "assets/images/cappuccino.jpg",
                  coffeeName: "Cappuccino",
                  coffeePrice: "4",
                ),
                CoffeeTiles(
                  coffeeImagePath: "assets/images/latte.jpg",
                  coffeeName: "Latte",
                  coffeePrice: "4.20",
                ),
                CoffeeTiles(
                  coffeeImagePath: "assets/images/milk.jpg",
                  coffeeName: "Black",
                  coffeePrice: "5",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
