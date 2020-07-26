class PokeHub {
  List<Pokemon> pokemon;
  List<Pokemons> pokemons;

  PokeHub(
      {
        this.pokemon
      }
      );

  PokeHub.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = new List<Pokemon>();
      json['pokemon'].forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }

  PokeHub.fromJson2(List json) {
    if (json!= null) {
      pokemons = new List<Pokemons>();
      json.forEach((v) {
        pokemons.add(new Pokemons.fromJson(v));
      });
    }
  }

}

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  String spawnChance;
  String avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<NextEvolution> nextEvolution;

  Pokemon(
      {this.id,
        this.num,
        this.name,
        this.img,
        this.type,
        this.height,
        this.weight,
        this.candy,
        this.candyCount,
        this.egg,
        this.spawnChance,
        this.avgSpawns,
        this.spawnTime,
        this.multipliers,
        this.weaknesses,
        this.nextEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'];
    egg = json['egg'];
    spawnChance = json['spawn_chance'].toString();
    avgSpawns = json['avg_spawns'].toString();
    spawnTime = json['spawn_time'];
    multipliers = json['multipliers']?.cast<double>();
    weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = new List<NextEvolution>();
      json['next_evolution'].forEach((v) {
        nextEvolution.add(new NextEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.num;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['candy'] = this.candy;
    data['candy_count'] = this.candyCount;
    data['egg'] = this.egg;
    data['spawn_chance'] = this.spawnChance;
    data['avg_spawns'] = this.avgSpawns;
    data['spawn_time'] = this.spawnTime;
    data['multipliers'] = this.multipliers;
    data['weaknesses'] = this.weaknesses;
    if (this.nextEvolution != null) {
      data['next_evolution'] =
          this.nextEvolution.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NextEvolution {
  String num;
  String name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }
}

class Pokemons {
  int id;
  Name name;
  List<String> type;
  Base base;

  Pokemons({this.id, this.name, this.type, this.base});

  Pokemons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    type = json['type'].cast<String>();
    base = json['base'] != null ? new Base.fromJson(json['base']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['type'] = this.type;
    if (this.base != null) {
      data['base'] = this.base.toJson();
    }
    return data;
  }

  String getIdToString() {
    return id.toString().padLeft(3, '0');
  }

}

class Name {
  String english;
  String japanese;
  String chinese;
  String french;

  Name({this.english, this.japanese, this.chinese, this.french});

  Name.fromJson(Map<String, dynamic> json) {
    english = json['english'];
    japanese = json['japanese'];
    chinese = json['chinese'];
    french = json['french'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['english'] = this.english;
    data['japanese'] = this.japanese;
    data['chinese'] = this.chinese;
    data['french'] = this.french;
    return data;
  }
}

class Base {
  int hP;
  int attack;
  int defense;
  int spAttack;
  int spDefense;
  int speed;

  Base(
      {this.hP,
        this.attack,
        this.defense,
        this.spAttack,
        this.spDefense,
        this.speed});

  Base.fromJson(Map<String, dynamic> json) {
    hP = json['HP'];
    attack = json['Attack'];
    defense = json['Defense'];
    spAttack = json['Sp. Attack'];
    spDefense = json['Sp. Defense'];
    speed = json['Speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HP'] = this.hP;
    data['Attack'] = this.attack;
    data['Defense'] = this.defense;
    data['Sp. Attack'] = this.spAttack;
    data['Sp. Defense'] = this.spDefense;
    data['Speed'] = this.speed;
    return data;
  }
}