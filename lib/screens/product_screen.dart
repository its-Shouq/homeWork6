


import 'package:flutter/material.dart';
import 'package:homework6/service/api.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of products"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: Api().getProduct(), //********** */
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child:CircularProgressIndicator (color: const Color.fromARGB(255, 178, 157, 157))
              );
            }
            return GridView.builder(
              itemCount: snapshot.data?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: const Color.fromARGB(255, 146, 108, 121),
                  child: Column(
                    children: [
                      Image.network(snapshot.data![index].thumbnail ?? ""),
                      Text(snapshot.data![index].title!),
                      Text(snapshot.data![index].price.toString()),

                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}