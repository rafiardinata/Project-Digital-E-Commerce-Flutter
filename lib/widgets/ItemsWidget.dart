// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, unnecessary_string_interpolations, unused_import

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ItemsWidget extends StatefulWidget {
  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  bool isGridView =
      true; // State untuk mengontrol tampilan antara grid view dan list view

  final List<String> listName = [
    // Daftar nama
    "",
    "Women's Heels",
    "Women's Watch",
    "Backpack",
    "Foldable Bag",
    "Foldable Bag",
    "Women Heels",
    "Smartwatch",
  ];

  final List<String> listDiscount = [
    // Daftar diskon
    "",
    "-50%",
    "",
    "-15%",
    "-25%",
    "-30%",
    "-20%",
    "-10%",
  ];

  final List<String> listDeskripsi = [
    // Daftar deskripsi
    "",
    "Desainnya yang menarik...",
    "Sangat cocok untuk dipakai...",
    "Bahan yang nyaman sangat...",
    "Material halus, lebih awet...",
    "Tas petualangan Sherina ini...",
    "Bahan Poly Taslan yang lembut...",
    "Jenis bahan ini juga tahan lama...",
  ];

  final List<String> listHarga = [
    // Daftar harga
    "",
    "IDR 170.000",
    "IDR 250.000",
    "IDR 150.000",
    "IDR 350.000",
    "IDR 225.000",
    "IDR 200.000",
    "IDR 140.000",
  ];

  final List<String> listRating = [
    "4.5",
    "3.8",
    "4.2",
    "4.7",
    "4.0",
    "4.2",
    "3.9",
    "4.5",
    "4.5",
  ];

  final List<String> listSales = [
    "238",
    "115",
    "320",
    "157",
    "82",
    "184",
    "201",
    "95",
    "250",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tombol ikon untuk beralih antara Grid View dan List View
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                "Best Selling",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004D40),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isGridView = true;
                });
              },
              icon: Icon(Icons.grid_view),
              color: isGridView ? Color(0xFF004D40) : Colors.grey,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isGridView = false;
                });
              },
              icon: Icon(Icons.list),
              color: isGridView ? Colors.grey : Color(0xFF004D40),
            ),
          ],
        ),
        //SizedBox(height: 5), // Spasi antara tombol dan daftar item
        // Daftar item dalam Grid View atau List View sesuai dengan isGridView
        isGridView ? buildGridView() : buildListView(),
      ],
    );
  }

  // Fungsi untuk membuat tampilan Grid View
  Widget buildGridView() {
    return GridView.count(
      childAspectRatio: 0.61,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 8; i++) buildItem(i),
      ],
    );
  }

  // Fungsi untuk membuat tampilan List View
  Widget buildListView() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 8; i++) buildItem(i),
      ],
    );
  }

  // Fungsi untuk membuat item individual
  Widget buildItem(int i) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (listDiscount[i] != "")
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF004D40),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "${listDiscount[i]}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Icon(
                Icons.favorite_border,
                color: Colors.red,
              )
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "itemPage");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/$i.png",
                height: 120,
                width: 120,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              "${listName[i]}",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF004D40),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "${listDeskripsi[i]}",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF004D40),
              ),
            ),
          ),
          if (listDiscount[i] != "")
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    calculateDiscountedPrice(
                      listHarga[i],
                      listDiscount[i],
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004D40),
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart_checkout,
                    color: Color(0xFF004D40),
                  ),
                ],
              ),
            ),
          if (listDiscount[i] ==
              "") // Tampilkan harga asli tanpa garis pemotongan jika tidak ada diskon
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    listHarga[i],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004D40),
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart_checkout,
                    color: Color(0xFF004D40),
                  ),
                ],
              ),
            ),
          if (listDiscount[i] !=
              "") // Tampilkan harga asli tanpa garis pemotongan jika tidak ada diskon
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    listHarga[i],
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF004D40),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Text(
                  listRating[i],
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF004D40),
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.star,
                  size: 13,
                  color: Color(0xFF004D40),
                ),
                SizedBox(width: 5),
                Text(
                  "|",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004D40),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "${listSales[i]} Terjual",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF004D40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to calculate discounted price
  String calculateDiscountedPrice(String originalPrice, String discount) {
    final originalPriceValue =
        double.parse(originalPrice.split(' ')[1].replaceAll(',', ''));
    final discountValue =
        double.parse(discount.replaceAll(RegExp(r'[^\d.]'), '')) / 100;
    final discountedPriceValue =
        originalPriceValue - (originalPriceValue * discountValue);
    return 'IDR ${discountedPriceValue.toStringAsFixed(3)}';
  }
}
