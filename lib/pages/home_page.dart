import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            SingleItem(),
            SingleItem(),
            SingleItem(),
            SingleItem(),
            SingleItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.post_add_rounded),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddBlogPage()  ));
        },
      ),
    );
  }
}

class SingleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF101010), borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 3.0,
                image: NetworkImage(
                    'https://randomuser.me/api/portraits/men/73.jpg'),
                fit: BoxFit.cover,
                // filterQuality: FilterQuality.medium,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black87],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ]),
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Título do post',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('Descrição do post',
                      style: GoogleFonts.roboto(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              )),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_rounded,
                  size: 30,
                  color: Colors.yellow[300],
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.comment,
                  size: 25,
                  color: Colors.yellow[300],
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.shareAlt,
                  size: 25,
                  color: Colors.yellow[300],
                )),
          ]),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
