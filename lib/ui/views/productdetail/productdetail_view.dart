import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.grey,
            title: Text(product['title'] ?? 'Product Detail')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product['title'] ?? 'No title available',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Price: \$${product['price']?.toString() ?? 'N/A'}"),
              SizedBox(height: 10),
              Text("Description: ${product['description'] ?? 'No description available'}"),
            ],
          ),
        ),
      ),
    );
  }
}
