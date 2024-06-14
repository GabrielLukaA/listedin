import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:listedin/app/components/footer/footer.dart';
import 'package:listedin/app/data/http/http_client.dart';
import 'package:listedin/app/data/model/user.dart';
import 'package:listedin/app/data/repositories/list_repository.dart';
import 'package:listedin/app/pages/config/config.dart';
import 'package:listedin/app/pages/devs/dev_saymon.dart';
import 'package:listedin/app/data/repositories/user_repository.dart';
import 'package:listedin/app/pages/devs/store_luka.dart';
import 'package:listedin/app/pages/lists/lists.dart';
import 'package:listedin/app/styles/colors.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);

  runApp(MyApp());
}

var darkTheme = ThemeData(
  primarySwatch: MaterialColor(0xff6c39be, swatch) Color(0xff6c39be),
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
)

class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final IListRepository listRepository = ListRepository(HttpClient());
  final ListStore listStore = ListStore(
    repository: UserRepository(
      HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    listStore.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     // Navegar para a segunda página
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const DevLuka(title: "Opa luka")),
            //     );
            //   },
            //   child: const Text('Vai lá luka'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DevSaymon(title: "Opa saymon")),
                );
              },
              child: const Text('Vai lá saymon'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ListsPage(user: listStore.state.value)),
                );
              },
              child: const Text('tela listas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Config(
                      isDark: false,
                      user: User( id: 1, "testeUserConfig", "estouNaDevthiago@gmail.com"),
                    )
                  )
                );
              },
              child: const Text('Vai lá thiago'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(isDark: false,),
    );
  }
}
