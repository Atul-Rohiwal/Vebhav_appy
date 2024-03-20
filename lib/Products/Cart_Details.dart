import 'package:flutter/material.dart';
import 'package:untitled2/Common/Bold_Text.dart';
import 'package:untitled2/Providers/Favourite_provider.dart';

class Cart_products extends StatefulWidget {
  const Cart_products({super.key});

  @override
  State<Cart_products> createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.red,
        title: Text("Cart"),
        leading: Icon(Icons.shopping_cart),
      ),
      body: Column(
        children: [
          BoldText(name: 'Favorites', fontsize: 25),
          Expanded(child: ListView.builder(
            itemCount: finalList.length,
              itemBuilder: (context, index){
              return Padding(padding: EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                  title: Text(finalList[index].name),
                subtitle: Text(finalList[index].description,textAlign: TextAlign.justify,),
                leading: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset(finalList[index].image,fit: BoxFit.fill,),
                  ),
                ),
                trailing: Text('${finalList[index].price}'),

              )
              );
              })
          )
        ],
      ),
    );
  }
}
