import 'package:flutter/material.dart';
import 'gridview_demo.dart';
import 'listview.dart';

void main(List<String> args) {
  runApp(
    new MaterialApp(
      home: TarjousAle(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class TarjousAle extends StatefulWidget {
  @override
  _TarjousAleState createState() => _TarjousAleState();
}

class _TarjousAleState extends State<TarjousAle>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("TARJOUS JA ALE!!"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            MyMenu(
              title: "K-Market",
              icon: Icons.account_balance,
              //images: Image.asset('assets/images/k-market.png'),
              shape: Colors.brown,
              page: GridViewDemo(),
            ),
            MyMenu(
              title: "C-Market", 
              icon: Icons.account_balance_wallet,             
              //images: getWidget('assets/images/k-citymarket.png'),
              shape: Colors.grey,
              page: HomePage(),                           
            ),
            MyMenu(
              title: "S-Market",
              icon: Icons.airline_seat_flat,
              shape: Colors.indigo,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        iconSize: 30.0,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Camera'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.icon, this.shape, this.page /*, this.images */});

  final page;
  final String title;
  final IconData icon;
  //final Image images;
  final MaterialColor shape;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(9.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
        splashColor: Colors.amberAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[  
              //Column(children: [buildPic(), Text("here")]),           
              Icon(
                icon,
                size: 80.0,
                color: shape,
              ),
              Text(title, style: new TextStyle(fontSize: 18.0))
            ],
          ),
        ),
      ),
    );
  }
}

/* Widget getWidget(imagePath){
   return Container(
      child: Column(
          children : <Widget>[
            Image.asset(imagePath),           
          ] 
       )
     );
} */

/* Widget buildPic() => Image != null ? 
Image.asset(image) : Icon(icon)

 */
