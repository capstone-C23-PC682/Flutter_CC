import 'package:flutter/material.dart';
import 'package:trascan/models/garbage.dart';
import 'package:trascan/models/profil/list_profil.dart';
import 'package:trascan/page/home/productdetail.dart';

import 'home.dart';

class Collectionproduct extends StatefulWidget {
  const Collectionproduct({super.key, required this.collector});
  final Dataprofil collector;

  @override
  State<Collectionproduct> createState() => _CollectionproductState();
}

class _CollectionproductState extends State<Collectionproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false);
            },
          ),
        ),
        body: GridView.builder(
          itemCount: productsam.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
          ),
          itemBuilder: (context, index) {
            final piece = productsam[index];
            final collect = widget.collector.collection.contains(piece.id);
            return GestureDetector(
              onTap: () {
                if (collect) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Detailgarbage(
                              keadaan: 1,
                              id: piece.id,
                            )),
                  );
                }
              },
              child: GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black38,
                  title: Text(piece.name),
                ),
                child: collect
                    ? Image.asset(piece.imagePath)
                    : Image.asset(
                        piece.imagePath,
                        color: Colors.grey.shade700,
                      ),
              ),
            );
          },
        ));
  }
}
