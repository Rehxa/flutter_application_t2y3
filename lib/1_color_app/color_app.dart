import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Home()),
    ),
  );
}

enum CardType {
  red(cardColor: Colors.red),
  blue(cardColor: Colors.blue),
  green(cardColor: Colors.lightGreen),
  yellow(cardColor: Colors.yellow);

  final Color cardColor;

  const CardType({required this.cardColor});
}

class Counter extends ChangeNotifier {
  Map<CardType, int> cards = {
    CardType.red: 0,
    CardType.blue: 0,
    CardType.green: 0,
    CardType.yellow: 0,
  };

  void incrementColorTapCount(CardType cardType) {
    if (cards.containsKey(cardType)) {
      cards[cardType] = cards[cardType]! + 1;
      notifyListeners();
    }
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  Counter colorCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: colorCounter,
        builder: (builder, child) {
          return _currentIndex == 0
              ? ColorTapsScreen(colorCounter: colorCounter)
              : StatisticsScreen(colorCounter: colorCounter);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  final Counter colorCounter;

  const ColorTapsScreen({super.key, required this.colorCounter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(
            type: CardType.red,
            tapCount: colorCounter.cards[CardType.red]!,
            onTap: () => colorCounter.incrementColorTapCount(CardType.red),
          ),
          ColorTap(
            type: CardType.blue,
            tapCount: colorCounter.cards[CardType.blue]!,
            onTap: () => colorCounter.incrementColorTapCount(CardType.blue),
          ),
          ColorTap(
            type: CardType.green,
            tapCount: colorCounter.cards[CardType.green]!,
            onTap: () => colorCounter.incrementColorTapCount(CardType.green),
          ),
          ColorTap(
            type: CardType.yellow,
            tapCount: colorCounter.cards[CardType.yellow]!,
            onTap: () => colorCounter.incrementColorTapCount(CardType.yellow),
          ),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.tapCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: type.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  final Counter colorCounter;

  const StatisticsScreen({super.key, required this.colorCounter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Red Taps: ${colorCounter.cards[CardType.red]}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Blue Taps: ${colorCounter.cards[CardType.blue]}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Green Taps: ${colorCounter.cards[CardType.green]}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Yellow Taps: ${colorCounter.cards[CardType.yellow]}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
