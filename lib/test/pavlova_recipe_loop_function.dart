import 'dart:ffi';

import 'package:flutter/material.dart';

class PavlovaRecipeLoopFunction extends StatelessWidget {
  const PavlovaRecipeLoopFunction({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: buildHomePage(),
    );
  }

  Widget buildHomePage() {
    const titleText = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 5,
          fontSize: 25,
        ),
      ),
    );

    const subTitle = Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
          'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
          'topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 20,
      ),
    );

    // #docregion ratings, stars
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black),
      ],
    );

    // #enddocregion stars
    var ratings = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
    // #enddocregion ratings

    // #docregion iconList
    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 5,
      fontSize: 18,
      height: 2,
    );
    Widget _buildColumn (IconData icon, String text, String time) { // đây là hàm
      return Column(
        children: [
          Icon(icon, color: Colors.green[500],),
          Text(text),
          Text(time)

        ],
      );
    }
    List<Widget> _columns = [
      _buildColumn(Icons.kitchen, 'PREP:', '25 mvp'),
      _buildColumn(Icons.timer, 'COOK:', '1 hvp'),
      _buildColumn(Icons.restaurant, 'FEEDS:', '4vp'),
    ];

    // DefaultTextStyle.merge() allows you to create a default text
    // style that is inherited by its child and all subsequent children.
    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [



            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                const Text('PREP:'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                const Text('COOK:'),
                const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                const Text('FEEDS:'),
                const Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );
    // #enddocregion iconList
    final iconListof = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildColumn(Icons.kitchen,'PREP:','25 minof'),
            _buildColumn(Icons.timer, 'COOK:', '1 hrof'),
            _buildColumn(Icons.restaurant, 'FEEDS:', '4-6of'),



          ],
        ),
      ),
    );
    // #enddocregion iconList
    final iconListvp = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _columns.map((column) => column).toList(),// vòng lap

        ),
      ),
    );
    // #enddocregion iconList
    final mainImage = Image.asset(
      'images/pavlova.jpg',
    );

    // #docregion mainColumn
    final mainColumn = Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
          //iconListof,
          iconListvp,
          //mainImage,
          Expanded(child: mainImage),
        ],
      ),
    );
    // #enddocregion mainColumn

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pavlova Recipe'),
      ),
      // #docregion body
      body: mainColumn,
      // #enddocregion body
    );
  }
}