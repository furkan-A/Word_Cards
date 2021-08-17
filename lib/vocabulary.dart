import 'package:words/word.dart';

class Vocabulary {
  int _index = 0;
  List<Word> wordBank = [
    Word(key: 'inspration', mean: 'ilham'),
    Word(key: 'assumption', mean: 'varsayım'),
    Word(key: 'rough', mean: 'kaba', desc: 'rude'),
    Word(key: 'intuation', mean: 'sezgi'),
    Word(key: 'intentional', mean: 'kasıtlı')
  ];

  void addNewWord(Word item) {
    wordBank.add(item);
  }

  void nextIndex() {
    if (_index + 1 < wordBank.length) {
      _index++;
    }
  }

  String getKey() {
    return wordBank[_index].key;
  }

  String getMean() {
    return wordBank[_index].mean;
  }

  // String setKey(String newKey) => key = newKey;

  // String setValue(String newValue) => value = newValue;
}
