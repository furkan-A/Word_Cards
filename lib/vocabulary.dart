import 'dart:math';

import 'package:words/word.dart';

class Vocabulary {
  Random rnd = Random();
  int _index = -1;

  List<Word> wordBank = [
    Word(key: 'inspiration', mean: 'ilham'),
    Word(key: 'assumption', mean: 'varsayım'),
    Word(key: 'rough', mean: 'kaba', desc: 'rude'),
    Word(key: 'intuation', mean: 'sezgi'),
    Word(key: 'intentional', mean: 'kasıtlı'),
    Word(key: 'claim', mean: 'iddia'),
    Word(key: 'deploy', mean: 'dağıtmak'),
    Word(key: 'spectacular', mean: 'muhteşem'),
    Word(key: 'distinguish', mean: 'ayırmak'),
    Word(key: 'stunning', mean: 'çekici'),
  ];

  void addNewWord(Word item) {
    wordBank.add(item);
  }

  // void nextIndex() {
  //   if (_index + 1 < wordBank.length) {
  //     _index++;
  //   }
  // }

  String getKey() {
    if (_index + 1 < wordBank.length) {
      ++_index;
    }
    return wordBank[_index].key;
  }

  String getMean() {
    return wordBank[_index].mean;
  }

  String getRandomMean() {
    return wordBank[rnd.nextInt(wordBank.length)].mean;
  }

  // String setKey(String newKey) => key = newKey;

  // String setValue(String newValue) => value = newValue;
}
