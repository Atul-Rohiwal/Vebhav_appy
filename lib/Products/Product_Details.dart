import 'package:flutter/material.dart';
import 'package:untitled2/Common/Bold_Text.dart';
import 'package:untitled2/Common/Plain_text.dart';
import 'package:untitled2/Products/Product_Model.dart';
class Details extends StatelessWidget {
  final Product product;
  const Details({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(product.image,fit: BoxFit.fill,)),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${product.name.toUpperCase()}",style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,fontSize: 26),),
                      Text("\$ ${product.price}",style: TextStyle(
                          fontSize: 22,fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  Text(
                    '${product.description}',textAlign: TextAlign.justify
                    ,style: TextStyle(
                      fontSize: 14
                  ),
                  ),
                   PlainText(name: "Phone.No: 1234567890", fontsize: 24),
                  PlainText(name: "Haryana,India", fontsize:24)
                ],
              )
            )
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ ${product.price}',style: TextStyle(
                color: Colors.white,fontSize: 22
              ),),
              ElevatedButton.icon(onPressed: (){},
              label: Text("Add to Cart",),
                icon: Icon(Icons.send),
              )
            ],
          ),
        ),
      ),
    );
  }
}
