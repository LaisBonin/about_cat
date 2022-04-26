import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';

bool _play = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String catFact = " ";

  @override
  void initState() {
    super.initState();

    getDio();
  }
@override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
          image: DecorationImage(
        opacity: 0.3,
        colorFilter: ColorFilter.mode(
            Color.fromARGB(255, 245, 245, 186), BlendMode.dstATop),
        image: AssetImage("images/fly3.gif"),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        ///[APPBAR]
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 88, 131),
          elevation: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text("Sobre"),
                        onTap: () {
                          Future.delayed(
                              const Duration(seconds: 0),
                              () => showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                      title: Text("Bacê Neko"),
                                      content: Text(
                                          "Projeto inspirado em um gato que adotei!"),
                                    ),
                                  ));
                        },
                      ),
                      PopupMenuItem(
                        child: const Text("Contato"),
                        onTap: () {
                          Future.delayed(
                              const Duration(seconds: 0),
                              () => showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                      title: Text("Meu E-mail"),
                                      content: Text("Bacepravoce@gmail.com"),
                                    ),
                                  ));
                        },
                      )
                    ])
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  onPressed: () => launch(
                      "https://www.petvale.com.br/adotar-gatos-curitiba-pr/"),
                  icon: const FaIcon(FontAwesomeIcons.paw),
                )
              ]),
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("images/gato2.gif"),
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                    )),
                height: 40,
                width: 40,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AudioWidget.assets(
                    path: "images/Kids_MGMT.mp3",
                    play: _play,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _play = !_play;
                        });
                      },
                      icon: const Icon(Icons.volume_up),
                    ),
                    onReadyToPlay: (duration) {
                      //onReadyToPlay
                    },
                    onPositionChanged: (current, duration) {
                      //onPositionChanged
                    },
                  )
                ],
              ),
            ],
          ),
        ),

        ///[BODY]
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                          width: 16,
                        ),
                        Text(
                          "Bacê Neko",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          " Também conhecida como Natsuhiboshi, que significa 'Estrela do Dia de Verão', Bacê é uma gatinha que foi adotada, e desde que se tornou membro de sua família só trás alegrias.",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                            color: const Color.fromARGB(255, 67, 30, 233),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 24,
              ),

              const SizedBox(
                height: 48,
              ),
              Center(
                child: Text(
                  "Curiosidades Sobre Gatos:",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 16, 53, 83),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                height: 250,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: ScrollController(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            width: 200.0,
                            height: 250.0,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                elevation: 20,
                                shadowColor:
                                    const Color.fromARGB(255, 77, 32, 128),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "É filho de leão?",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily:
                                            GoogleFonts.ramaraja().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.grey[400],
                                      width: 100,
                                      height: 1,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 15, 16, 15),
                                      child: Text(
                                        "» De acordo com uma lenda hebraica, Noé rezou a Deus para o ajudar a proteger a comida dos ratos na arca. Deus fez um Leão espirrar, e desse espirro nasceu o gato.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily:
                                              GoogleFonts.ubuntu().fontFamily,
                                          fontWeight: FontWeight.normal,
                                          color: const Color.fromARGB(
                                              255, 16, 53, 83),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            width: 200.0,
                            height: 250.0,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                elevation: 20,
                                shadowColor:
                                    const Color.fromARGB(255, 77, 32, 128),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Drive Instalado",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily:
                                            GoogleFonts.ramaraja().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.grey[400],
                                      width: 100,
                                      height: 1,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 8, 16, 0),
                                      child: Text(
                                        "» Os especialistas acreditam que os gatos usam o ângulo da luz do sol para encontrar o caminho de casa, ou que existem células magnéticas no seu cérebro que atuam como uma bússola.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily:
                                              GoogleFonts.ubuntu().fontFamily,
                                          fontWeight: FontWeight.normal,
                                          color: const Color.fromARGB(
                                              255, 16, 53, 83),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            width: 200.0,
                            height: 250.0,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                elevation: 20,
                                shadowColor:
                                    const Color.fromARGB(255, 77, 32, 128),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Pura Emoção",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily:
                                            GoogleFonts.ramaraja().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.grey[400],
                                      width: 100,
                                      height: 1,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 8, 16, 8),
                                      child: Text(
                                        "» O cérebro de um gato é biologicamente mais similar ao de um humano do que o cérebro de um cão. Ambos, humanos e gatos, têm uma região idêntica no cérebro responsável pelas emoções.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily:
                                              GoogleFonts.ubuntu().fontFamily,
                                          fontWeight: FontWeight.normal,
                                          color: const Color.fromARGB(
                                              255, 16, 53, 83),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  ],
                ),
              ),

              ///[PRIMEIRO CARD DE EXPERIENCIA]

              const SizedBox(height: 16),

              /// [EXPERIENCE CARD 2]

              const SizedBox(height: 32),

              ///[EDUCATION]
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Gatos são pura diversão, confira no vídeo:",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: GoogleFonts.ramaraja().fontFamily,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 20, 20, 19),
                    ),
                  ),
                  const SizedBox(width: 24),
                  IconButton(
                    onPressed: () =>
                        launch("https://www.youtube.com/watch?v=JxS5E-kZc2s"),
                    icon: const Icon(Icons.smart_display),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Text(
                  "Locais Para Adoção:",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 85, 17, 40),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Associação do Amigo Animal",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 42, 3, 114),
                        ),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () => launch("http://amigoanimal.org.br/"),
                        icon: const Icon(Icons.link),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Adote Bicho",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.ramaraja().fontFamily,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 42, 3, 114),
                        ),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () =>
                            launch("https://www.adotebicho.com.br/"),
                        icon: const Icon(Icons.link),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Beco da Esperança",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.ramaraja().fontFamily,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 42, 3, 114),
                        ),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () => launch("http://becodaesperanca.org/"),
                        icon: const Icon(Icons.link),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void getDio() async {
    try {
      var response = await Dio()
          .get('https://cat-fact.herokuapp.com/facts/random?amount=1');
      catFact = response.data["text"];
      setState(() {});
    } catch (e) {
      // print(e);
    }
  }
}
