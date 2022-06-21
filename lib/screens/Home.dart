// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page Orchid'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 243, 33, 138),
      ),
      body: ListView(
        children: <Widget>[
          ImageSlideshow(
            /// Width of the [ImageSlideshow].
            width: double.infinity,

            /// Height of the [ImageSlideshow].
            height: 200,

            /// The page to show when first creating the [ImageSlideshow].
            initialPage: 0,

            /// The color to paint the indicator.
            indicatorColor: Colors.blue,

            /// The color to paint behind th indicator.
            indicatorBackgroundColor: Colors.grey,

            /// The widgets to display in the [ImageSlideshow].
            /// Add the sample image file into the images folder
            children: [
              Image.asset(
                'assets/asset1.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/asset2.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/asset3.jpg',
                fit: BoxFit.cover,
              ),
            ],

            /// Called whenever the page in the center of the viewport changes.
            // onPageChanged: (value) {
            //   print('Page changed: $value');
            // },

            /// Auto scroll interval.
            /// Do not auto scroll with null or 0.
            autoPlayInterval: 3000,

            /// Loops back to first slide.
            isLoop: true,
          ),
          // Logo
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/asset-logo.jpg',
                height: 80,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Wisata Orchid',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),

          // Container(
          //   margin: const EdgeInsets.all(10.0),
          //   height: 150.0,
          //   width: 200.0,
          //   decoration: BoxDecoration(color: Colors.amber),
          //   child: Text('Text'),
          // ),
          // Container(
          //   margin: const EdgeInsets.all(10.0),
          //   height: 150.0,
          //   width: 200.0,
          //   decoration: BoxDecoration(color: Colors.amber),
          //   child: Text('Text'),
          // ),

          // Container(
          //   margin: const EdgeInsets.all(10.0),
          //   height: 150.0,
          //   width: 200.0,
          //   decoration: BoxDecoration(color: Colors.amber),
          //   child: Image.asset(
          //     'assets/asset5.jpg',
          //     fit: BoxFit.cover,
          //   ),
          // ),

          Container(
            height: 300.0, //Ganti tinggi section
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 150.0, //Ganti Ukuran kotak
                  width: 300.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 77, 20, 40),
                        width: 8.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  child: Image.asset(
                    'assets/asset4.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 150.0, //Ganti Ukuran kotak
                  width: 300.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 77, 20, 40),
                        width: 8.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  child: Image.asset(
                    'assets/asset2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 150.0, //Ganti Ukuran kotak
                  width: 300.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 77, 20, 40),
                        width: 8.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  child: Image.asset(
                    'assets/asset3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

// Slide Bagian 2
          Container(
            height: 24,
            child: Stack(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Text(
                    "Jenis Tanaman Hias",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 200.0, //Ganti tinggi section
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 150, //Ganti Ukuran kotak
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 110, 29, 57),
                        width: 8.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: const Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/1038008/pexels-photo-1038008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1s'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 150, //Ganti Ukuran kotak
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 110, 29, 57),
                        width: 8.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: const Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/4671550/pexels-photo-4671550.jpeg?cs=srgb&dl=pexels-ekaterina-belinskaya-4671550.jpg&fm=jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 150, //Ganti Ukuran kotak
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 110, 29, 57),
                        width: 8.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: const Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/8149847/pexels-photo-8149847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 150, //Ganti Ukuran kotak
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 110, 29, 57),
                        width: 8.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: const Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/7477559/pexels-photo-7477559.jpeg?cs=srgb&dl=pexels-ti%E1%BB%83u-b%E1%BA%A3o-tr%C6%B0%C6%A1ng-7477559.jpg&fm=jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 150, //Ganti Ukuran kotak
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 110, 29, 57),
                        width: 8.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: const Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/6096074/pexels-photo-6096074.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

// Bagian text
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/asset-logo.jpg',
                height: 80,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Harga Tiket',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            'Harga Tiket Local',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {},
            child: const Text('Rp.-200.000 (tiket_Reguler)'),
          ),

          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {},
            child: const Text('Rp.-220.000 (tiket_Silver)'),
          ),

          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {},
            child: const Text('Rp.-250.000 (tiket_Gold)'),
          ),
        ],
      ),
    );
  }
}
