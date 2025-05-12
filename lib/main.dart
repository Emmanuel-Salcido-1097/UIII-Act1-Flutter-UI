import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  } 

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'https://raw.githubusercontent.com/Emmanuel-Salcido-1097/P8MisImagenes6I/refs/heads/main/Banco-MX.jpg',
            title: 'Banco de México	',
            description: 'Este banco se hubica en México, su popularidad lo hace concurrido, es de los mas seguros del pais.'
          ),
          makePage(
            page: 2,
            image: 'https://raw.githubusercontent.com/Emmanuel-Salcido-1097/P8MisImagenes6I/refs/heads/main/Banco-Chile.jpg',
            title: 'Banco de Chile',
            description: 'Nuestro banco ubicado en Chile cuenta con muy buena atencion al cliente y mucha seguridad.'
          ),
          makePage(
            page: 3,
            image: 'https://github.com/Emmanuel-Salcido-1097/P8MisImagenes6I/blob/main/Banco-Londres.jpg?raw=true',
            title: 'Banco de Londres',
            description: "En Londres contamos con uno de los mejores bancos del mundo, contamos con una gran variedad de servicios."
          ),
          makePage(
            page: 4,
            image: 'https://github.com/Emmanuel-Salcido-1097/P8MisImagenes6I/blob/main/Banco-Peru.jpg?raw=true',
            title: 'Banco de Perú',
            description: "El banco ubicado en Perú es muy accesible para los clientes que quieren realizar sus procesos de manera segura."
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeInUp(child: Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                  Text('/$totalPage', style: TextStyle(color: Colors.white, fontSize: 15),)
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(child:
                      Text(title, style: TextStyle(color: Colors.white, fontSize: 50, height: 1.2, fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInUp(child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Text('5.0', style: TextStyle(color: Colors.white70),),
                        Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12),)
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInUp(child: Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),),
                    )),
                    SizedBox(height: 20,),
                    FadeInUp(child: Text('Leer Más', style: TextStyle(color: Colors.white),)),
                    SizedBox(height: 30,),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}