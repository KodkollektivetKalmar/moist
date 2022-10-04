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
						crossAxisCount: 3,
						crossAxisSpacing: 16,
						mainAxisSpacing: 16,
						),
					// Creating items for the gridView form the dummylist, here we need to fetch
					// the games from the database, when that is created //
					children: dummy.map((e) => Container(
						height: 50.0,
						width: 50.0,
						color: Colors.blueGrey,
						alignment: Alignment.center,
						child: Text('$e'), // Instead of toString()
					)).toList(),
					)
				),

		);
	}
}
