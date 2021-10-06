class Word {
  String key;
  String desc; // description
  String mean;

  Word({required this.key, required this.mean, this.desc = ''});

  void editInfo(String newKey, String newMean, String newDesc) {
    key = newKey;
    mean = newMean;
    desc = newDesc;
  }
}
