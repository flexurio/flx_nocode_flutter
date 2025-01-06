import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

import 'src/app/view/page/editor/widget/component_library.dart';
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
  int? showFrameIndex = null;

  void _addComponent(Widget component, int index) {
    if (index == -1) {
      components.add(component);
    } else {
      components.insert(index, component);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
      components.length,
      (i) {
        final e = components[i];
        return Column(
          children: [
            _dragTarget(i),
            GestureDetector(
              onSecondaryTap: () {
                setState(() {
                  components.removeAt(i);
                });
              },
              child: InkWell(
                child: AbsorbPointer(
                  child: ComponentFrame(
                    child: e,
                    showFrame: showFrameIndex == i,
                  ),
                ),
                onTap: () {
                  setState(() {
                    showFrameIndex = i;
                  });
                },
              ),
            ),
          ],
        );
      },
    );

    return Container(
      color: Colors.grey[800],
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          padding: const EdgeInsets.all(12),
          width: 600,
          height: 600,
          child: Center(
            child: ComponentFrame(
              showFrame: false,
              child: Column(
                children: [
                  ...items,
                  _dragTarget(-1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DragTarget<Widget> _dragTarget(int index) {
    return DragTarget<Widget>(
      onAcceptWithDetails: (data) {
        _addComponent(data.data, index);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: candidateData.isNotEmpty ? Colors.blue[200] : Colors.white,
          ),
          padding: const EdgeInsets.all(12),
          width: 600,
          height: candidateData.isNotEmpty ? 10 : 2,
        );
      },
    );
  }
}

class ComponentFrame extends StatelessWidget {
  const ComponentFrame({
    super.key,
    required this.child,
    required this.showFrame,
  });
  final Widget child;
  final bool showFrame;

  @override
  Widget build(BuildContext context) {
    if (!showFrame) return child;

    final color = Colors.orange;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: -20,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(3),
            color: color,
            child: Text(
              'Column',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: color, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
