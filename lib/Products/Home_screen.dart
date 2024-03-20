import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Products/Cart_Details.dart';
import 'package:untitled2/Products/Product_Details.dart';
import 'package:untitled2/Products/Product_card.dart';

import '../Views/Drawer.dart';
import 'Product_Model.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,

      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Text("Home"),
            SizedBox(
              height: 40,
              width: 80,
              child: Image.asset('Assets/Images/app_logo.jpeg'),
            ),
          ],
        ),
        leading: InkWell(
          onTap: () {
            Scaffoldkey.currentState?.openDrawer();
          },
          child: Icon(Icons.menu),
        ),
        actions: [
          IconButton(onPressed: (){
            Get.to(()=> Cart_products());
          },icon:Icon(Icons.shopping_cart),),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  _buildProductCategory(index: 0, name: "All Services"),
                  _buildProductCategory(index: 1, name: 'Mechanic'),
                      _buildProductCategory(index: 3, name: 'Painter'),
                  _buildProductCategory(index: 2, name: 'Carpenter'),

                ]
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(child: selectedIndex == 0
                  ? _buildProduct()
                  : selectedIndex == 1
                  ?  _buildMechanic():
              _buildPainter()
              ),
              SizedBox(height: 12),
            ],
          ),

        ),
      ),
    );
  }



  Widget _buildProductCategory(
      {required int index, required String name}) =>
      GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selectedIndex == index ? Colors.red : Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),

  );
  }


_buildProduct() => GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100 / 130),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
  ),
  shrinkWrap: true,
  itemCount: MyProducts.allProducts.length,
  itemBuilder: (context, index) {
    final product = MyProducts.allProducts[index];
    return GestureDetector(
        onTap: ()=>{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(product: product)))
        },
        child: ProductsCardsDesign(product: product));
  },
);



_buildMechanic() => GridView.builder(
    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/130),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.Mechanic.length,
    shrinkWrap: true,
    itemBuilder:(context,index){
      final product = MyProducts.Mechanic[index];
      return GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:
            (context)=> Details(product: product))),
        child: ProductsCardsDesign(product: product),
      );

    }
);


_buildPainter() => GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/130),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: MyProducts.Painter.length,
    itemBuilder: (context, index){
      final product = MyProducts.Painter[index];
      return GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:
            (context)=> Details(product: product))),
        child: ProductsCardsDesign(product: product),
      );
    }
    );
