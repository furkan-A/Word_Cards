import 'dart:math';

import 'package:words/models/word.dart';

class Vocabulary {
  Random rnd = Random();
  int _index = 0;

  List<Word> learnedWords = [];
  List<Word> wordBank = [
    Word(key: 'inspiration', mean: 'ilham'),
    Word(key: 'assumption', mean: 'varsayım'),
    Word(key: 'rough', mean: 'kaba', desc: 'rude'),
    Word(key: 'intuation', mean: 'sezgi'),
    Word(key: 'claim', mean: 'iddia'),
    Word(key: 'intentional', mean: 'kasıtlı'),
    Word(key: 'deploy', mean: 'dağıtmak'),
    Word(key: 'spectacular', mean: 'muhteşem'),
    Word(key: 'distinguish', mean: 'ayırmak'),
    Word(key: 'stunning', mean: 'çekici'),
    Word(key: 'surrogate', mean: 'vekil'),
  ];

  int getIndex() {
    return _index;
  }

  void addNewWord(Word item) {
    wordBank.add(item);
  }

  void editWord(Word word, String newKey, String newMean, String newDesc) {
    word.editInfo(newKey, newMean, newDesc);
  }

  void carryToLearned() {
    if (size() > 1) {
      Word w = wordBank[getIndex()];
      learnedWords.add(w);
      deleteWord(w);
    }
  }

  int size() {
    return wordBank.length;
  }

  void nextIndex() {
    if (_index + 1 < wordBank.length && wordBank.isNotEmpty) {
      _index++;
    }
  }

  void previousIndex() {
    if (_index > 0) {
      _index--;
    }
  }

  void deleteWord(Word word) {
    wordBank.remove(word);
    previousIndex();
  }

  String getKey() {
    return wordBank[_index].key;
  }

  String getMean() {
    return wordBank[_index].mean;
  }

  String getDesc() {
    return wordBank[_index].desc;
  }

  String getRandomMean() {
    return wordBank[rnd.nextInt(wordBank.length)].mean;
  }
}
