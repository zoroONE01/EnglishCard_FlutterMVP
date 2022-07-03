class VocabularyRemote {
  String? id;
  Metadata? metadata;
  List<Results>? results;
  String? word;

  VocabularyRemote({this.id, this.metadata, this.results, this.word});

  VocabularyRemote.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["metadata"] is Map) {
      metadata =
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if (json["results"] is List) {
      results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    }
    if (json["word"] is String) {
      word = json["word"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if (metadata != null) {
      data["metadata"] = metadata?.toJson();
    }
    if (results != null) {
      data["results"] = results?.map((e) => e.toJson()).toList();
    }
    data["word"] = word;
    return data;
  }
}

class Results {
  String? id;
  String? language;
  List<LexicalEntries>? lexicalEntries;
  String? type;
  String? word;

  Results({this.id, this.language, this.lexicalEntries, this.type, this.word});

  Results.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["lexicalEntries"] is List) {
      lexicalEntries = json["lexicalEntries"] == null
          ? null
          : (json["lexicalEntries"] as List)
              .map((e) => LexicalEntries.fromJson(e))
              .toList();
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["word"] is String) {
      word = json["word"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["language"] = language;
    if (lexicalEntries != null) {
      data["lexicalEntries"] = lexicalEntries?.map((e) => e.toJson()).toList();
    }
    data["type"] = type;
    data["word"] = word;
    return data;
  }
}

class LexicalEntries {
  List<Entries>? entries;
  String? language;
  LexicalCategory? lexicalCategory;
  List<Phrases>? phrases;
  String? text;

  LexicalEntries(
      {this.entries,
      this.language,
      this.lexicalCategory,
      this.phrases,
      this.text});

  LexicalEntries.fromJson(Map<String, dynamic> json) {
    if (json["entries"] is List) {
      entries = json["entries"] == null
          ? null
          : (json["entries"] as List).map((e) => Entries.fromJson(e)).toList();
    }
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["lexicalCategory"] is Map) {
      lexicalCategory = json["lexicalCategory"] == null
          ? null
          : LexicalCategory.fromJson(json["lexicalCategory"]);
    }
    if (json["phrases"] is List) {
      phrases = json["phrases"] == null
          ? null
          : (json["phrases"] as List).map((e) => Phrases.fromJson(e)).toList();
    }
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (entries != null) {
      data["entries"] = entries?.map((e) => e.toJson()).toList();
    }
    data["language"] = language;
    if (lexicalCategory != null) {
      data["lexicalCategory"] = lexicalCategory?.toJson();
    }
    if (phrases != null) {
      data["phrases"] = phrases?.map((e) => e.toJson()).toList();
    }
    data["text"] = text;
    return data;
  }
}

class Phrases {
  String? id;
  String? text;

  Phrases({this.id, this.text});

  Phrases.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["text"] = text;
    return data;
  }
}

class LexicalCategory {
  String? id;
  String? text;

  LexicalCategory({this.id, this.text});

  LexicalCategory.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["text"] = text;
    return data;
  }
}

class Entries {
  List<String>? etymologies;
  List<Pronunciations>? pronunciations;
  List<Senses>? senses;

  Entries({this.etymologies, this.pronunciations, this.senses});

  Entries.fromJson(Map<String, dynamic> json) {
    if (json["etymologies"] is List) {
      etymologies = json["etymologies"] == null
          ? null
          : List<String>.from(json["etymologies"]);
    }
    if (json["pronunciations"] is List) {
      pronunciations = json["pronunciations"] == null
          ? null
          : (json["pronunciations"] as List)
              .map((e) => Pronunciations.fromJson(e))
              .toList();
    }
    if (json["senses"] is List) {
      senses = json["senses"] == null
          ? null
          : (json["senses"] as List).map((e) => Senses.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (etymologies != null) {
      data["etymologies"] = etymologies;
    }
    if (pronunciations != null) {
      data["pronunciations"] = pronunciations?.map((e) => e.toJson()).toList();
    }
    if (senses != null) {
      data["senses"] = senses?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Senses {
  List<String>? definitions;
  List<DomainClasses>? domainClasses;
  List<Examples>? examples;
  String? id;
  List<Notes>? notes;
  List<SemanticClasses>? semanticClasses;
  List<String>? shortDefinitions;
  List<Subsenses>? subsenses;
  List<Synonyms1>? synonyms;
  List<ThesaurusLinks1>? thesaurusLinks;

  Senses(
      {this.definitions,
      this.domainClasses,
      this.examples,
      this.id,
      this.notes,
      this.semanticClasses,
      this.shortDefinitions,
      this.subsenses,
      this.synonyms,
      this.thesaurusLinks});

  Senses.fromJson(Map<String, dynamic> json) {
    if (json["definitions"] is List) {
      definitions = json["definitions"] == null
          ? null
          : List<String>.from(json["definitions"]);
    }
    if (json["domainClasses"] is List) {
      domainClasses = json["domainClasses"] == null
          ? null
          : (json["domainClasses"] as List)
              .map((e) => DomainClasses.fromJson(e))
              .toList();
    }
    if (json["examples"] is List) {
      examples = json["examples"] == null
          ? null
          : (json["examples"] as List)
              .map((e) => Examples.fromJson(e))
              .toList();
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["notes"] is List) {
      notes = json["notes"] == null
          ? null
          : (json["notes"] as List).map((e) => Notes.fromJson(e)).toList();
    }
    if (json["semanticClasses"] is List) {
      semanticClasses = json["semanticClasses"] == null
          ? null
          : (json["semanticClasses"] as List)
              .map((e) => SemanticClasses.fromJson(e))
              .toList();
    }
    if (json["shortDefinitions"] is List) {
      shortDefinitions = json["shortDefinitions"] == null
          ? null
          : List<String>.from(json["shortDefinitions"]);
    }
    if (json["subsenses"] is List) {
      subsenses = json["subsenses"] == null
          ? null
          : (json["subsenses"] as List)
              .map((e) => Subsenses.fromJson(e))
              .toList();
    }
    if (json["synonyms"] is List) {
      synonyms = json["synonyms"] == null
          ? null
          : (json["synonyms"] as List)
              .map((e) => Synonyms1.fromJson(e))
              .toList();
    }
    if (json["thesaurusLinks"] is List) {
      thesaurusLinks = json["thesaurusLinks"] == null
          ? null
          : (json["thesaurusLinks"] as List)
              .map((e) => ThesaurusLinks1.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (definitions != null) {
      data["definitions"] = definitions;
    }
    if (domainClasses != null) {
      data["domainClasses"] = domainClasses?.map((e) => e.toJson()).toList();
    }
    if (examples != null) {
      data["examples"] = examples?.map((e) => e.toJson()).toList();
    }
    data["id"] = id;
    if (notes != null) {
      data["notes"] = notes?.map((e) => e.toJson()).toList();
    }
    if (semanticClasses != null) {
      data["semanticClasses"] =
          semanticClasses?.map((e) => e.toJson()).toList();
    }
    if (shortDefinitions != null) {
      data["shortDefinitions"] = shortDefinitions;
    }
    if (subsenses != null) {
      data["subsenses"] = subsenses?.map((e) => e.toJson()).toList();
    }
    if (synonyms != null) {
      data["synonyms"] = synonyms?.map((e) => e.toJson()).toList();
    }
    if (thesaurusLinks != null) {
      data["thesaurusLinks"] = thesaurusLinks?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ThesaurusLinks1 {
  String? entryId;
  String? senseId;

  ThesaurusLinks1({this.entryId, this.senseId});

  ThesaurusLinks1.fromJson(Map<String, dynamic> json) {
    if (json["entry_id"] is String) {
      entryId = json["entry_id"];
    }
    if (json["sense_id"] is String) {
      senseId = json["sense_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["entry_id"] = entryId;
    data["sense_id"] = senseId;
    return data;
  }
}

class Synonyms1 {
  String? language;
  String? text;

  Synonyms1({this.language, this.text});

  Synonyms1.fromJson(Map<String, dynamic> json) {
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["language"] = language;
    data["text"] = text;
    return data;
  }
}

class Subsenses {
  List<String>? definitions;
  List<Examples1>? examples;
  String? id;
  List<Notes1>? notes;
  List<SemanticClasses1>? semanticClasses;
  List<String>? shortDefinitions;
  List<Synonyms>? synonyms;
  List<ThesaurusLinks>? thesaurusLinks;

  Subsenses(
      {this.definitions,
      this.examples,
      this.id,
      this.notes,
      this.semanticClasses,
      this.shortDefinitions,
      this.synonyms,
      this.thesaurusLinks});

  Subsenses.fromJson(Map<String, dynamic> json) {
    if (json["definitions"] is List) {
      definitions = json["definitions"] == null
          ? null
          : List<String>.from(json["definitions"]);
    }
    if (json["examples"] is List) {
      examples = json["examples"] == null
          ? null
          : (json["examples"] as List)
              .map((e) => Examples1.fromJson(e))
              .toList();
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["notes"] is List) {
      notes = json["notes"] == null
          ? null
          : (json["notes"] as List).map((e) => Notes1.fromJson(e)).toList();
    }
    if (json["semanticClasses"] is List) {
      semanticClasses = json["semanticClasses"] == null
          ? null
          : (json["semanticClasses"] as List)
              .map((e) => SemanticClasses1.fromJson(e))
              .toList();
    }
    if (json["shortDefinitions"] is List) {
      shortDefinitions = json["shortDefinitions"] == null
          ? null
          : List<String>.from(json["shortDefinitions"]);
    }
    if (json["synonyms"] is List) {
      synonyms = json["synonyms"] == null
          ? null
          : (json["synonyms"] as List)
              .map((e) => Synonyms.fromJson(e))
              .toList();
    }
    if (json["thesaurusLinks"] is List) {
      thesaurusLinks = json["thesaurusLinks"] == null
          ? null
          : (json["thesaurusLinks"] as List)
              .map((e) => ThesaurusLinks.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (definitions != null) {
      data["definitions"] = definitions;
    }
    if (examples != null) {
      data["examples"] = examples?.map((e) => e.toJson()).toList();
    }
    data["id"] = id;
    if (notes != null) {
      data["notes"] = notes?.map((e) => e.toJson()).toList();
    }
    if (semanticClasses != null) {
      data["semanticClasses"] =
          semanticClasses?.map((e) => e.toJson()).toList();
    }
    if (shortDefinitions != null) {
      data["shortDefinitions"] = shortDefinitions;
    }
    if (synonyms != null) {
      data["synonyms"] = synonyms?.map((e) => e.toJson()).toList();
    }
    if (thesaurusLinks != null) {
      data["thesaurusLinks"] = thesaurusLinks?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ThesaurusLinks {
  String? entryId;
  String? senseId;

  ThesaurusLinks({this.entryId, this.senseId});

  ThesaurusLinks.fromJson(Map<String, dynamic> json) {
    if (json["entry_id"] is String) {
      entryId = json["entry_id"];
    }
    if (json["sense_id"] is String) {
      senseId = json["sense_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["entry_id"] = entryId;
    data["sense_id"] = senseId;
    return data;
  }
}

class Synonyms {
  String? language;
  String? text;

  Synonyms({this.language, this.text});

  Synonyms.fromJson(Map<String, dynamic> json) {
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["language"] = language;
    data["text"] = text;
    return data;
  }
}

class SemanticClasses1 {
  String? id;
  String? text;

  SemanticClasses1({this.id, this.text});

  SemanticClasses1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["text"] = text;
    return data;
  }
}

class Notes1 {
  String? text;
  String? type;

  Notes1({this.text, this.type});

  Notes1.fromJson(Map<String, dynamic> json) {
    if (json["text"] is String) {
      text = json["text"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    data["type"] = type;
    return data;
  }
}

class Examples1 {
  String? text;

  Examples1({this.text});

  Examples1.fromJson(Map<String, dynamic> json) {
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    return data;
  }
}

class SemanticClasses {
  String? id;
  String? text;

  SemanticClasses({this.id, this.text});

  SemanticClasses.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["text"] = text;
    return data;
  }
}

class Notes {
  String? text;
  String? type;

  Notes({this.text, this.type});

  Notes.fromJson(Map<String, dynamic> json) {
    if (json["text"] is String) {
      text = json["text"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    data["type"] = type;
    return data;
  }
}

class Examples {
  String? text;

  Examples({this.text});

  Examples.fromJson(Map<String, dynamic> json) {
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    return data;
  }
}

class DomainClasses {
  String? id;
  String? text;

  DomainClasses({this.id, this.text});

  DomainClasses.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["text"] = text;
    return data;
  }
}

class Pronunciations {
  List<String>? dialects;
  String? phoneticNotation;
  String? phoneticSpelling;
  String? audioFile;

  Pronunciations(this.dialects, this.phoneticNotation, this.phoneticSpelling,
      this.audioFile);

  Pronunciations.fromJson(Map<String, dynamic> json) {
    if (json["audioFile"] is String) {
      audioFile = json["audioFile"];
    }
    if (json["dialects"] is List) {
      dialects =
          json["dialects"] == null ? null : List<String>.from(json["dialects"]);
    }
    if (json["phoneticNotation"] is String) {
      phoneticNotation = json["phoneticNotation"];
    }
    if (json["phoneticSpelling"] is String) {
      phoneticSpelling = json["phoneticSpelling"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dialects != null) {
      data["dialects"] = dialects;
    }
    data["phoneticNotation"] = phoneticNotation;
    data["phoneticSpelling"] = phoneticSpelling;
    return data;
  }
}

class Metadata {
  String? operation;
  String? provider;
  String? schema;

  Metadata({this.operation, this.provider, this.schema});

  Metadata.fromJson(Map<String, dynamic> json) {
    if (json["operation"] is String) {
      operation = json["operation"];
    }
    if (json["provider"] is String) {
      provider = json["provider"];
    }
    if (json["schema"] is String) {
      schema = json["schema"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["operation"] = operation;
    data["provider"] = provider;
    data["schema"] = schema;
    return data;
  }
}
