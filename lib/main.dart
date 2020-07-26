import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokeapi/pokeapi.dart';
import 'package:pokemon_flutter/pokemonDetail.dart';
import 'package:pokemon_flutter/pokemon.dart';
import 'dart:convert';

void main() => runApp(Center(
      child: MaterialApp(
        title: "ポケモン　アプリ",
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var url = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/pokedex.json";
  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decode = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson2(decode);
    print(pokeHub.toJson());
    setState(() {});
  }

  String getImage(int id) {
    var url = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/sprites/";
    var png = "MS.png";
    var imageURL = url + id.toString().padLeft(3, '0') + png;
    print("imageURL:" + imageURL);
    return imageURL;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var itemWidth = size.width / 2;
    var itemHeight = 50.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("ポケモン　アプリ"),
        backgroundColor: Colors.blue,
      ),
      body
          : pokeHub == null ? Center(child: CircularProgressIndicator(),)
          : GridView.count(
              // 横の数
              crossAxisCount: 1,
              childAspectRatio: (itemWidth / itemHeight),
              // 取得結果
              children: pokeHub.pokemons
                  .map((poke) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child:InkWell(
                        onTap: () {
//                          Navigator.push(context,
//                              MaterialPageRoute(builder: (context) => PokeDetail(pokemon: poke)));
                        },
                          child: Hero(
                            tag: getImage(poke.id),
//                            child: Card(
//                              elevation: 3.0,
                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(getImage(poke.id)))),
                                  ),
                                  Expanded(child: Column(
                                    children: <Widget>[
                                      Text(
                                        poke.getIdToString(),
                                        style: TextStyle(
                                            fontSize: 10.0, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        poke.name.japanese,
                                        style: TextStyle(
                                            fontSize: 20.0, fontWeight: FontWeight.bold),
                                      )
                                    ],

                                  ))
                                ],
                              ),
//                            ),
                          )
                      ),
                  ))
                  .toList(),
            ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: Icon(Icons.refresh)),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
