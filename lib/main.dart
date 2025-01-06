import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

import 'src/app/view/page/widget/editor/component_library.dart';
import 'package:appointment/constant/flavor.dart';

void main() => runApp(NoCodeAppEditor());

class NoCodeAppEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'No-Code App Editor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: EditorScreen(),
    );
  }
}

class EditorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No-Code App Editor'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () {}),
          IconButton(icon: Icon(Icons.preview), onPressed: () {}),
          IconButton(icon: Icon(Icons.code), onPressed: () {}),
        ],
      ),
      body: Row(
        children: [SidebarWidgetLibrary(), Expanded(child: App())],
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    flavorConfig = configFlavorMetiskaFarmaProduction;

    return MaterialApp(
      theme: MyTheme.getTheme(flavorConfig.color, ThemeMode.light),
      home: Material(child: CanvasApp()),
    );
  }
}

class CanvasApp extends StatefulWidget {
  const CanvasApp({super.key});

  @override
  State<CanvasApp> createState() => _CanvasAppState();
}

class _CanvasAppState extends State<CanvasApp> {
  final List<Widget> components = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      child: Center(
        child: DragTarget<Widget>(
          onAcceptWithDetails: (data) {
            components.add(data.data);
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              decoration: BoxDecoration(
                color: candidateData.isNotEmpty
                    ? Colors.green[200] // Highlight when an item hovers
                    : Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              width: 200,
              height: 200,
              child: Center(
                child: candidateData.isNotEmpty
                    ? Text(
                        'Drop Here',
                        style: TextStyle(color: Colors.black),
                      )
                    : Column(children: components),
              ),
            );
          },
        ),
      ),
    );
  }
}
