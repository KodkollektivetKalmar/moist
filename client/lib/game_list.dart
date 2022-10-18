// ignore_for_file: prefer_const_constructors

import 'package:client/main.dart';
import 'package:flutter/material.dart';


class GameList extends StatelessWidget {
  const GameList({super.key});


	@override
	 Widget build(BuildContext context) {
		List<int> dummy = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];

		return MaterialApp( 

			title:'Game list', 
			home: Scaffold( 
				appBar: AppBar(
					title: const Text('Display games'),
				),
				body: GridView(
					scrollDirection: Axis.vertical,
					reverse: false,
					controller: ScrollController(),
					physics: ScrollPhysics(), 
					padding: EdgeInsets.all(10.0),
					gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
						crossAxisCount: 4,
						crossAxisSpacing: 48,
						mainAxisSpacing: 48,
						),

					// Creating items for the gridView form the dummylist, here we need to fetch
					// the games from the database, when that is created //
					children: dummy.map((e) => Container(
						height: 40.0,
						width: 40.0,
						alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(50)
            ),

            child: GridTile(

              header: Text(
                "Title",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),

              footer: Text("Developer",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),

              ),
              child: Center(
                child: Image.asset("lib/assets/images/crucible.jpg")
              ),
            ),
					)).toList(),
				)
			),
		);
	}
}