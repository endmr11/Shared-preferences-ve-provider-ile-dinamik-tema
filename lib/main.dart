import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tema.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeColorData().yaratSharedPrefObjesi();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeColorData>(
          create: (BuildContext context) => ThemeColorData(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeColorData>(context, listen: false)
        .yukleTemayiSharedPreften();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeColorData>(context).temaRengi,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Tema Seçimi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: Provider.of<ThemeColorData>(context).isLight
                  ? Text("Açık Tema")
                  : Text("Kapalı Tema"),
              onChanged: (/*bool newValue*/ _) {
                Provider.of<ThemeColorData>(context, listen: false)
                    .degistirTema();
              },
              value: Provider.of<ThemeColorData>(context).isLight,
            ),
            Card(
              child: ListTile(
                title: Text(
                    "Deger: ${Provider.of<ThemeColorData>(context).isLight}"),
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
