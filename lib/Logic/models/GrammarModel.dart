class GrammarModel {
  List<Corrections>? corrections;
  List<Sentences>? sentences;

  GrammarModel({this.corrections, this.sentences});

  GrammarModel.fromJson(Map<String, dynamic> json) {
    if (json['Corrections'] != null) {
      corrections = <Corrections>[];
      json['Corrections'].forEach((v) {
        corrections!.add(new Corrections.fromJson(v));
      });
    }
    if (json['Sentences'] != null) {
      sentences = <Sentences>[];
      json['Sentences'].forEach((v) {
        sentences!.add(new Sentences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.corrections != null) {
      data['Corrections'] = this.corrections!.map((v) => v.toJson()).toList();
    }
    if (this.sentences != null) {
      data['Sentences'] = this.sentences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Corrections {
  int? confidence;
  int? from;
  String? lrnFrg;
  List<LrnFrgOrigIndxs>? lrnFrgOrigIndxs;
  List<Mistakes>? mistakes;
  bool? shouldReplace;
  List<Suggestions>? suggestions;
  int? to;
  int? topLrnCatId;
  int? type;
  int? uXFrgFrom;
  int? uXFrgTo;

  Corrections(
      {this.confidence,
      this.from,
      this.lrnFrg,
      this.lrnFrgOrigIndxs,
      this.mistakes,
      this.shouldReplace,
      this.suggestions,
      this.to,
      this.topLrnCatId,
      this.type,
      this.uXFrgFrom,
      this.uXFrgTo});

  Corrections.fromJson(Map<String, dynamic> json) {
    confidence = json['Confidence'];
    from = json['From'];
    lrnFrg = json['LrnFrg'];
    if (json['LrnFrgOrigIndxs'] != null) {
      lrnFrgOrigIndxs = <LrnFrgOrigIndxs>[];
      json['LrnFrgOrigIndxs'].forEach((v) {
        lrnFrgOrigIndxs!.add(new LrnFrgOrigIndxs.fromJson(v));
      });
    }
    if (json['Mistakes'] != null) {
      mistakes = <Mistakes>[];
      json['Mistakes'].forEach((v) {
        mistakes!.add(new Mistakes.fromJson(v));
      });
    }
    shouldReplace = json['ShouldReplace'];
    if (json['Suggestions'] != null) {
      suggestions = <Suggestions>[];
      json['Suggestions'].forEach((v) {
        suggestions!.add(new Suggestions.fromJson(v));
      });
    }
    to = json['To'];
    topLrnCatId = json['TopLrnCatId'];
    type = json['Type'];
    uXFrgFrom = json['UXFrgFrom'];
    uXFrgTo = json['UXFrgTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Confidence'] = this.confidence;
    data['From'] = this.from;
    data['LrnFrg'] = this.lrnFrg;
    if (this.lrnFrgOrigIndxs != null) {
      data['LrnFrgOrigIndxs'] =
          this.lrnFrgOrigIndxs!.map((v) => v.toJson()).toList();
    }
    if (this.mistakes != null) {
      data['Mistakes'] = this.mistakes!.map((v) => v.toJson()).toList();
    }
    data['ShouldReplace'] = this.shouldReplace;
    if (this.suggestions != null) {
      data['Suggestions'] = this.suggestions!.map((v) => v.toJson()).toList();
    }
    data['To'] = this.to;
    data['TopLrnCatId'] = this.topLrnCatId;
    data['Type'] = this.type;
    data['UXFrgFrom'] = this.uXFrgFrom;
    data['UXFrgTo'] = this.uXFrgTo;
    return data;
  }
}

class LrnFrgOrigIndxs {
  int? from;
  int? to;

  LrnFrgOrigIndxs({this.from, this.to});

  LrnFrgOrigIndxs.fromJson(Map<String, dynamic> json) {
    from = json['From'];
    to = json['To'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['From'] = this.from;
    data['To'] = this.to;
    return data;
  }
}

class Mistakes {
  bool? canAddToDict;
  int? from;
  int? to;

  Mistakes({this.canAddToDict, this.from, this.to});

  Mistakes.fromJson(Map<String, dynamic> json) {
    canAddToDict = json['CanAddToDict'];
    from = json['From'];
    to = json['To'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CanAddToDict'] = this.canAddToDict;
    data['From'] = this.from;
    data['To'] = this.to;
    return data;
  }
}

class Suggestions {
  int? lrnCatId;
  String? text;

  Suggestions({this.lrnCatId, this.text});

  Suggestions.fromJson(Map<String, dynamic> json) {
    lrnCatId = json['LrnCatId'];
    text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LrnCatId'] = this.lrnCatId;
    data['Text'] = this.text;
    return data;
  }
}

class Sentences {
  int? fromIndex;
  int? toIndex;
  bool? isEnglish;
  bool? exceededCharacterLimit;
  bool? isSentencePart;
  bool? allCaps;

  Sentences(
      {this.fromIndex,
      this.toIndex,
      this.isEnglish,
      this.exceededCharacterLimit,
      this.isSentencePart,
      this.allCaps});

  Sentences.fromJson(Map<String, dynamic> json) {
    fromIndex = json['FromIndex'];
    toIndex = json['ToIndex'];
    isEnglish = json['IsEnglish'];
    exceededCharacterLimit = json['ExceededCharacterLimit'];
    isSentencePart = json['IsSentencePart'];
    allCaps = json['AllCaps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FromIndex'] = this.fromIndex;
    data['ToIndex'] = this.toIndex;
    data['IsEnglish'] = this.isEnglish;
    data['ExceededCharacterLimit'] = this.exceededCharacterLimit;
    data['IsSentencePart'] = this.isSentencePart;
    data['AllCaps'] = this.allCaps;
    return data;
  }
}
