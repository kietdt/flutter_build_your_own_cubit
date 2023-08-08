import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SimpleCounter extends ChangeNotifier implements ValueListenable<int> {
  int count;

  SimpleCounter({
    this.count = 0,
  });

  void increase() {
    count++;
    notifyListeners();
  }

  @override
  get value => count;
}

class SimpleCounterWithNotifier extends StatefulWidget {
  const SimpleCounterWithNotifier({super.key});

  @override
  State<SimpleCounterWithNotifier> createState() =>
      _SimpleCounterWithNotifierState();
}

class _SimpleCounterWithNotifierState extends State<SimpleCounterWithNotifier> {
  final SimpleCounter counterNotifier = SimpleCounter();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleCounterPage(
        title: 'Flutter Demo Home Page',
        counterNotifier: counterNotifier,
      ),
    );
  }

  @override
  void dispose() {
    counterNotifier.dispose();
    super.dispose();
  }
}

class SimpleCounterPage extends StatefulWidget {
  const SimpleCounterPage({
    super.key,
    required this.title,
    required this.counterNotifier,
  });

  final String title;
  final SimpleCounter counterNotifier;

  @override
  State<SimpleCounterPage> createState() => _SimpleCounterPageState();
}

class _SimpleCounterPageState extends State<SimpleCounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<int>(
              valueListenable: widget.counterNotifier,
              builder: (context, state, _) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.counterNotifier.increase,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
