import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/data.dart';
import 'package:test_your_personality/view/loading_widget.dart';
import 'package:test_your_personality/controller/question_and_options.dart';
import 'package:test_your_personality/model/personality_model.dart';

final controller = ChangeNotifierProvider((ref) => PersonalityModel());

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();



class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => TestScreenState();
}

class TestScreenState extends ConsumerState<TestScreen> {
  @override
  void initState() {
    ref.read(controller).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(controller);
    var read=ref.read(controller);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Points: ${watch.getTotalPoints()}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              Visibility(
                  visible: !watch.getSelectedOptionList().contains(0),
                child: Text(
                    'State -> ${watch.personalityState}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blue

                  ),
                ),

              ),
            ],
          ),
          backgroundColor: const Color(0x0000007d),
        ),
        body: LoadingWidget(
          isLoading: watch.isLoadingData,
          child: Padding(
            padding: const EdgeInsets.all( 10.0),
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    'Test Your Personality...',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 10.0,
                ),
                const Text(
                  'You need to answer a few questions',
                  style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  thickness: 5.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                for (int index = 0; index < questions.length; index++)
                  QuestionAndOptionsWidget(index: index),
                Visibility(
                  visible: watch.isChanged,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.3),
                    child: ElevatedButton(
                        onPressed: () {
                          if (watch.getSelectedOptionList().contains(0)==false) {
                            int length = watch.getSelectedOptionList().length;

                            late int? element;

                            for (int i = 0; i < length; i++) {
                              element = int.parse(watch
                                      .getSelectedOptionList()
                                      .elementAt(i)
                                      .toString()) -
                                  1;
                              read.addPoints(element);
                            }
                            read.personalityFinalState();

                            final snackBar = SnackBar(
                              content: const Text('Hi, I am a SnackBar!'),
                              backgroundColor: (Colors.black12),
                              duration: Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'dismiss',
                                onPressed: () {
                                },
                              ),
                            );
                            //SnackBar(content: Text('Murat'),duration: Duration(seconds: 2));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        child: const Text('Apply')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
