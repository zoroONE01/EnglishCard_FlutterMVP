
class VocabularyRemoteFree {
  String? word;
  String? phonetic;
  List<Phonetics>? phonetics;
  List<Meanings>? meanings;
  License1? license;
  List<String>? sourceUrls;

  VocabularyRemoteFree({this.word, this.phonetic, this.phonetics, this.meanings, this.license, this.sourceUrls});

  VocabularyRemoteFree.fromJson(Map<String, dynamic> json) {
    if(json["word"] is String) {
      word = json["word"];
    }
    if(json["phonetic"] is String) {
      phonetic = json["phonetic"];
    }
    if(json["phonetics"] is List) {
      phonetics = json["phonetics"]==null ? null : (json["phonetics"] as List).map((e)=>Phonetics.fromJson(e)).toList();
    }
    if(json["meanings"] is List) {
      meanings = json["meanings"]==null ? null : (json["meanings"] as List).map((e)=>Meanings.fromJson(e)).toList();
    }
    if(json["license"] is Map) {
      license = json["license"] == null ? null : License1.fromJson(json["license"]);
    }
    if(json["sourceUrls"] is List) {
      sourceUrls = json["sourceUrls"]==null ? null : List<String>.from(json["sourceUrls"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["word"] = word;
    data["phonetic"] = phonetic;
    if(phonetics != null) {
      data["phonetics"] = phonetics?.map((e)=>e.toJson()).toList();
    }
    if(meanings != null) {
      data["meanings"] = meanings?.map((e)=>e.toJson()).toList();
    }
    if(license != null) {
      data["license"] = license?.toJson();
    }
    if(sourceUrls != null) {
      data["sourceUrls"] = sourceUrls;
    }
    return data;
  }
}

class License1 {
  String? name;
  String? url;

  License1({this.name, this.url});

  License1.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["url"] = url;
    return data;
  }
}

class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;
  List<String>? synonyms;
  List<dynamic>? antonyms;

  Meanings({this.partOfSpeech, this.definitions, this.synonyms, this.antonyms});

  Meanings.fromJson(Map<String, dynamic> json) {
    if(json["partOfSpeech"] is String) {
      partOfSpeech = json["partOfSpeech"];
    }
    if(json["definitions"] is List) {
      definitions = json["definitions"]==null ? null : (json["definitions"] as List).map((e)=>Definitions.fromJson(e)).toList();
    }
    if(json["synonyms"] is List) {
      synonyms = json["synonyms"]==null ? null : List<String>.from(json["synonyms"]);
    }
    if(json["antonyms"] is List) {
      antonyms = json["antonyms"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["partOfSpeech"] = partOfSpeech;
    if(definitions != null) {
      data["definitions"] = definitions?.map((e)=>e.toJson()).toList();
    }
    if(synonyms != null) {
      data["synonyms"] = synonyms;
    }
    if(antonyms != null) {
      data["antonyms"] = antonyms;
    }
    return data;
  }
}

class Definitions {
  String? definition;
  List<dynamic>? synonyms;
  List<dynamic>? antonyms;
  String? example;

  Definitions({this.definition, this.synonyms, this.antonyms, this.example});

  Definitions.fromJson(Map<String, dynamic> json) {
    if(json["definition"] is String) {
      definition = json["definition"];
    }
    if(json["synonyms"] is List) {
      synonyms = json["synonyms"] ?? [];
    }
    if(json["antonyms"] is List) {
      antonyms = json["antonyms"] ?? [];
    }
    if(json["example"] is String) {
      example = json["example"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["definition"] = definition;
    if(synonyms != null) {
      data["synonyms"] = synonyms;
    }
    if(antonyms != null) {
      data["antonyms"] = antonyms;
    }
    data["example"] = example;
    return data;
  }
}

class Phonetics {
  String? text;
  String? audio;
  String? sourceUrl;
  License? license;

  Phonetics({this.text, this.audio, this.sourceUrl, this.license});

  Phonetics.fromJson(Map<String, dynamic> json) {
    if(json["text"] is String) {
      text = json["text"];
    }
    if(json["audio"] is String) {
      audio = json["audio"];
    }
    if(json["sourceUrl"] is String) {
      sourceUrl = json["sourceUrl"];
    }
    if(json["license"] is Map) {
      license = json["license"] == null ? null : License.fromJson(json["license"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    data["audio"] = audio;
    data["sourceUrl"] = sourceUrl;
    if(license != null) {
      data["license"] = license?.toJson();
    }
    return data;
  }
}

class License {
  String? name;
  String? url;

  License({this.name, this.url});

  License.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["url"] = url;
    return data;
  }
}