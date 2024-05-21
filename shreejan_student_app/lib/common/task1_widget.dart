
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {

  ListTileWidget(

      {required this.assetURL,

      required this.assetURL2,

      super.key,

      required this.index});

  int index;

  String assetURL;

  String assetURL2;

  @override

  Widget build(BuildContext context) {

    return ListTile(

      leading: Stack(

        alignment: Alignment.center,

        children: [

          CircleAvatar(

            radius: 50,

            backgroundImage: AssetImage(

              assetURL,

            ),

          ),

          Positioned(

            bottom: 0,

            right: 0,

            child: SizedBox(

              height: 30,

              width: 30,

              child: FloatingActionButton(

                onPressed: () {},

                backgroundColor: Colors.grey,

                child: const Icon(

                  Icons.add,

                  size: 20,

                ),

              ),

            ),

          ),

        ],

      ),

 

      // leading: CircleAvatar(

      //   backgroundImage: AssetImage(

      //     assetURL,

      //   ),

      // ),

      // leading: Image.asset(assetURL),

      title: const Text("Shreejan Manandhar"),

      subtitle: const Text("2h ago"),

      // trailing: const Icon(Icons.delete),

      trailing: Wrap(

        spacing: 8,

        children: [

          Image.asset(

            assetURL2,

            width: 60,

          ),

        ],

      ),

 

      onTap: () {},

    );

  }

}