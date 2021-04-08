import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text(
          'EBT blog',
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SingleItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class SingleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Image(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 3.0,
            image:
                NetworkImage('https://randomuser.me/api/portraits/men/73.jpg'),
            fit: BoxFit.cover,
            // filterQuality: FilterQuality.medium,
          ),
          SizedBox(height: 10),
          Text('Título do post',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('Título do post',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
                  
        ],
      ),
    );
  }
}
