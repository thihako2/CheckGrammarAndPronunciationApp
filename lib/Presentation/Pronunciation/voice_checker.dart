import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';
import 'package:mmengstrain/Presentation/Widgets/OutputViewWidgets.dart';
import 'package:mmengstrain/Presentation/Widgets/TextToWatch.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:dart_phonetics/dart_phonetics.dart';

class VoiceCheck extends StatefulWidget {
  String texttoRecord;
  VoiceCheck({required this.texttoRecord});

  @override
  State<VoiceCheck> createState() => _VoiceCheckState();
}

class _VoiceCheckState extends State<VoiceCheck> {
  late stt.SpeechToText _speech;
  // GoogleTranslator translator = GoogleTranslator();
  bool _isListening = false;
  String _text = "";
  String _text2 = "pronunciation check true or false will be here";
  double _confidence = 1.0;
  List<String> wrongwords = [];
  List<String> speechwrongwords = [];
  // final Fluttertts ftts = FlutterTts();

  final soundex = RefinedSoundex.defaultEncoder;
  // String _selectectedlocale = 'my_MM';
  final _selectectedlocale = 'en-US';
  // speak(String text) async {
  //   await ftts.setLanguage(_selectectedlocale);
  //   await ftts.setPitch(1);
  //   await ftts.speak(text);
  // }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.texttoRecord);
    // Confidence: ${(_confidence * 100.0).toStringAsFixed(1)} %
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pronunciation Checker'),
          backgroundColor: AppColors.third,
        ),
        body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextToWatch(
                      text: widget.texttoRecord, color: AppColors.primary),
                  _text == "" ? Container() : OutputView(text: _text),
                  // Text(
                  //   _text,
                  //   style: const TextStyle(
                  //     fontSize: 32.0,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                  // Text(
                  //   _text2.toString(),
                  //   style: const TextStyle(
                  //     fontSize: 32.0,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: wrongwords.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return ListTile(
                          onTap: () {
                            // speak(wrongwords[Index]); // Print to console
                          },
                          title: Container(
                              child: Row(
                            children: [
                              const Text(
                                'what the real word is ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                wrongwords[Index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                          subtitle: Container(
                              child: Row(
                            children: [
                              Text(
                                'what the word u speak',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                speechwrongwords[Index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                          trailing: Icon(Icons.edit),
                        );
                        ;
                      }),
                ],
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          glowColor: AppColors.secondary,
          endRadius: 75.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            backgroundColor: AppColors.third,
            onPressed: _listen,
            child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          ),
        ));
  }

  void _listen() async {
    // _printTokens('TOKENIZE PARAGRAPHS', await _tokenizeParagraphs(exampleText));
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('OnStatus: $val'),
        onError: (val) {
          print('OnError: $val');
        },
        debugLogging: true,
      );
      if (available) {
        setState(() {
          _isListening = true;
        });
        // var locales = await _speech.locales();

        // var selectedLocale = locales[0];
        _speech.listen(
          onResult: (val) {
            setState(() {
              _text = val.recognizedWords;

              if (val.hasConfidenceRating && val.confidence > 0) {
                _confidence = val.confidence;
              }
            });

            translate();
          },
          // localeId: _selectedlocale,
          localeId: _selectectedlocale,
        );
      }
    } else {
      setState(() {
        _isListening = false;
      });
      // translate();
      _speech.stop();
    }
  }

  Future<void> translate() async {
    var words = _text.split(' ');
    var encodewords = words.map((e) => soundex.encode(e)?.primary);
    // var encoding = soundex.encode(_text);
    // var hellotext = "The quick brown fox jumps over the lazy dog";
    var hellotext = widget.texttoRecord;
    var hellowords = hellotext.split(' ');
    // var helloencode =
    //     soundex.encode("The quick brown fox jumps over the lazy dog");
    var encodehellowords = hellowords.map((e) => soundex.encode(e)?.primary);

    if (encodewords.length == encodehellowords.length) {
      wrongwords = [];
      for (var i = 0; i < encodewords.length; i++) {
        if (encodewords.elementAt(i) == encodehellowords.elementAt(i)) {
          _text2 = "True";
        } else {
          _text2 = "False";
          wrongwords.add(hellowords.elementAt(i));
          speechwrongwords.add(words.elementAt(i));
        }
      }
    }

    setState(() {});
  }
}
