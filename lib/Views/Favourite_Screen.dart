import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Common/Bold_Text.dart';
import 'package:untitled2/Products/Product_Model.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({super.key});

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar:AppBar(iconTheme: null,
        elevation: 0.0,
        title: null,
        actions: null,
        leading:null,
        backgroundColor: Colors.grey.shade300,
      ),
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldText(name: "Search here...", fontsize: 25,color: Colors.blueGrey,),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _searchController,
              onChanged: onSearchTextChanged,
              decoration: InputDecoration(
                fillColor: Colors.blueGrey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search',
                suffixIcon: Icon(Icons.search,color: Colors.black,)
              ),
              onTap: () {
                _searchController.clear();
                onSearchTextChanged('');
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  Product product = _searchResults[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('Price: \$${product.price}'),
                    // Add other product details or customize as needed
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
  void onSearchTextChanged(String searchText) {
    _searchResults.clear();
    if (searchText.isEmpty) {
      setState(() {});
      return;
    }

    // Filter products based on name or price
    for (Product product in MyProducts.allProducts) {
      if (product.name.toLowerCase().contains(searchText.toLowerCase()) ||
          product.price.toString().contains(searchText)) {
        _searchResults.add(product);
      }
    }

    setState(() {});
  }
}
