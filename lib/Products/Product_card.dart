import 'package:flutter/material.dart';
import 'package:untitled2/Products/Product_Model.dart';
import 'package:untitled2/Providers/Favourite_provider.dart';
class ProductsCardsDesign extends StatefulWidget {
  final Product product;
  const  ProductsCardsDesign({Key? key, required this.product});

  @override
  State<ProductsCardsDesign> createState() => _ProductsCardsDesignState();
}

class _ProductsCardsDesignState extends State<ProductsCardsDesign> {
  @override
  Widget build(BuildContext context) {
    final provider =  FavoriteProvider.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width:  130,
            child: Image.asset(widget.product.image,fit: BoxFit.fill,),
          ),
          Text(
            widget.product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text('${widget.product.category}',style:TextStyle(color: Colors.red),),
          Text(
            ' \$${widget.product.price}.00',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

             Align(
               alignment: Alignment.bottomRight,
               child: GestureDetector(
                 onTap: () => provider.toggleFavorite(widget.product),
                 child: Icon(
                   provider.isExist(widget.product) ? Icons.favorite : Icons.favorite_outline,color: Colors.red,
                 )
               ),
             ),
           ],
         ),
      );
  }
}
