import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picklescore/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

import 'models/score.dart';
import 'screens/scorescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Score(),
      child: Consumer<Score>(
        builder: (ctx, score, _) => MaterialApp(
          title: 'Picleball Score',
          home: Scaffold(
            drawer: MyDrawer(),
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text('Pickleball Score'),
              backgroundColor:
                  Provider.of<Score>(ctx, listen: false).curState.over()
                      ? Colors.red
                      : Colors.green,
              actions: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  tooltip: 'UnDo',
                  onPressed: () {
                    Provider.of<Score>(ctx, listen: false).rollback();
                    // Handle reset action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.restore),
                  tooltip: 'Reset',
                  onPressed: () {
                    Provider.of<Score>(ctx, listen: false).reset();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.exit_to_app_rounded),
                  tooltip: 'Exit',
                  onPressed: () {
                    closeAppUsingSystemPop();
                  },
                ),
              ],
            ),
            body: ScoreScreen(),
          ),
        ),
      ),
    );
  }
}
