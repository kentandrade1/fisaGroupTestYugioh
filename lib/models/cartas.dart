// To parse this JSON data, do
//
//     final cartas = cartasFromMap(jsonString);

import 'dart:convert';

class Cartas {
  int id;
  String name;
  Type type;
  FrameType frameType;
  String desc;
  Race race;
  String? archetype;
  List<CardSet>? cardSets;
  List<CardImage> cardImages;
  List<CardPrice> cardPrices;
  int? atk;
  int? def;
  int? level;
  Attribute? attribute;
  int? scale;
  int? linkval;
  List<Linkmarker>? linkmarkers;
  BanlistInfo? banlistInfo;

  Cartas({
    required this.id,
    required this.name,
    required this.type,
    required this.frameType,
    required this.desc,
    required this.race,
    this.archetype,
    this.cardSets,
    required this.cardImages,
    required this.cardPrices,
    this.atk,
    this.def,
    this.level,
    this.attribute,
    this.scale,
    this.linkval,
    this.linkmarkers,
    this.banlistInfo,
  });

  factory Cartas.fromJson(String str) => Cartas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cartas.fromMap(Map<String, dynamic> json) => Cartas(
        id: json["id"],
        name: json["name"],
        type: typeValues.map[json["type"]]!,
        frameType: frameTypeValues.map[json["frameType"]]!,
        desc: json["desc"],
        race: raceValues.map[json["race"]]!,
        archetype: json["archetype"],
        cardSets: json["card_sets"] == null
            ? []
            : List<CardSet>.from(
                json["card_sets"]!.map((x) => CardSet.fromMap(x))),
        cardImages: List<CardImage>.from(
            json["card_images"].map((x) => CardImage.fromMap(x))),
        cardPrices: List<CardPrice>.from(
            json["card_prices"].map((x) => CardPrice.fromMap(x))),
        atk: json["atk"],
        def: json["def"],
        level: json["level"],
        attribute: attributeValues.map[json["attribute"]],
        scale: json["scale"],
        linkval: json["linkval"],
        linkmarkers: json["linkmarkers"] == null
            ? []
            : List<Linkmarker>.from(
                json["linkmarkers"]!.map((x) => linkmarkerValues.map[x]!)),
        banlistInfo: json["banlist_info"] == null
            ? null
            : BanlistInfo.fromMap(json["banlist_info"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "type": typeValues.reverse[type],
        "frameType": frameTypeValues.reverse[frameType],
        "desc": desc,
        "race": raceValues.reverse[race],
        "archetype": archetype,
        "card_sets": cardSets == null
            ? []
            : List<dynamic>.from(cardSets!.map((x) => x.toMap())),
        "card_images": List<dynamic>.from(cardImages.map((x) => x.toMap())),
        "card_prices": List<dynamic>.from(cardPrices.map((x) => x.toMap())),
        "atk": atk,
        "def": def,
        "level": level,
        "attribute": attributeValues.reverse[attribute],
        "scale": scale,
        "linkval": linkval,
        "linkmarkers": linkmarkers == null
            ? []
            : List<dynamic>.from(
                linkmarkers!.map((x) => linkmarkerValues.reverse[x])),
        "banlist_info": banlistInfo?.toMap(),
      };
}

enum Attribute { EARTH, WATER, WIND, DARK, LIGHT, FIRE, DIVINE }

final attributeValues = EnumValues({
  "DARK": Attribute.DARK,
  "DIVINE": Attribute.DIVINE,
  "EARTH": Attribute.EARTH,
  "FIRE": Attribute.FIRE,
  "LIGHT": Attribute.LIGHT,
  "WATER": Attribute.WATER,
  "WIND": Attribute.WIND
});

class BanlistInfo {
  String? banGoat;
  String? banTcg;
  String? banOcg;

  BanlistInfo({
    this.banGoat,
    this.banTcg,
    this.banOcg,
  });

  factory BanlistInfo.fromJson(String str) =>
      BanlistInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BanlistInfo.fromMap(Map<String, dynamic> json) => BanlistInfo(
        banGoat: json["ban_goat"],
        banTcg: json["ban_tcg"],
        banOcg: json["ban_ocg"],
      );

  Map<String, dynamic> toMap() => {
        "ban_goat": banGoat,
        "ban_tcg": banTcg,
        "ban_ocg": banOcg,
      };
}

enum Ban { SEMI_LIMITED, LIMITED, BANNED }

final banValues = EnumValues({
  "Banned": Ban.BANNED,
  "Limited": Ban.LIMITED,
  "Semi-Limited": Ban.SEMI_LIMITED
});

class CardImage {
  int id;
  String imageUrl;
  String imageUrlSmall;
  String imageUrlCropped;

  CardImage({
    required this.id,
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.imageUrlCropped,
  });

  factory CardImage.fromJson(String str) => CardImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardImage.fromMap(Map<String, dynamic> json) => CardImage(
        id: json["id"],
        imageUrl: json["image_url"],
        imageUrlSmall: json["image_url_small"],
        imageUrlCropped: json["image_url_cropped"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image_url": imageUrl,
        "image_url_small": imageUrlSmall,
        "image_url_cropped": imageUrlCropped,
      };
}

class CardPrice {
  String cardmarketPrice;
  String tcgplayerPrice;
  String ebayPrice;
  String amazonPrice;
  String coolstuffincPrice;

  CardPrice({
    required this.cardmarketPrice,
    required this.tcgplayerPrice,
    required this.ebayPrice,
    required this.amazonPrice,
    required this.coolstuffincPrice,
  });

  factory CardPrice.fromJson(String str) => CardPrice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardPrice.fromMap(Map<String, dynamic> json) => CardPrice(
        cardmarketPrice: json["cardmarket_price"],
        tcgplayerPrice: json["tcgplayer_price"],
        ebayPrice: json["ebay_price"],
        amazonPrice: json["amazon_price"],
        coolstuffincPrice: json["coolstuffinc_price"],
      );

  Map<String, dynamic> toMap() => {
        "cardmarket_price": cardmarketPrice,
        "tcgplayer_price": tcgplayerPrice,
        "ebay_price": ebayPrice,
        "amazon_price": amazonPrice,
        "coolstuffinc_price": coolstuffincPrice,
      };
}

class CardSet {
  String setName;
  String setCode;
  SetRarity setRarity;
  SetRarityCode setRarityCode;
  String setPrice;

  CardSet({
    required this.setName,
    required this.setCode,
    required this.setRarity,
    required this.setRarityCode,
    required this.setPrice,
  });

  factory CardSet.fromJson(String str) => CardSet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardSet.fromMap(Map<String, dynamic> json) => CardSet(
        setName: json["set_name"],
        setCode: json["set_code"],
        setRarity: setRarityValues.map[json["set_rarity"]]!,
        setRarityCode: setRarityCodeValues.map[json["set_rarity_code"]]!,
        setPrice: json["set_price"],
      );

  Map<String, dynamic> toMap() => {
        "set_name": setName,
        "set_code": setCode,
        "set_rarity": setRarityValues.reverse[setRarity],
        "set_rarity_code": setRarityCodeValues.reverse[setRarityCode],
        "set_price": setPrice,
      };
}

enum SetRarity {
  COMMON,
  SUPER_RARE,
  RARE,
  ULTRA_RARE,
  SHORT_PRINT,
  SHATTERFOIL_RARE,
  DUEL_TERMINAL_NORMAL_PARALLEL_RARE,
  ULTIMATE_RARE,
  SECRET_RARE,
  MOSAIC_RARE,
  GOLD_SECRET_RARE,
  GOLD_RARE,
  STARFOIL_RARE,
  COLLECTOR_S_RARE,
  STARLIGHT_RARE,
  PREMIUM_GOLD_RARE,
  PRISMATIC_SECRET_RARE,
  STARFOIL,
  DUEL_TERMINAL_RARE_PARALLEL_RARE,
  DUEL_TERMINAL_SUPER_PARALLEL_RARE,
  DUEL_TERMINAL_ULTRA_PARALLEL_RARE,
  EXTRA_SECRET_RARE,
  GHOST_RARE,
  NORMAL_PARALLEL_RARE,
  QC_SC_R,
  PLATINUM_RARE,
  ULTRA_PARALLEL_RARE,
  ULTRA_RARE_PHARAOH_S_RARE,
  GHOST_GOLD_RARE,
  QUARTER_CENTURY_SECRET_RARE,
  PLATINUM_SECRET_RARE,
  SUPER_SHORT_PRINT,
  SUPER_PARALLEL_RARE,
  ULTRA_SECRET_RARE,
  C,
  EXTRA_SECRET,
  DUEL_TERMINAL_NORMAL_RARE_PARALLEL_RARE,
  THE_10000_SECRET_RARE
}

final setRarityValues = EnumValues({
  "c": SetRarity.C,
  "Collector's Rare": SetRarity.COLLECTOR_S_RARE,
  "Common": SetRarity.COMMON,
  "Duel Terminal Normal Parallel Rare":
      SetRarity.DUEL_TERMINAL_NORMAL_PARALLEL_RARE,
  "Duel Terminal Normal Rare Parallel Rare":
      SetRarity.DUEL_TERMINAL_NORMAL_RARE_PARALLEL_RARE,
  "Duel Terminal Rare Parallel Rare":
      SetRarity.DUEL_TERMINAL_RARE_PARALLEL_RARE,
  "Duel Terminal Super Parallel Rare":
      SetRarity.DUEL_TERMINAL_SUPER_PARALLEL_RARE,
  "Duel Terminal Ultra Parallel Rare":
      SetRarity.DUEL_TERMINAL_ULTRA_PARALLEL_RARE,
  "Extra Secret": SetRarity.EXTRA_SECRET,
  "Extra Secret Rare": SetRarity.EXTRA_SECRET_RARE,
  "Ghost/Gold Rare": SetRarity.GHOST_GOLD_RARE,
  "Ghost Rare": SetRarity.GHOST_RARE,
  "Gold Rare": SetRarity.GOLD_RARE,
  "Gold Secret Rare": SetRarity.GOLD_SECRET_RARE,
  "Mosaic Rare": SetRarity.MOSAIC_RARE,
  "Normal Parallel Rare": SetRarity.NORMAL_PARALLEL_RARE,
  "Platinum Rare": SetRarity.PLATINUM_RARE,
  "Platinum Secret Rare": SetRarity.PLATINUM_SECRET_RARE,
  "Premium Gold Rare": SetRarity.PREMIUM_GOLD_RARE,
  "Prismatic Secret Rare": SetRarity.PRISMATIC_SECRET_RARE,
  "QCScR": SetRarity.QC_SC_R,
  "Quarter Century Secret Rare": SetRarity.QUARTER_CENTURY_SECRET_RARE,
  "Rare": SetRarity.RARE,
  "Secret Rare": SetRarity.SECRET_RARE,
  "Shatterfoil Rare": SetRarity.SHATTERFOIL_RARE,
  "Short Print": SetRarity.SHORT_PRINT,
  "Starfoil": SetRarity.STARFOIL,
  "Starfoil Rare": SetRarity.STARFOIL_RARE,
  "Starlight Rare": SetRarity.STARLIGHT_RARE,
  "Super Parallel Rare": SetRarity.SUPER_PARALLEL_RARE,
  "Super Rare": SetRarity.SUPER_RARE,
  "Super Short Print": SetRarity.SUPER_SHORT_PRINT,
  "10000 Secret Rare": SetRarity.THE_10000_SECRET_RARE,
  "Ultimate Rare": SetRarity.ULTIMATE_RARE,
  "Ultra Parallel Rare": SetRarity.ULTRA_PARALLEL_RARE,
  "Ultra Rare": SetRarity.ULTRA_RARE,
  "Ultra Rare (Pharaoh's Rare)": SetRarity.ULTRA_RARE_PHARAOH_S_RARE,
  "Ultra Secret Rare": SetRarity.ULTRA_SECRET_RARE
});

enum SetRarityCode {
  C,
  SR,
  R,
  UR,
  SP,
  SHR,
  DNPR,
  UT_R,
  SC_R,
  MSR,
  G_SC_R,
  GUR,
  SFR,
  CR,
  ST_R,
  PG,
  P_SC_R,
  EMPTY,
  DRPR,
  DSPR,
  DUPR,
  GR,
  PIR,
  UPR,
  GGR,
  PS,
  SSP,
  SPR,
  U_SC_R,
  THE_10000_SC_R
}

final setRarityCodeValues = EnumValues({
  "(C)": SetRarityCode.C,
  "(CR)": SetRarityCode.CR,
  "(DNPR)": SetRarityCode.DNPR,
  "(DRPR)": SetRarityCode.DRPR,
  "(DSPR)": SetRarityCode.DSPR,
  "(DUPR)": SetRarityCode.DUPR,
  "": SetRarityCode.EMPTY,
  "(GGR)": SetRarityCode.GGR,
  "(GR)": SetRarityCode.GR,
  "(GUR)": SetRarityCode.GUR,
  "(GScR)": SetRarityCode.G_SC_R,
  "(MSR)": SetRarityCode.MSR,
  "(PG)": SetRarityCode.PG,
  "(PIR)": SetRarityCode.PIR,
  "(PS)": SetRarityCode.PS,
  "(PScR)": SetRarityCode.P_SC_R,
  "(R)": SetRarityCode.R,
  "(ScR)": SetRarityCode.SC_R,
  "(SFR)": SetRarityCode.SFR,
  "(SHR)": SetRarityCode.SHR,
  "(SP)": SetRarityCode.SP,
  "(SPR)": SetRarityCode.SPR,
  "(SR)": SetRarityCode.SR,
  "(SSP)": SetRarityCode.SSP,
  "(StR)": SetRarityCode.ST_R,
  "(10000ScR)": SetRarityCode.THE_10000_SC_R,
  "(UPR)": SetRarityCode.UPR,
  "(UR)": SetRarityCode.UR,
  "(UtR)": SetRarityCode.UT_R,
  "(UScR)": SetRarityCode.U_SC_R
});

enum FrameType {
  SPELL,
  EFFECT,
  NORMAL,
  TRAP,
  FUSION,
  EFFECT_PENDULUM,
  LINK,
  XYZ,
  SYNCHRO,
  RITUAL,
  SKILL,
  TOKEN,
  FUSION_PENDULUM,
  NORMAL_PENDULUM,
  SYNCHRO_PENDULUM,
  XYZ_PENDULUM,
  RITUAL_PENDULUM
}

final frameTypeValues = EnumValues({
  "effect": FrameType.EFFECT,
  "effect_pendulum": FrameType.EFFECT_PENDULUM,
  "fusion": FrameType.FUSION,
  "fusion_pendulum": FrameType.FUSION_PENDULUM,
  "link": FrameType.LINK,
  "normal": FrameType.NORMAL,
  "normal_pendulum": FrameType.NORMAL_PENDULUM,
  "ritual": FrameType.RITUAL,
  "ritual_pendulum": FrameType.RITUAL_PENDULUM,
  "skill": FrameType.SKILL,
  "spell": FrameType.SPELL,
  "synchro": FrameType.SYNCHRO,
  "synchro_pendulum": FrameType.SYNCHRO_PENDULUM,
  "token": FrameType.TOKEN,
  "trap": FrameType.TRAP,
  "xyz": FrameType.XYZ,
  "xyz_pendulum": FrameType.XYZ_PENDULUM
});

enum Linkmarker {
  BOTTOM,
  BOTTOM_LEFT,
  BOTTOM_RIGHT,
  TOP,
  LEFT,
  RIGHT,
  TOP_RIGHT,
  TOP_LEFT
}

final linkmarkerValues = EnumValues({
  "Bottom": Linkmarker.BOTTOM,
  "Bottom-Left": Linkmarker.BOTTOM_LEFT,
  "Bottom-Right": Linkmarker.BOTTOM_RIGHT,
  "Left": Linkmarker.LEFT,
  "Right": Linkmarker.RIGHT,
  "Top": Linkmarker.TOP,
  "Top-Left": Linkmarker.TOP_LEFT,
  "Top-Right": Linkmarker.TOP_RIGHT
});

enum Race {
  CONTINUOUS,
  QUICK_PLAY,
  EQUIP,
  NORMAL,
  BEAST,
  AQUA,
  INSECT,
  FISH,
  FIELD,
  SPELLCASTER,
  MACHINE,
  RITUAL,
  WARRIOR,
  FIEND,
  BEAST_WARRIOR,
  DINOSAUR,
  ROCK,
  FAIRY,
  DRAGON,
  SEA_SERPENT,
  PLANT,
  CYBERSE,
  COUNTER,
  WINGED_BEAST,
  WYRM,
  PYRO,
  REPTILE,
  ZOMBIE,
  PSYCHIC,
  DR_VELLIAN_C,
  ABIDOS_THE_TH,
  THUNDER,
  TITAN,
  CHAZZ_PRINCET,
  MAI,
  KEITH,
  YAMI_YUGI,
  KAIBA,
  PARADOX_BROTH,
  EMPTY,
  AXEL_BRODIE,
  BONZ,
  MAKO,
  BASTION_MISAW,
  CHUMLEY_HUFFI,
  ILLUSIONIST,
  ADRIAN_GECKO,
  WEEVIL,
  THELONIOUS_VI,
  YUBEL,
  JESSE_ANDERSO,
  ALEXIS_RHODES,
  ZANE_TRUESDAL,
  THE_SUPREME_K,
  CAMULA,
  YUGI,
  DAVID,
  REX,
  NIGHTSHROUD,
  ODION,
  CHRISTINE,
  ISHIZU,
  JOEY,
  JADEN_YUKI,
  YAMI_MARIK,
  CREATOR_GOD,
  JOEY_WHEELER,
  TYRANNO_HASSL,
  YAMI_BAKURA,
  PEGASUS,
  ESPA_ROBA,
  SETO_KAIBA,
  ASTER_PHOENIX,
  ANDREW,
  ARKANA,
  MAI_VALENTINE,
  DON_ZALOOG,
  DIVINE_BEAST,
  TANIA,
  SYRUS_TRUESDA,
  TEA_GARDNER,
  AMNAEL,
  ISHIZU_ISHTAR,
  EMMA,
  LUMIS_UMBRA,
  LUMIS_AND_UMB,
  ILLUSION,
  KAGEMARU
}

final raceValues = EnumValues({
  "Abidos the Th": Race.ABIDOS_THE_TH,
  "Adrian Gecko": Race.ADRIAN_GECKO,
  "Alexis Rhodes": Race.ALEXIS_RHODES,
  "Amnael": Race.AMNAEL,
  "Andrew": Race.ANDREW,
  "Aqua": Race.AQUA,
  "Arkana": Race.ARKANA,
  "Aster Phoenix": Race.ASTER_PHOENIX,
  "Axel Brodie": Race.AXEL_BRODIE,
  "Bastion Misaw": Race.BASTION_MISAW,
  "Beast": Race.BEAST,
  "Beast-Warrior": Race.BEAST_WARRIOR,
  "Bonz": Race.BONZ,
  "Camula": Race.CAMULA,
  "Chazz Princet": Race.CHAZZ_PRINCET,
  "Christine": Race.CHRISTINE,
  "Chumley Huffi": Race.CHUMLEY_HUFFI,
  "Continuous": Race.CONTINUOUS,
  "Counter": Race.COUNTER,
  "Creator-God": Race.CREATOR_GOD,
  "Cyberse": Race.CYBERSE,
  "David": Race.DAVID,
  "Dinosaur": Race.DINOSAUR,
  "Divine-Beast": Race.DIVINE_BEAST,
  "Don Zaloog": Race.DON_ZALOOG,
  "Dragon": Race.DRAGON,
  "Dr. Vellian C": Race.DR_VELLIAN_C,
  "Emma": Race.EMMA,
  "": Race.EMPTY,
  "Equip": Race.EQUIP,
  "Espa Roba": Race.ESPA_ROBA,
  "Fairy": Race.FAIRY,
  "Field": Race.FIELD,
  "Fiend": Race.FIEND,
  "Fish": Race.FISH,
  "Illusion": Race.ILLUSION,
  "Illusionist": Race.ILLUSIONIST,
  "Insect": Race.INSECT,
  "Ishizu": Race.ISHIZU,
  "Ishizu Ishtar": Race.ISHIZU_ISHTAR,
  "Jaden Yuki": Race.JADEN_YUKI,
  "Jesse Anderso": Race.JESSE_ANDERSO,
  "Joey": Race.JOEY,
  "Joey Wheeler": Race.JOEY_WHEELER,
  "Kagemaru": Race.KAGEMARU,
  "Kaiba": Race.KAIBA,
  "Keith": Race.KEITH,
  "Lumis and Umb": Race.LUMIS_AND_UMB,
  "Lumis Umbra": Race.LUMIS_UMBRA,
  "Machine": Race.MACHINE,
  "Mai": Race.MAI,
  "Mai Valentine": Race.MAI_VALENTINE,
  "Mako": Race.MAKO,
  "Nightshroud": Race.NIGHTSHROUD,
  "Normal": Race.NORMAL,
  "Odion": Race.ODION,
  "Paradox Broth": Race.PARADOX_BROTH,
  "Pegasus": Race.PEGASUS,
  "Plant": Race.PLANT,
  "Psychic": Race.PSYCHIC,
  "Pyro": Race.PYRO,
  "Quick-Play": Race.QUICK_PLAY,
  "Reptile": Race.REPTILE,
  "Rex": Race.REX,
  "Ritual": Race.RITUAL,
  "Rock": Race.ROCK,
  "Sea Serpent": Race.SEA_SERPENT,
  "Seto Kaiba": Race.SETO_KAIBA,
  "Spellcaster": Race.SPELLCASTER,
  "Syrus Truesda": Race.SYRUS_TRUESDA,
  "Tania": Race.TANIA,
  "Tea Gardner": Race.TEA_GARDNER,
  "Thelonious Vi": Race.THELONIOUS_VI,
  "The Supreme K": Race.THE_SUPREME_K,
  "Thunder": Race.THUNDER,
  "Titan": Race.TITAN,
  "Tyranno Hassl": Race.TYRANNO_HASSL,
  "Warrior": Race.WARRIOR,
  "Weevil": Race.WEEVIL,
  "Winged Beast": Race.WINGED_BEAST,
  "Wyrm": Race.WYRM,
  "Yami Bakura": Race.YAMI_BAKURA,
  "Yami Marik": Race.YAMI_MARIK,
  "Yami Yugi": Race.YAMI_YUGI,
  "Yubel": Race.YUBEL,
  "Yugi": Race.YUGI,
  "Zane Truesdal": Race.ZANE_TRUESDAL,
  "Zombie": Race.ZOMBIE
});

enum Type {
  SPELL_CARD,
  EFFECT_MONSTER,
  NORMAL_MONSTER,
  FLIP_EFFECT_MONSTER,
  TRAP_CARD,
  UNION_EFFECT_MONSTER,
  FUSION_MONSTER,
  PENDULUM_EFFECT_MONSTER,
  LINK_MONSTER,
  XYZ_MONSTER,
  SYNCHRO_MONSTER,
  SYNCHRO_TUNER_MONSTER,
  TUNER_MONSTER,
  GEMINI_MONSTER,
  NORMAL_TUNER_MONSTER,
  SPIRIT_MONSTER,
  RITUAL_EFFECT_MONSTER,
  SKILL_CARD,
  TOKEN,
  PENDULUM_EFFECT_FUSION_MONSTER,
  RITUAL_MONSTER,
  TOON_MONSTER,
  PENDULUM_NORMAL_MONSTER,
  SYNCHRO_PENDULUM_EFFECT_MONSTER,
  PENDULUM_TUNER_EFFECT_MONSTER,
  XYZ_PENDULUM_EFFECT_MONSTER,
  PENDULUM_EFFECT_RITUAL_MONSTER,
  PENDULUM_FLIP_EFFECT_MONSTER
}

final typeValues = EnumValues({
  "Effect Monster": Type.EFFECT_MONSTER,
  "Flip Effect Monster": Type.FLIP_EFFECT_MONSTER,
  "Fusion Monster": Type.FUSION_MONSTER,
  "Gemini Monster": Type.GEMINI_MONSTER,
  "Link Monster": Type.LINK_MONSTER,
  "Normal Monster": Type.NORMAL_MONSTER,
  "Normal Tuner Monster": Type.NORMAL_TUNER_MONSTER,
  "Pendulum Effect Fusion Monster": Type.PENDULUM_EFFECT_FUSION_MONSTER,
  "Pendulum Effect Monster": Type.PENDULUM_EFFECT_MONSTER,
  "Pendulum Effect Ritual Monster": Type.PENDULUM_EFFECT_RITUAL_MONSTER,
  "Pendulum Flip Effect Monster": Type.PENDULUM_FLIP_EFFECT_MONSTER,
  "Pendulum Normal Monster": Type.PENDULUM_NORMAL_MONSTER,
  "Pendulum Tuner Effect Monster": Type.PENDULUM_TUNER_EFFECT_MONSTER,
  "Ritual Effect Monster": Type.RITUAL_EFFECT_MONSTER,
  "Ritual Monster": Type.RITUAL_MONSTER,
  "Skill Card": Type.SKILL_CARD,
  "Spell Card": Type.SPELL_CARD,
  "Spirit Monster": Type.SPIRIT_MONSTER,
  "Synchro Monster": Type.SYNCHRO_MONSTER,
  "Synchro Pendulum Effect Monster": Type.SYNCHRO_PENDULUM_EFFECT_MONSTER,
  "Synchro Tuner Monster": Type.SYNCHRO_TUNER_MONSTER,
  "Token": Type.TOKEN,
  "Toon Monster": Type.TOON_MONSTER,
  "Trap Card": Type.TRAP_CARD,
  "Tuner Monster": Type.TUNER_MONSTER,
  "Union Effect Monster": Type.UNION_EFFECT_MONSTER,
  "XYZ Monster": Type.XYZ_MONSTER,
  "XYZ Pendulum Effect Monster": Type.XYZ_PENDULUM_EFFECT_MONSTER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
