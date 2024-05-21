import 'package:flutter/material.dart';
import 'package:student_app/common/task1_widget.dart';

class Task1Screen extends StatelessWidget {
  const Task1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.compare_arrows_sharp,
                color: Colors.red,
              ),
              Text(
                "Discover",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        body: Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTileWidget(
                  index: 1,
                  assetURL: 'assets/images/img1.jpg',
                  assetURL2: 'assets/images/img2.jpg',
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 20),
        )

        // body: SingleChildScrollView(

        //   child: Column(

        //     children: [

        //       for (int i = 0; i <= 100; i++) ...{

        //         ListTileWidget(

        //           index: i,

        //           assetURL: 'assets/images/image_1.jpeg',

        //           assetURL2: 'assets/images/image_2.png',

        //         ),

        //         const Divider(),

        //       },

        //     ],

        //   ),

        // ),

        );

    // body: ListTileWidget(assetURL: "assets/images/image_1.jpeg"));
  }
}
