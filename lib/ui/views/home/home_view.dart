import 'package:flutter/material.dart';
import 'package:machietaskcodexes/ui/views/productdetail/productdetail_view.dart';
import 'package:machietaskcodexes/ui/views/profile/profile_view.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (model) {
        model.fetchProductsAndCategories();
      },
      viewModelBuilder: () {
        return HomeViewModel();
      },
      builder: (BuildContext context, HomeViewModel viewModel, Widget? child) {
        return SafeArea(
          child: Scaffold(
            appBar:  AppBar(
          
              backgroundColor: Colors.grey,
              leading: GestureDetector(
                onTap: () {
                  // Navigate to ProfileView when the avatar is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileView()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/asset.png'), // Avatar image
                  ),
                ),
              ),            // Set the app bar color to grey
              title: Center(child: const Text('Homepage',style: TextStyle(fontWeight: FontWeight.bold,),)),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  color: Colors.black, // White color for action icon
                  onPressed: () {
                    // Add functionality for notifications
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.black, // White color for action icon
                  onPressed: () {
                    // Add functionality for cart
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Categories"),
                  ),
                ),
                Container(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.categories.length,
                      itemBuilder: (context, index) {
                        final category = viewModel.categories[index];
                        return Container(
                          color: Colors.black12,
                          height: 100,
                          width: 100,
                          child: Center(child: Text(category['Cat_name'])),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Top Products"),
                  ),
                ),
                Expanded(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 230,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: viewModel.products.length,
                        itemBuilder: (context, index) {
                          final product = viewModel.products[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>ProductDetailScreen(product: product),
                                  ),
                                );
                              },
                          child:  Card(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(product['part_image'],
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      product['description'] ?? "No Description",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text("Price: ₹${product['price']}",
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                      "Rating: ${product['product_rating']}",
                                      style: TextStyle(color: Colors.grey)),
                                ),
                              ],
                            ),
                          ),
                          );
                        }))
              ],
            ),
          ),
        );
      },
    );
  }
}
