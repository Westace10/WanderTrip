// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromJson(jsonString);

import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) =>
    List<CountriesModel>.from(
        json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Languages? languages;
  Translations? translations;
  List<double>? latlng;
  bool? landlocked;
  List<String>? borders;
  double? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  int? population;
  Gini? gini;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  CoatOfArms? coatOfArms;
  String? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;

  CountriesModel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.gini,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.postalCode,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        tld: json["tld"] == null
            ? []
            : List<String>.from(json["tld"]!.map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"],
        status: json["status"],
        unMember: json["unMember"],
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromJson(json["currencies"]),
        idd: json["idd"] == null ? null : Idd.fromJson(json["idd"]),
        capital: json["capital"] == null
            ? []
            : List<String>.from(json["capital"]!.map((x) => x)),
        altSpellings: json["altSpellings"] == null
            ? []
            : List<String>.from(json["altSpellings"]!.map((x) => x)),
        region: json["region"],
        subregion: json["subregion"],
        languages: json["languages"] == null
            ? null
            : Languages.fromJson(json["languages"]),
        translations: json["translations"] == null
            ? null
            : Translations.fromJson(json["translations"]),
        latlng: json["latlng"] == null
            ? []
            : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
        landlocked: json["landlocked"],
        borders: json["borders"] == null
            ? []
            : List<String>.from(json["borders"]!.map((x) => x)),
        area: json["area"]?.toDouble(),
        demonyms: json["demonyms"] == null
            ? null
            : Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: json["maps"] == null ? null : Maps.fromJson(json["maps"]),
        population: json["population"],
        gini: json["gini"] == null ? null : Gini.fromJson(json["gini"]),
        fifa: json["fifa"],
        car: json["car"] == null ? null : Car.fromJson(json["car"]),
        timezones: json["timezones"] == null
            ? []
            : List<String>.from(json["timezones"]!.map((x) => x)),
        continents: json["continents"] == null
            ? []
            : List<String>.from(json["continents"]!.map((x) => x)),
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        coatOfArms: json["coatOfArms"] == null
            ? null
            : CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: json["startOfWeek"],
        capitalInfo: json["capitalInfo"] == null
            ? null
            : CapitalInfo.fromJson(json["capitalInfo"]),
        postalCode: json["postalCode"] == null
            ? null
            : PostalCode.fromJson(json["postalCode"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "tld": tld == null ? [] : List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": status,
        "unMember": unMember,
        "currencies": currencies?.toJson(),
        "idd": idd?.toJson(),
        "capital":
            capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "altSpellings": altSpellings == null
            ? []
            : List<dynamic>.from(altSpellings!.map((x) => x)),
        "region": region,
        "subregion": subregion,
        "languages": languages?.toJson(),
        "translations": translations?.toJson(),
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
        "landlocked": landlocked,
        "borders":
            borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
        "area": area,
        "demonyms": demonyms?.toJson(),
        "flag": flag,
        "maps": maps?.toJson(),
        "population": population,
        "gini": gini?.toJson(),
        "fifa": fifa,
        "car": car?.toJson(),
        "timezones": timezones == null
            ? []
            : List<dynamic>.from(timezones!.map((x) => x)),
        "continents": continents == null
            ? []
            : List<dynamic>.from(continents!.map((x) => x)),
        "flags": flags?.toJson(),
        "coatOfArms": coatOfArms?.toJson(),
        "startOfWeek": startOfWeek,
        "capitalInfo": capitalInfo?.toJson(),
        "postalCode": postalCode?.toJson(),
      };
}

class CapitalInfo {
  List<double>? latlng;

  CapitalInfo({
    this.latlng,
  });

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null
            ? []
            : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
      };
}

class Car {
  List<String>? signs;
  String? side;

  Car({
    this.signs,
    this.side,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null
            ? []
            : List<String>.from(json["signs"]!.map((x) => x)),
        side: json["side"],
      );

  Map<String, dynamic> toJson() => {
        "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
        "side": side,
      };
}

class CoatOfArms {
  String? png;
  String? svg;

  CoatOfArms({
    this.png,
    this.svg,
  });

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

class Currencies {
  Aed? jod;
  Aed? usd;
  Aed? rsd;
  Aed? eur;
  Aed? bmd;
  Aed? bob;
  Aed? lyd;
  Aed? xof;
  Aed? amd;
  Aed? mur;
  Aed? mvr;
  Aed? mkd;
  Aed? etb;
  Aed? dkk;
  Aed? iqd;
  Aed? gtq;
  Aed? ttd;
  Aed? pen;
  Aed? srd;
  Aed? sek;
  Aed? xpf;
  Aed? fkp;
  Aed? zwl;
  Aed? sar;
  Aed? aed;
  Aed? afn;
  Aed? xaf;
  Aed? pab;
  Aed? syp;
  Aed? vuv;
  Aed? hnl;
  Aed? aud;
  Aed? kid;
  Aed? clp;
  Aed? xcd;
  Aed? mxn;
  Aed? cny;
  Aed? ssp;
  Aed? szl;
  Aed? zar;
  Aed? uzs;
  Aed? idr;
  Aed? pyg;
  Aed? pln;
  Bam? bam;
  Aed? cad;
  Aed? brl;
  Aed? mru;
  Aed? ils;
  Aed? ang;
  Aed? bnd;
  Aed? sgd;
  Aed? aoa;
  Aed? byn;
  Aed? currenciesTry;
  Aed? gip;
  Aed? btn;
  Aed? inr;
  Aed? ves;
  Aed? qar;
  Aed? czk;
  Aed? kwd;
  Aed? nzd;
  Aed? jmd;
  Aed? kyd;
  Aed? pkr;
  Aed? kzt;
  Aed? bhd;
  Aed? fjd;
  Aed? isk;
  Aed? mmk;
  Aed? bdt;
  Aed? php;
  Aed? npr;
  Aed? yer;
  Aed? krw;
  Aed? omr;
  Aed? ern;
  Aed? irr;
  Aed? tzs;
  Aed? sbd;
  Aed? kes;
  Aed? dop;
  Aed? gbp;
  Aed? ggp;
  Aed? rwf;
  Aed? tvd;
  Aed? twd;
  Aed? gyd;
  Aed? scr;
  Aed? kpw;
  Aed? bwp;
  Aed? khr;
  Aed? bbd;
  Aed? cop;
  Aed? uah;
  Aed? nad;
  Aed? top;
  Aed? ars;
  Aed? crc;
  Aed? ghs;
  Aed? shp;
  Aed? egp;
  Aed? cuc;
  Aed? cup;
  Aed? huf;
  Aed? bzd;
  Aed? bsd;
  Aed? awg;
  Aed? stn;
  Aed? rub;
  Aed? fok;
  Aed? nio;
  Aed? tnd;
  Aed? cdf;
  Aed? nok;
  Aed? sll;
  Aed? lsl;
  Aed? djf;
  Aed? lkr;
  Aed? wst;
  Aed? tmt;
  Aed? mdl;
  Aed? chf;
  Aed? mwk;
  Aed? lbp;
  Aed? mnt;
  Aed? thb;
  Aed? ngn;
  Aed? cve;
  Aed? jep;
  Aed? dzd;
  Aed? lak;
  Aed? azn;
  Aed? mad;
  Aed? bgn;
  Aed? bif;
  Aed? ugx;
  Aed? mzn;
  Aed? gel;
  Aed? ron;
  Aed? vnd;
  Aed? jpy;
  Aed? lrd;
  Aed? htg;
  Aed? pgk;
  Aed? hkd;
  Aed? kgs;
  Aed? mga;
  Aed? gmd;
  Aed? myr;
  Aed? sos;
  Aed? mop;
  Aed? all;
  Aed? zmw;
  Aed? ckd;
  Aed? gnf;
  Aed? kmf;
  Aed? imp;
  Bam? sdg;
  Aed? tjs;
  Aed? uyu;

  Currencies({
    this.jod,
    this.usd,
    this.rsd,
    this.eur,
    this.bmd,
    this.bob,
    this.lyd,
    this.xof,
    this.amd,
    this.mur,
    this.mvr,
    this.mkd,
    this.etb,
    this.dkk,
    this.iqd,
    this.gtq,
    this.ttd,
    this.pen,
    this.srd,
    this.sek,
    this.xpf,
    this.fkp,
    this.zwl,
    this.sar,
    this.aed,
    this.afn,
    this.xaf,
    this.pab,
    this.syp,
    this.vuv,
    this.hnl,
    this.aud,
    this.kid,
    this.clp,
    this.xcd,
    this.mxn,
    this.cny,
    this.ssp,
    this.szl,
    this.zar,
    this.uzs,
    this.idr,
    this.pyg,
    this.pln,
    this.bam,
    this.cad,
    this.brl,
    this.mru,
    this.ils,
    this.ang,
    this.bnd,
    this.sgd,
    this.aoa,
    this.byn,
    this.currenciesTry,
    this.gip,
    this.btn,
    this.inr,
    this.ves,
    this.qar,
    this.czk,
    this.kwd,
    this.nzd,
    this.jmd,
    this.kyd,
    this.pkr,
    this.kzt,
    this.bhd,
    this.fjd,
    this.isk,
    this.mmk,
    this.bdt,
    this.php,
    this.npr,
    this.yer,
    this.krw,
    this.omr,
    this.ern,
    this.irr,
    this.tzs,
    this.sbd,
    this.kes,
    this.dop,
    this.gbp,
    this.ggp,
    this.rwf,
    this.tvd,
    this.twd,
    this.gyd,
    this.scr,
    this.kpw,
    this.bwp,
    this.khr,
    this.bbd,
    this.cop,
    this.uah,
    this.nad,
    this.top,
    this.ars,
    this.crc,
    this.ghs,
    this.shp,
    this.egp,
    this.cuc,
    this.cup,
    this.huf,
    this.bzd,
    this.bsd,
    this.awg,
    this.stn,
    this.rub,
    this.fok,
    this.nio,
    this.tnd,
    this.cdf,
    this.nok,
    this.sll,
    this.lsl,
    this.djf,
    this.lkr,
    this.wst,
    this.tmt,
    this.mdl,
    this.chf,
    this.mwk,
    this.lbp,
    this.mnt,
    this.thb,
    this.ngn,
    this.cve,
    this.jep,
    this.dzd,
    this.lak,
    this.azn,
    this.mad,
    this.bgn,
    this.bif,
    this.ugx,
    this.mzn,
    this.gel,
    this.ron,
    this.vnd,
    this.jpy,
    this.lrd,
    this.htg,
    this.pgk,
    this.hkd,
    this.kgs,
    this.mga,
    this.gmd,
    this.myr,
    this.sos,
    this.mop,
    this.all,
    this.zmw,
    this.ckd,
    this.gnf,
    this.kmf,
    this.imp,
    this.sdg,
    this.tjs,
    this.uyu,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        jod: json["JOD"] == null ? null : Aed.fromJson(json["JOD"]),
        usd: json["USD"] == null ? null : Aed.fromJson(json["USD"]),
        rsd: json["RSD"] == null ? null : Aed.fromJson(json["RSD"]),
        eur: json["EUR"] == null ? null : Aed.fromJson(json["EUR"]),
        bmd: json["BMD"] == null ? null : Aed.fromJson(json["BMD"]),
        bob: json["BOB"] == null ? null : Aed.fromJson(json["BOB"]),
        lyd: json["LYD"] == null ? null : Aed.fromJson(json["LYD"]),
        xof: json["XOF"] == null ? null : Aed.fromJson(json["XOF"]),
        amd: json["AMD"] == null ? null : Aed.fromJson(json["AMD"]),
        mur: json["MUR"] == null ? null : Aed.fromJson(json["MUR"]),
        mvr: json["MVR"] == null ? null : Aed.fromJson(json["MVR"]),
        mkd: json["MKD"] == null ? null : Aed.fromJson(json["MKD"]),
        etb: json["ETB"] == null ? null : Aed.fromJson(json["ETB"]),
        dkk: json["DKK"] == null ? null : Aed.fromJson(json["DKK"]),
        iqd: json["IQD"] == null ? null : Aed.fromJson(json["IQD"]),
        gtq: json["GTQ"] == null ? null : Aed.fromJson(json["GTQ"]),
        ttd: json["TTD"] == null ? null : Aed.fromJson(json["TTD"]),
        pen: json["PEN"] == null ? null : Aed.fromJson(json["PEN"]),
        srd: json["SRD"] == null ? null : Aed.fromJson(json["SRD"]),
        sek: json["SEK"] == null ? null : Aed.fromJson(json["SEK"]),
        xpf: json["XPF"] == null ? null : Aed.fromJson(json["XPF"]),
        fkp: json["FKP"] == null ? null : Aed.fromJson(json["FKP"]),
        zwl: json["ZWL"] == null ? null : Aed.fromJson(json["ZWL"]),
        sar: json["SAR"] == null ? null : Aed.fromJson(json["SAR"]),
        aed: json["AED"] == null ? null : Aed.fromJson(json["AED"]),
        afn: json["AFN"] == null ? null : Aed.fromJson(json["AFN"]),
        xaf: json["XAF"] == null ? null : Aed.fromJson(json["XAF"]),
        pab: json["PAB"] == null ? null : Aed.fromJson(json["PAB"]),
        syp: json["SYP"] == null ? null : Aed.fromJson(json["SYP"]),
        vuv: json["VUV"] == null ? null : Aed.fromJson(json["VUV"]),
        hnl: json["HNL"] == null ? null : Aed.fromJson(json["HNL"]),
        aud: json["AUD"] == null ? null : Aed.fromJson(json["AUD"]),
        kid: json["KID"] == null ? null : Aed.fromJson(json["KID"]),
        clp: json["CLP"] == null ? null : Aed.fromJson(json["CLP"]),
        xcd: json["XCD"] == null ? null : Aed.fromJson(json["XCD"]),
        mxn: json["MXN"] == null ? null : Aed.fromJson(json["MXN"]),
        cny: json["CNY"] == null ? null : Aed.fromJson(json["CNY"]),
        ssp: json["SSP"] == null ? null : Aed.fromJson(json["SSP"]),
        szl: json["SZL"] == null ? null : Aed.fromJson(json["SZL"]),
        zar: json["ZAR"] == null ? null : Aed.fromJson(json["ZAR"]),
        uzs: json["UZS"] == null ? null : Aed.fromJson(json["UZS"]),
        idr: json["IDR"] == null ? null : Aed.fromJson(json["IDR"]),
        pyg: json["PYG"] == null ? null : Aed.fromJson(json["PYG"]),
        pln: json["PLN"] == null ? null : Aed.fromJson(json["PLN"]),
        bam: json["BAM"] == null ? null : Bam.fromJson(json["BAM"]),
        cad: json["CAD"] == null ? null : Aed.fromJson(json["CAD"]),
        brl: json["BRL"] == null ? null : Aed.fromJson(json["BRL"]),
        mru: json["MRU"] == null ? null : Aed.fromJson(json["MRU"]),
        ils: json["ILS"] == null ? null : Aed.fromJson(json["ILS"]),
        ang: json["ANG"] == null ? null : Aed.fromJson(json["ANG"]),
        bnd: json["BND"] == null ? null : Aed.fromJson(json["BND"]),
        sgd: json["SGD"] == null ? null : Aed.fromJson(json["SGD"]),
        aoa: json["AOA"] == null ? null : Aed.fromJson(json["AOA"]),
        byn: json["BYN"] == null ? null : Aed.fromJson(json["BYN"]),
        currenciesTry: json["TRY"] == null ? null : Aed.fromJson(json["TRY"]),
        gip: json["GIP"] == null ? null : Aed.fromJson(json["GIP"]),
        btn: json["BTN"] == null ? null : Aed.fromJson(json["BTN"]),
        inr: json["INR"] == null ? null : Aed.fromJson(json["INR"]),
        ves: json["VES"] == null ? null : Aed.fromJson(json["VES"]),
        qar: json["QAR"] == null ? null : Aed.fromJson(json["QAR"]),
        czk: json["CZK"] == null ? null : Aed.fromJson(json["CZK"]),
        kwd: json["KWD"] == null ? null : Aed.fromJson(json["KWD"]),
        nzd: json["NZD"] == null ? null : Aed.fromJson(json["NZD"]),
        jmd: json["JMD"] == null ? null : Aed.fromJson(json["JMD"]),
        kyd: json["KYD"] == null ? null : Aed.fromJson(json["KYD"]),
        pkr: json["PKR"] == null ? null : Aed.fromJson(json["PKR"]),
        kzt: json["KZT"] == null ? null : Aed.fromJson(json["KZT"]),
        bhd: json["BHD"] == null ? null : Aed.fromJson(json["BHD"]),
        fjd: json["FJD"] == null ? null : Aed.fromJson(json["FJD"]),
        isk: json["ISK"] == null ? null : Aed.fromJson(json["ISK"]),
        mmk: json["MMK"] == null ? null : Aed.fromJson(json["MMK"]),
        bdt: json["BDT"] == null ? null : Aed.fromJson(json["BDT"]),
        php: json["PHP"] == null ? null : Aed.fromJson(json["PHP"]),
        npr: json["NPR"] == null ? null : Aed.fromJson(json["NPR"]),
        yer: json["YER"] == null ? null : Aed.fromJson(json["YER"]),
        krw: json["KRW"] == null ? null : Aed.fromJson(json["KRW"]),
        omr: json["OMR"] == null ? null : Aed.fromJson(json["OMR"]),
        ern: json["ERN"] == null ? null : Aed.fromJson(json["ERN"]),
        irr: json["IRR"] == null ? null : Aed.fromJson(json["IRR"]),
        tzs: json["TZS"] == null ? null : Aed.fromJson(json["TZS"]),
        sbd: json["SBD"] == null ? null : Aed.fromJson(json["SBD"]),
        kes: json["KES"] == null ? null : Aed.fromJson(json["KES"]),
        dop: json["DOP"] == null ? null : Aed.fromJson(json["DOP"]),
        gbp: json["GBP"] == null ? null : Aed.fromJson(json["GBP"]),
        ggp: json["GGP"] == null ? null : Aed.fromJson(json["GGP"]),
        rwf: json["RWF"] == null ? null : Aed.fromJson(json["RWF"]),
        tvd: json["TVD"] == null ? null : Aed.fromJson(json["TVD"]),
        twd: json["TWD"] == null ? null : Aed.fromJson(json["TWD"]),
        gyd: json["GYD"] == null ? null : Aed.fromJson(json["GYD"]),
        scr: json["SCR"] == null ? null : Aed.fromJson(json["SCR"]),
        kpw: json["KPW"] == null ? null : Aed.fromJson(json["KPW"]),
        bwp: json["BWP"] == null ? null : Aed.fromJson(json["BWP"]),
        khr: json["KHR"] == null ? null : Aed.fromJson(json["KHR"]),
        bbd: json["BBD"] == null ? null : Aed.fromJson(json["BBD"]),
        cop: json["COP"] == null ? null : Aed.fromJson(json["COP"]),
        uah: json["UAH"] == null ? null : Aed.fromJson(json["UAH"]),
        nad: json["NAD"] == null ? null : Aed.fromJson(json["NAD"]),
        top: json["TOP"] == null ? null : Aed.fromJson(json["TOP"]),
        ars: json["ARS"] == null ? null : Aed.fromJson(json["ARS"]),
        crc: json["CRC"] == null ? null : Aed.fromJson(json["CRC"]),
        ghs: json["GHS"] == null ? null : Aed.fromJson(json["GHS"]),
        shp: json["SHP"] == null ? null : Aed.fromJson(json["SHP"]),
        egp: json["EGP"] == null ? null : Aed.fromJson(json["EGP"]),
        cuc: json["CUC"] == null ? null : Aed.fromJson(json["CUC"]),
        cup: json["CUP"] == null ? null : Aed.fromJson(json["CUP"]),
        huf: json["HUF"] == null ? null : Aed.fromJson(json["HUF"]),
        bzd: json["BZD"] == null ? null : Aed.fromJson(json["BZD"]),
        bsd: json["BSD"] == null ? null : Aed.fromJson(json["BSD"]),
        awg: json["AWG"] == null ? null : Aed.fromJson(json["AWG"]),
        stn: json["STN"] == null ? null : Aed.fromJson(json["STN"]),
        rub: json["RUB"] == null ? null : Aed.fromJson(json["RUB"]),
        fok: json["FOK"] == null ? null : Aed.fromJson(json["FOK"]),
        nio: json["NIO"] == null ? null : Aed.fromJson(json["NIO"]),
        tnd: json["TND"] == null ? null : Aed.fromJson(json["TND"]),
        cdf: json["CDF"] == null ? null : Aed.fromJson(json["CDF"]),
        nok: json["NOK"] == null ? null : Aed.fromJson(json["NOK"]),
        sll: json["SLL"] == null ? null : Aed.fromJson(json["SLL"]),
        lsl: json["LSL"] == null ? null : Aed.fromJson(json["LSL"]),
        djf: json["DJF"] == null ? null : Aed.fromJson(json["DJF"]),
        lkr: json["LKR"] == null ? null : Aed.fromJson(json["LKR"]),
        wst: json["WST"] == null ? null : Aed.fromJson(json["WST"]),
        tmt: json["TMT"] == null ? null : Aed.fromJson(json["TMT"]),
        mdl: json["MDL"] == null ? null : Aed.fromJson(json["MDL"]),
        chf: json["CHF"] == null ? null : Aed.fromJson(json["CHF"]),
        mwk: json["MWK"] == null ? null : Aed.fromJson(json["MWK"]),
        lbp: json["LBP"] == null ? null : Aed.fromJson(json["LBP"]),
        mnt: json["MNT"] == null ? null : Aed.fromJson(json["MNT"]),
        thb: json["THB"] == null ? null : Aed.fromJson(json["THB"]),
        ngn: json["NGN"] == null ? null : Aed.fromJson(json["NGN"]),
        cve: json["CVE"] == null ? null : Aed.fromJson(json["CVE"]),
        jep: json["JEP"] == null ? null : Aed.fromJson(json["JEP"]),
        dzd: json["DZD"] == null ? null : Aed.fromJson(json["DZD"]),
        lak: json["LAK"] == null ? null : Aed.fromJson(json["LAK"]),
        azn: json["AZN"] == null ? null : Aed.fromJson(json["AZN"]),
        mad: json["MAD"] == null ? null : Aed.fromJson(json["MAD"]),
        bgn: json["BGN"] == null ? null : Aed.fromJson(json["BGN"]),
        bif: json["BIF"] == null ? null : Aed.fromJson(json["BIF"]),
        ugx: json["UGX"] == null ? null : Aed.fromJson(json["UGX"]),
        mzn: json["MZN"] == null ? null : Aed.fromJson(json["MZN"]),
        gel: json["GEL"] == null ? null : Aed.fromJson(json["GEL"]),
        ron: json["RON"] == null ? null : Aed.fromJson(json["RON"]),
        vnd: json["VND"] == null ? null : Aed.fromJson(json["VND"]),
        jpy: json["JPY"] == null ? null : Aed.fromJson(json["JPY"]),
        lrd: json["LRD"] == null ? null : Aed.fromJson(json["LRD"]),
        htg: json["HTG"] == null ? null : Aed.fromJson(json["HTG"]),
        pgk: json["PGK"] == null ? null : Aed.fromJson(json["PGK"]),
        hkd: json["HKD"] == null ? null : Aed.fromJson(json["HKD"]),
        kgs: json["KGS"] == null ? null : Aed.fromJson(json["KGS"]),
        mga: json["MGA"] == null ? null : Aed.fromJson(json["MGA"]),
        gmd: json["GMD"] == null ? null : Aed.fromJson(json["GMD"]),
        myr: json["MYR"] == null ? null : Aed.fromJson(json["MYR"]),
        sos: json["SOS"] == null ? null : Aed.fromJson(json["SOS"]),
        mop: json["MOP"] == null ? null : Aed.fromJson(json["MOP"]),
        all: json["ALL"] == null ? null : Aed.fromJson(json["ALL"]),
        zmw: json["ZMW"] == null ? null : Aed.fromJson(json["ZMW"]),
        ckd: json["CKD"] == null ? null : Aed.fromJson(json["CKD"]),
        gnf: json["GNF"] == null ? null : Aed.fromJson(json["GNF"]),
        kmf: json["KMF"] == null ? null : Aed.fromJson(json["KMF"]),
        imp: json["IMP"] == null ? null : Aed.fromJson(json["IMP"]),
        sdg: json["SDG"] == null ? null : Bam.fromJson(json["SDG"]),
        tjs: json["TJS"] == null ? null : Aed.fromJson(json["TJS"]),
        uyu: json["UYU"] == null ? null : Aed.fromJson(json["UYU"]),
      );

  Map<String, dynamic> toJson() => {
        "JOD": jod?.toJson(),
        "USD": usd?.toJson(),
        "RSD": rsd?.toJson(),
        "EUR": eur?.toJson(),
        "BMD": bmd?.toJson(),
        "BOB": bob?.toJson(),
        "LYD": lyd?.toJson(),
        "XOF": xof?.toJson(),
        "AMD": amd?.toJson(),
        "MUR": mur?.toJson(),
        "MVR": mvr?.toJson(),
        "MKD": mkd?.toJson(),
        "ETB": etb?.toJson(),
        "DKK": dkk?.toJson(),
        "IQD": iqd?.toJson(),
        "GTQ": gtq?.toJson(),
        "TTD": ttd?.toJson(),
        "PEN": pen?.toJson(),
        "SRD": srd?.toJson(),
        "SEK": sek?.toJson(),
        "XPF": xpf?.toJson(),
        "FKP": fkp?.toJson(),
        "ZWL": zwl?.toJson(),
        "SAR": sar?.toJson(),
        "AED": aed?.toJson(),
        "AFN": afn?.toJson(),
        "XAF": xaf?.toJson(),
        "PAB": pab?.toJson(),
        "SYP": syp?.toJson(),
        "VUV": vuv?.toJson(),
        "HNL": hnl?.toJson(),
        "AUD": aud?.toJson(),
        "KID": kid?.toJson(),
        "CLP": clp?.toJson(),
        "XCD": xcd?.toJson(),
        "MXN": mxn?.toJson(),
        "CNY": cny?.toJson(),
        "SSP": ssp?.toJson(),
        "SZL": szl?.toJson(),
        "ZAR": zar?.toJson(),
        "UZS": uzs?.toJson(),
        "IDR": idr?.toJson(),
        "PYG": pyg?.toJson(),
        "PLN": pln?.toJson(),
        "BAM": bam?.toJson(),
        "CAD": cad?.toJson(),
        "BRL": brl?.toJson(),
        "MRU": mru?.toJson(),
        "ILS": ils?.toJson(),
        "ANG": ang?.toJson(),
        "BND": bnd?.toJson(),
        "SGD": sgd?.toJson(),
        "AOA": aoa?.toJson(),
        "BYN": byn?.toJson(),
        "TRY": currenciesTry?.toJson(),
        "GIP": gip?.toJson(),
        "BTN": btn?.toJson(),
        "INR": inr?.toJson(),
        "VES": ves?.toJson(),
        "QAR": qar?.toJson(),
        "CZK": czk?.toJson(),
        "KWD": kwd?.toJson(),
        "NZD": nzd?.toJson(),
        "JMD": jmd?.toJson(),
        "KYD": kyd?.toJson(),
        "PKR": pkr?.toJson(),
        "KZT": kzt?.toJson(),
        "BHD": bhd?.toJson(),
        "FJD": fjd?.toJson(),
        "ISK": isk?.toJson(),
        "MMK": mmk?.toJson(),
        "BDT": bdt?.toJson(),
        "PHP": php?.toJson(),
        "NPR": npr?.toJson(),
        "YER": yer?.toJson(),
        "KRW": krw?.toJson(),
        "OMR": omr?.toJson(),
        "ERN": ern?.toJson(),
        "IRR": irr?.toJson(),
        "TZS": tzs?.toJson(),
        "SBD": sbd?.toJson(),
        "KES": kes?.toJson(),
        "DOP": dop?.toJson(),
        "GBP": gbp?.toJson(),
        "GGP": ggp?.toJson(),
        "RWF": rwf?.toJson(),
        "TVD": tvd?.toJson(),
        "TWD": twd?.toJson(),
        "GYD": gyd?.toJson(),
        "SCR": scr?.toJson(),
        "KPW": kpw?.toJson(),
        "BWP": bwp?.toJson(),
        "KHR": khr?.toJson(),
        "BBD": bbd?.toJson(),
        "COP": cop?.toJson(),
        "UAH": uah?.toJson(),
        "NAD": nad?.toJson(),
        "TOP": top?.toJson(),
        "ARS": ars?.toJson(),
        "CRC": crc?.toJson(),
        "GHS": ghs?.toJson(),
        "SHP": shp?.toJson(),
        "EGP": egp?.toJson(),
        "CUC": cuc?.toJson(),
        "CUP": cup?.toJson(),
        "HUF": huf?.toJson(),
        "BZD": bzd?.toJson(),
        "BSD": bsd?.toJson(),
        "AWG": awg?.toJson(),
        "STN": stn?.toJson(),
        "RUB": rub?.toJson(),
        "FOK": fok?.toJson(),
        "NIO": nio?.toJson(),
        "TND": tnd?.toJson(),
        "CDF": cdf?.toJson(),
        "NOK": nok?.toJson(),
        "SLL": sll?.toJson(),
        "LSL": lsl?.toJson(),
        "DJF": djf?.toJson(),
        "LKR": lkr?.toJson(),
        "WST": wst?.toJson(),
        "TMT": tmt?.toJson(),
        "MDL": mdl?.toJson(),
        "CHF": chf?.toJson(),
        "MWK": mwk?.toJson(),
        "LBP": lbp?.toJson(),
        "MNT": mnt?.toJson(),
        "THB": thb?.toJson(),
        "NGN": ngn?.toJson(),
        "CVE": cve?.toJson(),
        "JEP": jep?.toJson(),
        "DZD": dzd?.toJson(),
        "LAK": lak?.toJson(),
        "AZN": azn?.toJson(),
        "MAD": mad?.toJson(),
        "BGN": bgn?.toJson(),
        "BIF": bif?.toJson(),
        "UGX": ugx?.toJson(),
        "MZN": mzn?.toJson(),
        "GEL": gel?.toJson(),
        "RON": ron?.toJson(),
        "VND": vnd?.toJson(),
        "JPY": jpy?.toJson(),
        "LRD": lrd?.toJson(),
        "HTG": htg?.toJson(),
        "PGK": pgk?.toJson(),
        "HKD": hkd?.toJson(),
        "KGS": kgs?.toJson(),
        "MGA": mga?.toJson(),
        "GMD": gmd?.toJson(),
        "MYR": myr?.toJson(),
        "SOS": sos?.toJson(),
        "MOP": mop?.toJson(),
        "ALL": all?.toJson(),
        "ZMW": zmw?.toJson(),
        "CKD": ckd?.toJson(),
        "GNF": gnf?.toJson(),
        "KMF": kmf?.toJson(),
        "IMP": imp?.toJson(),
        "SDG": sdg?.toJson(),
        "TJS": tjs?.toJson(),
        "UYU": uyu?.toJson(),
      };
}

class Aed {
  String? name;
  String? symbol;

  Aed({
    this.name,
    this.symbol,
  });

  factory Aed.fromJson(Map<String, dynamic> json) => Aed(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Bam {
  String? name;

  Bam({
    this.name,
  });

  factory Bam.fromJson(Map<String, dynamic> json) => Bam(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({
    this.eng,
    this.fra,
  });

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: json["eng"] == null ? null : Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng?.toJson(),
        "fra": fra?.toJson(),
      };
}

class Eng {
  String? f;
  String? m;

  Eng({
    this.f,
    this.m,
  });

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Gini {
  double? the2010;
  double? the2017;
  double? the2019;
  double? the2009;
  double? the2016;
  double? the2018;
  double? the2015;
  double? the2012;
  double? the2014;
  double? the1992;
  double? the1999;
  double? the2008;
  double? the2003;
  double? the2006;
  double? the2011;
  double? the2004;
  double? the2013;
  double? the1998;
  double? the2005;

  Gini({
    this.the2010,
    this.the2017,
    this.the2019,
    this.the2009,
    this.the2016,
    this.the2018,
    this.the2015,
    this.the2012,
    this.the2014,
    this.the1992,
    this.the1999,
    this.the2008,
    this.the2003,
    this.the2006,
    this.the2011,
    this.the2004,
    this.the2013,
    this.the1998,
    this.the2005,
  });

  factory Gini.fromJson(Map<String, dynamic> json) => Gini(
        the2010: json["2010"]?.toDouble(),
        the2017: json["2017"]?.toDouble(),
        the2019: json["2019"]?.toDouble(),
        the2009: json["2009"]?.toDouble(),
        the2016: json["2016"]?.toDouble(),
        the2018: json["2018"]?.toDouble(),
        the2015: json["2015"]?.toDouble(),
        the2012: json["2012"]?.toDouble(),
        the2014: json["2014"]?.toDouble(),
        the1992: json["1992"]?.toDouble(),
        the1999: json["1999"]?.toDouble(),
        the2008: json["2008"]?.toDouble(),
        the2003: json["2003"]?.toDouble(),
        the2006: json["2006"]?.toDouble(),
        the2011: json["2011"]?.toDouble(),
        the2004: json["2004"]?.toDouble(),
        the2013: json["2013"]?.toDouble(),
        the1998: json["1998"]?.toDouble(),
        the2005: json["2005"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "2010": the2010,
        "2017": the2017,
        "2019": the2019,
        "2009": the2009,
        "2016": the2016,
        "2018": the2018,
        "2015": the2015,
        "2012": the2012,
        "2014": the2014,
        "1992": the1992,
        "1999": the1999,
        "2008": the2008,
        "2003": the2003,
        "2006": the2006,
        "2011": the2011,
        "2004": the2004,
        "2013": the2013,
        "1998": the1998,
        "2005": the2005,
      };
}

class Idd {
  String? root;
  List<String>? suffixes;

  Idd({
    this.root,
    this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null
            ? []
            : List<String>.from(json["suffixes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes":
            suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
      };
}

class Languages {
  String? ara;
  String? cal;
  String? cha;
  String? eng;
  String? srp;
  String? cat;
  String? aym;
  String? grn;
  String? que;
  String? spa;
  String? fra;
  String? hye;
  String? mfe;
  String? div;
  String? smo;
  String? mkd;
  String? amh;
  String? kal;
  String? arc;
  String? ckb;
  String? nld;
  String? swe;
  String? est;
  String? bwg;
  String? kck;
  String? khi;
  String? ndc;
  String? nde;
  String? nya;
  String? sna;
  String? sot;
  String? toi;
  String? tsn;
  String? tso;
  String? ven;
  String? xho;
  String? zib;
  String? slk;
  String? prs;
  String? pus;
  String? tuk;
  String? sag;
  String? ita;
  String? lat;
  String? bis;
  String? gil;
  String? zho;
  String? por;
  String? tet;
  String? ssw;
  String? rus;
  String? uzb;
  String? ind;
  String? hrv;
  String? pol;
  String? bos;
  String? heb;
  String? pap;
  String? msa;
  String? mlt;
  String? bel;
  String? tur;
  String? fin;
  String? dzo;
  String? ces;
  String? cnr;
  String? nor;
  String? hin;
  String? tam;
  String? mri;
  String? nzs;
  String? jam;
  String? kon;
  String? lin;
  String? urd;
  String? kaz;
  String? fij;
  String? hif;
  String? isl;
  String? mya;
  String? ben;
  String? fil;
  String? gle;
  String? nep;
  String? kor;
  String? dan;
  String? tir;
  String? fas;
  String? swa;
  String? ell;
  String? nfr;
  String? kin;
  String? tvl;
  String? crs;
  String? khm;
  String? ukr;
  String? nau;
  String? afr;
  String? deu;
  String? her;
  String? hgm;
  String? kwn;
  String? loz;
  String? ndo;
  String? ton;
  String? mah;
  String? de;
  String? hun;
  String? bjz;
  String? ltz;
  String? fao;
  String? lua;
  String? nbl;
  String? nso;
  String? zul;
  String? sin;
  String? lav;
  String? ron;
  String? mon;
  String? nno;
  String? nob;
  String? smi;
  String? tha;
  String? nrf;
  String? lao;
  String? aze;
  String? ber;
  String? bul;
  String? run;
  String? sqi;
  String? kat;
  String? vie;
  String? mey;
  String? jpn;
  String? lit;
  String? hat;
  String? hmo;
  String? tpi;
  String? kir;
  String? pau;
  String? mlg;
  String? tkl;
  String? slv;
  String? som;
  String? rar;
  String? zdj;
  String? niu;
  String? gsw;
  String? roh;
  String? pih;
  String? glv;
  String? tgk;
  String? pov;

  Languages({
    this.ara,
    this.cal,
    this.cha,
    this.eng,
    this.srp,
    this.cat,
    this.aym,
    this.grn,
    this.que,
    this.spa,
    this.fra,
    this.hye,
    this.mfe,
    this.div,
    this.smo,
    this.mkd,
    this.amh,
    this.kal,
    this.arc,
    this.ckb,
    this.nld,
    this.swe,
    this.est,
    this.bwg,
    this.kck,
    this.khi,
    this.ndc,
    this.nde,
    this.nya,
    this.sna,
    this.sot,
    this.toi,
    this.tsn,
    this.tso,
    this.ven,
    this.xho,
    this.zib,
    this.slk,
    this.prs,
    this.pus,
    this.tuk,
    this.sag,
    this.ita,
    this.lat,
    this.bis,
    this.gil,
    this.zho,
    this.por,
    this.tet,
    this.ssw,
    this.rus,
    this.uzb,
    this.ind,
    this.hrv,
    this.pol,
    this.bos,
    this.heb,
    this.pap,
    this.msa,
    this.mlt,
    this.bel,
    this.tur,
    this.fin,
    this.dzo,
    this.ces,
    this.cnr,
    this.nor,
    this.hin,
    this.tam,
    this.mri,
    this.nzs,
    this.jam,
    this.kon,
    this.lin,
    this.urd,
    this.kaz,
    this.fij,
    this.hif,
    this.isl,
    this.mya,
    this.ben,
    this.fil,
    this.gle,
    this.nep,
    this.kor,
    this.dan,
    this.tir,
    this.fas,
    this.swa,
    this.ell,
    this.nfr,
    this.kin,
    this.tvl,
    this.crs,
    this.khm,
    this.ukr,
    this.nau,
    this.afr,
    this.deu,
    this.her,
    this.hgm,
    this.kwn,
    this.loz,
    this.ndo,
    this.ton,
    this.mah,
    this.de,
    this.hun,
    this.bjz,
    this.ltz,
    this.fao,
    this.lua,
    this.nbl,
    this.nso,
    this.zul,
    this.sin,
    this.lav,
    this.ron,
    this.mon,
    this.nno,
    this.nob,
    this.smi,
    this.tha,
    this.nrf,
    this.lao,
    this.aze,
    this.ber,
    this.bul,
    this.run,
    this.sqi,
    this.kat,
    this.vie,
    this.mey,
    this.jpn,
    this.lit,
    this.hat,
    this.hmo,
    this.tpi,
    this.kir,
    this.pau,
    this.mlg,
    this.tkl,
    this.slv,
    this.som,
    this.rar,
    this.zdj,
    this.niu,
    this.gsw,
    this.roh,
    this.pih,
    this.glv,
    this.tgk,
    this.pov,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        ara: json["ara"],
        cal: json["cal"],
        cha: json["cha"],
        eng: json["eng"],
        srp: json["srp"],
        cat: json["cat"],
        aym: json["aym"],
        grn: json["grn"],
        que: json["que"],
        spa: json["spa"],
        fra: json["fra"],
        hye: json["hye"],
        mfe: json["mfe"],
        div: json["div"],
        smo: json["smo"],
        mkd: json["mkd"],
        amh: json["amh"],
        kal: json["kal"],
        arc: json["arc"],
        ckb: json["ckb"],
        nld: json["nld"],
        swe: json["swe"],
        est: json["est"],
        bwg: json["bwg"],
        kck: json["kck"],
        khi: json["khi"],
        ndc: json["ndc"],
        nde: json["nde"],
        nya: json["nya"],
        sna: json["sna"],
        sot: json["sot"],
        toi: json["toi"],
        tsn: json["tsn"],
        tso: json["tso"],
        ven: json["ven"],
        xho: json["xho"],
        zib: json["zib"],
        slk: json["slk"],
        prs: json["prs"],
        pus: json["pus"],
        tuk: json["tuk"],
        sag: json["sag"],
        ita: json["ita"],
        lat: json["lat"],
        bis: json["bis"],
        gil: json["gil"],
        zho: json["zho"],
        por: json["por"],
        tet: json["tet"],
        ssw: json["ssw"],
        rus: json["rus"],
        uzb: json["uzb"],
        ind: json["ind"],
        hrv: json["hrv"],
        pol: json["pol"],
        bos: json["bos"],
        heb: json["heb"],
        pap: json["pap"],
        msa: json["msa"],
        mlt: json["mlt"],
        bel: json["bel"],
        tur: json["tur"],
        fin: json["fin"],
        dzo: json["dzo"],
        ces: json["ces"],
        cnr: json["cnr"],
        nor: json["nor"],
        hin: json["hin"],
        tam: json["tam"],
        mri: json["mri"],
        nzs: json["nzs"],
        jam: json["jam"],
        kon: json["kon"],
        lin: json["lin"],
        urd: json["urd"],
        kaz: json["kaz"],
        fij: json["fij"],
        hif: json["hif"],
        isl: json["isl"],
        mya: json["mya"],
        ben: json["ben"],
        fil: json["fil"],
        gle: json["gle"],
        nep: json["nep"],
        kor: json["kor"],
        dan: json["dan"],
        tir: json["tir"],
        fas: json["fas"],
        swa: json["swa"],
        ell: json["ell"],
        nfr: json["nfr"],
        kin: json["kin"],
        tvl: json["tvl"],
        crs: json["crs"],
        khm: json["khm"],
        ukr: json["ukr"],
        nau: json["nau"],
        afr: json["afr"],
        deu: json["deu"],
        her: json["her"],
        hgm: json["hgm"],
        kwn: json["kwn"],
        loz: json["loz"],
        ndo: json["ndo"],
        ton: json["ton"],
        mah: json["mah"],
        de: json["de"],
        hun: json["hun"],
        bjz: json["bjz"],
        ltz: json["ltz"],
        fao: json["fao"],
        lua: json["lua"],
        nbl: json["nbl"],
        nso: json["nso"],
        zul: json["zul"],
        sin: json["sin"],
        lav: json["lav"],
        ron: json["ron"],
        mon: json["mon"],
        nno: json["nno"],
        nob: json["nob"],
        smi: json["smi"],
        tha: json["tha"],
        nrf: json["nrf"],
        lao: json["lao"],
        aze: json["aze"],
        ber: json["ber"],
        bul: json["bul"],
        run: json["run"],
        sqi: json["sqi"],
        kat: json["kat"],
        vie: json["vie"],
        mey: json["mey"],
        jpn: json["jpn"],
        lit: json["lit"],
        hat: json["hat"],
        hmo: json["hmo"],
        tpi: json["tpi"],
        kir: json["kir"],
        pau: json["pau"],
        mlg: json["mlg"],
        tkl: json["tkl"],
        slv: json["slv"],
        som: json["som"],
        rar: json["rar"],
        zdj: json["zdj"],
        niu: json["niu"],
        gsw: json["gsw"],
        roh: json["roh"],
        pih: json["pih"],
        glv: json["glv"],
        tgk: json["tgk"],
        pov: json["pov"],
      );

  Map<String, dynamic> toJson() => {
        "ara": ara,
        "cal": cal,
        "cha": cha,
        "eng": eng,
        "srp": srp,
        "cat": cat,
        "aym": aym,
        "grn": grn,
        "que": que,
        "spa": spa,
        "fra": fra,
        "hye": hye,
        "mfe": mfe,
        "div": div,
        "smo": smo,
        "mkd": mkd,
        "amh": amh,
        "kal": kal,
        "arc": arc,
        "ckb": ckb,
        "nld": nld,
        "swe": swe,
        "est": est,
        "bwg": bwg,
        "kck": kck,
        "khi": khi,
        "ndc": ndc,
        "nde": nde,
        "nya": nya,
        "sna": sna,
        "sot": sot,
        "toi": toi,
        "tsn": tsn,
        "tso": tso,
        "ven": ven,
        "xho": xho,
        "zib": zib,
        "slk": slk,
        "prs": prs,
        "pus": pus,
        "tuk": tuk,
        "sag": sag,
        "ita": ita,
        "lat": lat,
        "bis": bis,
        "gil": gil,
        "zho": zho,
        "por": por,
        "tet": tet,
        "ssw": ssw,
        "rus": rus,
        "uzb": uzb,
        "ind": ind,
        "hrv": hrv,
        "pol": pol,
        "bos": bos,
        "heb": heb,
        "pap": pap,
        "msa": msa,
        "mlt": mlt,
        "bel": bel,
        "tur": tur,
        "fin": fin,
        "dzo": dzo,
        "ces": ces,
        "cnr": cnr,
        "nor": nor,
        "hin": hin,
        "tam": tam,
        "mri": mri,
        "nzs": nzs,
        "jam": jam,
        "kon": kon,
        "lin": lin,
        "urd": urd,
        "kaz": kaz,
        "fij": fij,
        "hif": hif,
        "isl": isl,
        "mya": mya,
        "ben": ben,
        "fil": fil,
        "gle": gle,
        "nep": nep,
        "kor": kor,
        "dan": dan,
        "tir": tir,
        "fas": fas,
        "swa": swa,
        "ell": ell,
        "nfr": nfr,
        "kin": kin,
        "tvl": tvl,
        "crs": crs,
        "khm": khm,
        "ukr": ukr,
        "nau": nau,
        "afr": afr,
        "deu": deu,
        "her": her,
        "hgm": hgm,
        "kwn": kwn,
        "loz": loz,
        "ndo": ndo,
        "ton": ton,
        "mah": mah,
        "de": de,
        "hun": hun,
        "bjz": bjz,
        "ltz": ltz,
        "fao": fao,
        "lua": lua,
        "nbl": nbl,
        "nso": nso,
        "zul": zul,
        "sin": sin,
        "lav": lav,
        "ron": ron,
        "mon": mon,
        "nno": nno,
        "nob": nob,
        "smi": smi,
        "tha": tha,
        "nrf": nrf,
        "lao": lao,
        "aze": aze,
        "ber": ber,
        "bul": bul,
        "run": run,
        "sqi": sqi,
        "kat": kat,
        "vie": vie,
        "mey": mey,
        "jpn": jpn,
        "lit": lit,
        "hat": hat,
        "hmo": hmo,
        "tpi": tpi,
        "kir": kir,
        "pau": pau,
        "mlg": mlg,
        "tkl": tkl,
        "slv": slv,
        "som": som,
        "rar": rar,
        "zdj": zdj,
        "niu": niu,
        "gsw": gsw,
        "roh": roh,
        "pih": pih,
        "glv": glv,
        "tgk": tgk,
        "pov": pov,
      };
}

class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"] == null
            ? null
            : NativeName.fromJson(json["nativeName"]),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName?.toJson(),
      };
}

class NativeName {
  Ara? ara;
  Ara? cal;
  Ara? cha;
  Ara? eng;
  Ara? srp;
  Ara? cat;
  Ara? aym;
  Ara? grn;
  Ara? que;
  Ara? spa;
  Ara? fra;
  Ara? hye;
  Ara? mfe;
  Ara? div;
  Ara? smo;
  Ara? mkd;
  Ara? amh;
  Ara? kal;
  Ara? arc;
  Ara? ckb;
  Ara? nld;
  Ara? swe;
  Ara? est;
  Ara? bwg;
  Ara? kck;
  Ara? khi;
  Ara? ndc;
  Ara? nde;
  Ara? nya;
  Ara? sna;
  Ara? sot;
  Ara? toi;
  Ara? tsn;
  Ara? tso;
  Ara? ven;
  Ara? xho;
  Ara? zib;
  Ara? slk;
  Ara? prs;
  Ara? pus;
  Ara? tuk;
  Ara? sag;
  Ara? ita;
  Ara? lat;
  Ara? bis;
  Ara? gil;
  Ara? zho;
  Ara? por;
  Ara? tet;
  Ara? ssw;
  Ara? rus;
  Ara? uzb;
  Ara? ind;
  Ara? hrv;
  Ara? pol;
  Ara? bos;
  Ara? heb;
  Ara? pap;
  Ara? msa;
  Ara? mlt;
  Ara? bel;
  Ara? tur;
  Ara? fin;
  Ara? dzo;
  Ara? ces;
  Ara? cnr;
  Ara? nor;
  Ara? hin;
  Ara? tam;
  Ara? mri;
  Ara? nzs;
  Ara? jam;
  Ara? kon;
  Ara? lin;
  Ara? urd;
  Ara? kaz;
  Ara? fij;
  Ara? hif;
  Ara? isl;
  Ara? mya;
  Ara? ben;
  Ara? fil;
  Ara? gle;
  Ara? nep;
  Ara? kor;
  Ara? dan;
  Ara? tir;
  Ara? fas;
  Ara? swa;
  Ara? ell;
  Ara? nfr;
  Ara? kin;
  Ara? tvl;
  Ara? crs;
  Ara? khm;
  Ara? ukr;
  Ara? nau;
  Ara? afr;
  Ara? deu;
  Ara? her;
  Ara? hgm;
  Ara? kwn;
  Ara? loz;
  Ara? ndo;
  Ara? ton;
  Ara? mah;
  Ara? bar;
  Ara? hun;
  Ara? bjz;
  Ara? ltz;
  Ara? fao;
  Ara? lua;
  Ara? nbl;
  Ara? nso;
  Ara? zul;
  Ara? sin;
  Ara? lav;
  Ara? ron;
  Ara? mon;
  Ara? nno;
  Ara? nob;
  Ara? smi;
  Ara? tha;
  Ara? nrf;
  Ara? lao;
  Ara? aze;
  Ara? ber;
  Ara? bul;
  Ara? run;
  Ara? sqi;
  Ara? kat;
  Ara? vie;
  Ara? mey;
  Ara? jpn;
  Ara? lit;
  Ara? hat;
  Ara? hmo;
  Ara? tpi;
  Ara? kir;
  Ara? pau;
  Ara? mlg;
  Ara? tkl;
  Ara? slv;
  Ara? som;
  Ara? rar;
  Ara? zdj;
  Ara? niu;
  Ara? gsw;
  Ara? roh;
  Ara? pih;
  Ara? glv;
  Ara? tgk;
  Ara? pov;

  NativeName({
    this.ara,
    this.cal,
    this.cha,
    this.eng,
    this.srp,
    this.cat,
    this.aym,
    this.grn,
    this.que,
    this.spa,
    this.fra,
    this.hye,
    this.mfe,
    this.div,
    this.smo,
    this.mkd,
    this.amh,
    this.kal,
    this.arc,
    this.ckb,
    this.nld,
    this.swe,
    this.est,
    this.bwg,
    this.kck,
    this.khi,
    this.ndc,
    this.nde,
    this.nya,
    this.sna,
    this.sot,
    this.toi,
    this.tsn,
    this.tso,
    this.ven,
    this.xho,
    this.zib,
    this.slk,
    this.prs,
    this.pus,
    this.tuk,
    this.sag,
    this.ita,
    this.lat,
    this.bis,
    this.gil,
    this.zho,
    this.por,
    this.tet,
    this.ssw,
    this.rus,
    this.uzb,
    this.ind,
    this.hrv,
    this.pol,
    this.bos,
    this.heb,
    this.pap,
    this.msa,
    this.mlt,
    this.bel,
    this.tur,
    this.fin,
    this.dzo,
    this.ces,
    this.cnr,
    this.nor,
    this.hin,
    this.tam,
    this.mri,
    this.nzs,
    this.jam,
    this.kon,
    this.lin,
    this.urd,
    this.kaz,
    this.fij,
    this.hif,
    this.isl,
    this.mya,
    this.ben,
    this.fil,
    this.gle,
    this.nep,
    this.kor,
    this.dan,
    this.tir,
    this.fas,
    this.swa,
    this.ell,
    this.nfr,
    this.kin,
    this.tvl,
    this.crs,
    this.khm,
    this.ukr,
    this.nau,
    this.afr,
    this.deu,
    this.her,
    this.hgm,
    this.kwn,
    this.loz,
    this.ndo,
    this.ton,
    this.mah,
    this.bar,
    this.hun,
    this.bjz,
    this.ltz,
    this.fao,
    this.lua,
    this.nbl,
    this.nso,
    this.zul,
    this.sin,
    this.lav,
    this.ron,
    this.mon,
    this.nno,
    this.nob,
    this.smi,
    this.tha,
    this.nrf,
    this.lao,
    this.aze,
    this.ber,
    this.bul,
    this.run,
    this.sqi,
    this.kat,
    this.vie,
    this.mey,
    this.jpn,
    this.lit,
    this.hat,
    this.hmo,
    this.tpi,
    this.kir,
    this.pau,
    this.mlg,
    this.tkl,
    this.slv,
    this.som,
    this.rar,
    this.zdj,
    this.niu,
    this.gsw,
    this.roh,
    this.pih,
    this.glv,
    this.tgk,
    this.pov,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        ara: json["ara"] == null ? null : Ara.fromJson(json["ara"]),
        cal: json["cal"] == null ? null : Ara.fromJson(json["cal"]),
        cha: json["cha"] == null ? null : Ara.fromJson(json["cha"]),
        eng: json["eng"] == null ? null : Ara.fromJson(json["eng"]),
        srp: json["srp"] == null ? null : Ara.fromJson(json["srp"]),
        cat: json["cat"] == null ? null : Ara.fromJson(json["cat"]),
        aym: json["aym"] == null ? null : Ara.fromJson(json["aym"]),
        grn: json["grn"] == null ? null : Ara.fromJson(json["grn"]),
        que: json["que"] == null ? null : Ara.fromJson(json["que"]),
        spa: json["spa"] == null ? null : Ara.fromJson(json["spa"]),
        fra: json["fra"] == null ? null : Ara.fromJson(json["fra"]),
        hye: json["hye"] == null ? null : Ara.fromJson(json["hye"]),
        mfe: json["mfe"] == null ? null : Ara.fromJson(json["mfe"]),
        div: json["div"] == null ? null : Ara.fromJson(json["div"]),
        smo: json["smo"] == null ? null : Ara.fromJson(json["smo"]),
        mkd: json["mkd"] == null ? null : Ara.fromJson(json["mkd"]),
        amh: json["amh"] == null ? null : Ara.fromJson(json["amh"]),
        kal: json["kal"] == null ? null : Ara.fromJson(json["kal"]),
        arc: json["arc"] == null ? null : Ara.fromJson(json["arc"]),
        ckb: json["ckb"] == null ? null : Ara.fromJson(json["ckb"]),
        nld: json["nld"] == null ? null : Ara.fromJson(json["nld"]),
        swe: json["swe"] == null ? null : Ara.fromJson(json["swe"]),
        est: json["est"] == null ? null : Ara.fromJson(json["est"]),
        bwg: json["bwg"] == null ? null : Ara.fromJson(json["bwg"]),
        kck: json["kck"] == null ? null : Ara.fromJson(json["kck"]),
        khi: json["khi"] == null ? null : Ara.fromJson(json["khi"]),
        ndc: json["ndc"] == null ? null : Ara.fromJson(json["ndc"]),
        nde: json["nde"] == null ? null : Ara.fromJson(json["nde"]),
        nya: json["nya"] == null ? null : Ara.fromJson(json["nya"]),
        sna: json["sna"] == null ? null : Ara.fromJson(json["sna"]),
        sot: json["sot"] == null ? null : Ara.fromJson(json["sot"]),
        toi: json["toi"] == null ? null : Ara.fromJson(json["toi"]),
        tsn: json["tsn"] == null ? null : Ara.fromJson(json["tsn"]),
        tso: json["tso"] == null ? null : Ara.fromJson(json["tso"]),
        ven: json["ven"] == null ? null : Ara.fromJson(json["ven"]),
        xho: json["xho"] == null ? null : Ara.fromJson(json["xho"]),
        zib: json["zib"] == null ? null : Ara.fromJson(json["zib"]),
        slk: json["slk"] == null ? null : Ara.fromJson(json["slk"]),
        prs: json["prs"] == null ? null : Ara.fromJson(json["prs"]),
        pus: json["pus"] == null ? null : Ara.fromJson(json["pus"]),
        tuk: json["tuk"] == null ? null : Ara.fromJson(json["tuk"]),
        sag: json["sag"] == null ? null : Ara.fromJson(json["sag"]),
        ita: json["ita"] == null ? null : Ara.fromJson(json["ita"]),
        lat: json["lat"] == null ? null : Ara.fromJson(json["lat"]),
        bis: json["bis"] == null ? null : Ara.fromJson(json["bis"]),
        gil: json["gil"] == null ? null : Ara.fromJson(json["gil"]),
        zho: json["zho"] == null ? null : Ara.fromJson(json["zho"]),
        por: json["por"] == null ? null : Ara.fromJson(json["por"]),
        tet: json["tet"] == null ? null : Ara.fromJson(json["tet"]),
        ssw: json["ssw"] == null ? null : Ara.fromJson(json["ssw"]),
        rus: json["rus"] == null ? null : Ara.fromJson(json["rus"]),
        uzb: json["uzb"] == null ? null : Ara.fromJson(json["uzb"]),
        ind: json["ind"] == null ? null : Ara.fromJson(json["ind"]),
        hrv: json["hrv"] == null ? null : Ara.fromJson(json["hrv"]),
        pol: json["pol"] == null ? null : Ara.fromJson(json["pol"]),
        bos: json["bos"] == null ? null : Ara.fromJson(json["bos"]),
        heb: json["heb"] == null ? null : Ara.fromJson(json["heb"]),
        pap: json["pap"] == null ? null : Ara.fromJson(json["pap"]),
        msa: json["msa"] == null ? null : Ara.fromJson(json["msa"]),
        mlt: json["mlt"] == null ? null : Ara.fromJson(json["mlt"]),
        bel: json["bel"] == null ? null : Ara.fromJson(json["bel"]),
        tur: json["tur"] == null ? null : Ara.fromJson(json["tur"]),
        fin: json["fin"] == null ? null : Ara.fromJson(json["fin"]),
        dzo: json["dzo"] == null ? null : Ara.fromJson(json["dzo"]),
        ces: json["ces"] == null ? null : Ara.fromJson(json["ces"]),
        cnr: json["cnr"] == null ? null : Ara.fromJson(json["cnr"]),
        nor: json["nor"] == null ? null : Ara.fromJson(json["nor"]),
        hin: json["hin"] == null ? null : Ara.fromJson(json["hin"]),
        tam: json["tam"] == null ? null : Ara.fromJson(json["tam"]),
        mri: json["mri"] == null ? null : Ara.fromJson(json["mri"]),
        nzs: json["nzs"] == null ? null : Ara.fromJson(json["nzs"]),
        jam: json["jam"] == null ? null : Ara.fromJson(json["jam"]),
        kon: json["kon"] == null ? null : Ara.fromJson(json["kon"]),
        lin: json["lin"] == null ? null : Ara.fromJson(json["lin"]),
        urd: json["urd"] == null ? null : Ara.fromJson(json["urd"]),
        kaz: json["kaz"] == null ? null : Ara.fromJson(json["kaz"]),
        fij: json["fij"] == null ? null : Ara.fromJson(json["fij"]),
        hif: json["hif"] == null ? null : Ara.fromJson(json["hif"]),
        isl: json["isl"] == null ? null : Ara.fromJson(json["isl"]),
        mya: json["mya"] == null ? null : Ara.fromJson(json["mya"]),
        ben: json["ben"] == null ? null : Ara.fromJson(json["ben"]),
        fil: json["fil"] == null ? null : Ara.fromJson(json["fil"]),
        gle: json["gle"] == null ? null : Ara.fromJson(json["gle"]),
        nep: json["nep"] == null ? null : Ara.fromJson(json["nep"]),
        kor: json["kor"] == null ? null : Ara.fromJson(json["kor"]),
        dan: json["dan"] == null ? null : Ara.fromJson(json["dan"]),
        tir: json["tir"] == null ? null : Ara.fromJson(json["tir"]),
        fas: json["fas"] == null ? null : Ara.fromJson(json["fas"]),
        swa: json["swa"] == null ? null : Ara.fromJson(json["swa"]),
        ell: json["ell"] == null ? null : Ara.fromJson(json["ell"]),
        nfr: json["nfr"] == null ? null : Ara.fromJson(json["nfr"]),
        kin: json["kin"] == null ? null : Ara.fromJson(json["kin"]),
        tvl: json["tvl"] == null ? null : Ara.fromJson(json["tvl"]),
        crs: json["crs"] == null ? null : Ara.fromJson(json["crs"]),
        khm: json["khm"] == null ? null : Ara.fromJson(json["khm"]),
        ukr: json["ukr"] == null ? null : Ara.fromJson(json["ukr"]),
        nau: json["nau"] == null ? null : Ara.fromJson(json["nau"]),
        afr: json["afr"] == null ? null : Ara.fromJson(json["afr"]),
        deu: json["deu"] == null ? null : Ara.fromJson(json["deu"]),
        her: json["her"] == null ? null : Ara.fromJson(json["her"]),
        hgm: json["hgm"] == null ? null : Ara.fromJson(json["hgm"]),
        kwn: json["kwn"] == null ? null : Ara.fromJson(json["kwn"]),
        loz: json["loz"] == null ? null : Ara.fromJson(json["loz"]),
        ndo: json["ndo"] == null ? null : Ara.fromJson(json["ndo"]),
        ton: json["ton"] == null ? null : Ara.fromJson(json["ton"]),
        mah: json["mah"] == null ? null : Ara.fromJson(json["mah"]),
        bar: json["bar"] == null ? null : Ara.fromJson(json["bar"]),
        hun: json["hun"] == null ? null : Ara.fromJson(json["hun"]),
        bjz: json["bjz"] == null ? null : Ara.fromJson(json["bjz"]),
        ltz: json["ltz"] == null ? null : Ara.fromJson(json["ltz"]),
        fao: json["fao"] == null ? null : Ara.fromJson(json["fao"]),
        lua: json["lua"] == null ? null : Ara.fromJson(json["lua"]),
        nbl: json["nbl"] == null ? null : Ara.fromJson(json["nbl"]),
        nso: json["nso"] == null ? null : Ara.fromJson(json["nso"]),
        zul: json["zul"] == null ? null : Ara.fromJson(json["zul"]),
        sin: json["sin"] == null ? null : Ara.fromJson(json["sin"]),
        lav: json["lav"] == null ? null : Ara.fromJson(json["lav"]),
        ron: json["ron"] == null ? null : Ara.fromJson(json["ron"]),
        mon: json["mon"] == null ? null : Ara.fromJson(json["mon"]),
        nno: json["nno"] == null ? null : Ara.fromJson(json["nno"]),
        nob: json["nob"] == null ? null : Ara.fromJson(json["nob"]),
        smi: json["smi"] == null ? null : Ara.fromJson(json["smi"]),
        tha: json["tha"] == null ? null : Ara.fromJson(json["tha"]),
        nrf: json["nrf"] == null ? null : Ara.fromJson(json["nrf"]),
        lao: json["lao"] == null ? null : Ara.fromJson(json["lao"]),
        aze: json["aze"] == null ? null : Ara.fromJson(json["aze"]),
        ber: json["ber"] == null ? null : Ara.fromJson(json["ber"]),
        bul: json["bul"] == null ? null : Ara.fromJson(json["bul"]),
        run: json["run"] == null ? null : Ara.fromJson(json["run"]),
        sqi: json["sqi"] == null ? null : Ara.fromJson(json["sqi"]),
        kat: json["kat"] == null ? null : Ara.fromJson(json["kat"]),
        vie: json["vie"] == null ? null : Ara.fromJson(json["vie"]),
        mey: json["mey"] == null ? null : Ara.fromJson(json["mey"]),
        jpn: json["jpn"] == null ? null : Ara.fromJson(json["jpn"]),
        lit: json["lit"] == null ? null : Ara.fromJson(json["lit"]),
        hat: json["hat"] == null ? null : Ara.fromJson(json["hat"]),
        hmo: json["hmo"] == null ? null : Ara.fromJson(json["hmo"]),
        tpi: json["tpi"] == null ? null : Ara.fromJson(json["tpi"]),
        kir: json["kir"] == null ? null : Ara.fromJson(json["kir"]),
        pau: json["pau"] == null ? null : Ara.fromJson(json["pau"]),
        mlg: json["mlg"] == null ? null : Ara.fromJson(json["mlg"]),
        tkl: json["tkl"] == null ? null : Ara.fromJson(json["tkl"]),
        slv: json["slv"] == null ? null : Ara.fromJson(json["slv"]),
        som: json["som"] == null ? null : Ara.fromJson(json["som"]),
        rar: json["rar"] == null ? null : Ara.fromJson(json["rar"]),
        zdj: json["zdj"] == null ? null : Ara.fromJson(json["zdj"]),
        niu: json["niu"] == null ? null : Ara.fromJson(json["niu"]),
        gsw: json["gsw"] == null ? null : Ara.fromJson(json["gsw"]),
        roh: json["roh"] == null ? null : Ara.fromJson(json["roh"]),
        pih: json["pih"] == null ? null : Ara.fromJson(json["pih"]),
        glv: json["glv"] == null ? null : Ara.fromJson(json["glv"]),
        tgk: json["tgk"] == null ? null : Ara.fromJson(json["tgk"]),
        pov: json["pov"] == null ? null : Ara.fromJson(json["pov"]),
      );

  Map<String, dynamic> toJson() => {
        "ara": ara?.toJson(),
        "cal": cal?.toJson(),
        "cha": cha?.toJson(),
        "eng": eng?.toJson(),
        "srp": srp?.toJson(),
        "cat": cat?.toJson(),
        "aym": aym?.toJson(),
        "grn": grn?.toJson(),
        "que": que?.toJson(),
        "spa": spa?.toJson(),
        "fra": fra?.toJson(),
        "hye": hye?.toJson(),
        "mfe": mfe?.toJson(),
        "div": div?.toJson(),
        "smo": smo?.toJson(),
        "mkd": mkd?.toJson(),
        "amh": amh?.toJson(),
        "kal": kal?.toJson(),
        "arc": arc?.toJson(),
        "ckb": ckb?.toJson(),
        "nld": nld?.toJson(),
        "swe": swe?.toJson(),
        "est": est?.toJson(),
        "bwg": bwg?.toJson(),
        "kck": kck?.toJson(),
        "khi": khi?.toJson(),
        "ndc": ndc?.toJson(),
        "nde": nde?.toJson(),
        "nya": nya?.toJson(),
        "sna": sna?.toJson(),
        "sot": sot?.toJson(),
        "toi": toi?.toJson(),
        "tsn": tsn?.toJson(),
        "tso": tso?.toJson(),
        "ven": ven?.toJson(),
        "xho": xho?.toJson(),
        "zib": zib?.toJson(),
        "slk": slk?.toJson(),
        "prs": prs?.toJson(),
        "pus": pus?.toJson(),
        "tuk": tuk?.toJson(),
        "sag": sag?.toJson(),
        "ita": ita?.toJson(),
        "lat": lat?.toJson(),
        "bis": bis?.toJson(),
        "gil": gil?.toJson(),
        "zho": zho?.toJson(),
        "por": por?.toJson(),
        "tet": tet?.toJson(),
        "ssw": ssw?.toJson(),
        "rus": rus?.toJson(),
        "uzb": uzb?.toJson(),
        "ind": ind?.toJson(),
        "hrv": hrv?.toJson(),
        "pol": pol?.toJson(),
        "bos": bos?.toJson(),
        "heb": heb?.toJson(),
        "pap": pap?.toJson(),
        "msa": msa?.toJson(),
        "mlt": mlt?.toJson(),
        "bel": bel?.toJson(),
        "tur": tur?.toJson(),
        "fin": fin?.toJson(),
        "dzo": dzo?.toJson(),
        "ces": ces?.toJson(),
        "cnr": cnr?.toJson(),
        "nor": nor?.toJson(),
        "hin": hin?.toJson(),
        "tam": tam?.toJson(),
        "mri": mri?.toJson(),
        "nzs": nzs?.toJson(),
        "jam": jam?.toJson(),
        "kon": kon?.toJson(),
        "lin": lin?.toJson(),
        "urd": urd?.toJson(),
        "kaz": kaz?.toJson(),
        "fij": fij?.toJson(),
        "hif": hif?.toJson(),
        "isl": isl?.toJson(),
        "mya": mya?.toJson(),
        "ben": ben?.toJson(),
        "fil": fil?.toJson(),
        "gle": gle?.toJson(),
        "nep": nep?.toJson(),
        "kor": kor?.toJson(),
        "dan": dan?.toJson(),
        "tir": tir?.toJson(),
        "fas": fas?.toJson(),
        "swa": swa?.toJson(),
        "ell": ell?.toJson(),
        "nfr": nfr?.toJson(),
        "kin": kin?.toJson(),
        "tvl": tvl?.toJson(),
        "crs": crs?.toJson(),
        "khm": khm?.toJson(),
        "ukr": ukr?.toJson(),
        "nau": nau?.toJson(),
        "afr": afr?.toJson(),
        "deu": deu?.toJson(),
        "her": her?.toJson(),
        "hgm": hgm?.toJson(),
        "kwn": kwn?.toJson(),
        "loz": loz?.toJson(),
        "ndo": ndo?.toJson(),
        "ton": ton?.toJson(),
        "mah": mah?.toJson(),
        "bar": bar?.toJson(),
        "hun": hun?.toJson(),
        "bjz": bjz?.toJson(),
        "ltz": ltz?.toJson(),
        "fao": fao?.toJson(),
        "lua": lua?.toJson(),
        "nbl": nbl?.toJson(),
        "nso": nso?.toJson(),
        "zul": zul?.toJson(),
        "sin": sin?.toJson(),
        "lav": lav?.toJson(),
        "ron": ron?.toJson(),
        "mon": mon?.toJson(),
        "nno": nno?.toJson(),
        "nob": nob?.toJson(),
        "smi": smi?.toJson(),
        "tha": tha?.toJson(),
        "nrf": nrf?.toJson(),
        "lao": lao?.toJson(),
        "aze": aze?.toJson(),
        "ber": ber?.toJson(),
        "bul": bul?.toJson(),
        "run": run?.toJson(),
        "sqi": sqi?.toJson(),
        "kat": kat?.toJson(),
        "vie": vie?.toJson(),
        "mey": mey?.toJson(),
        "jpn": jpn?.toJson(),
        "lit": lit?.toJson(),
        "hat": hat?.toJson(),
        "hmo": hmo?.toJson(),
        "tpi": tpi?.toJson(),
        "kir": kir?.toJson(),
        "pau": pau?.toJson(),
        "mlg": mlg?.toJson(),
        "tkl": tkl?.toJson(),
        "slv": slv?.toJson(),
        "som": som?.toJson(),
        "rar": rar?.toJson(),
        "zdj": zdj?.toJson(),
        "niu": niu?.toJson(),
        "gsw": gsw?.toJson(),
        "roh": roh?.toJson(),
        "pih": pih?.toJson(),
        "glv": glv?.toJson(),
        "tgk": tgk?.toJson(),
        "pov": pov?.toJson(),
      };
}

class Ara {
  String? official;
  String? common;

  Ara({
    this.official,
    this.common,
  });

  factory Ara.fromJson(Map<String, dynamic> json) => Ara(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  String? format;
  String? regex;

  PostalCode({
    this.format,
    this.regex,
  });

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}

class Translations {
  Ara? ara;
  Ara? bre;
  Ara? ces;
  Ara? cym;
  Ara? deu;
  Ara? est;
  Ara? fin;
  Ara? fra;
  Ara? hrv;
  Ara? hun;
  Ara? ita;
  Ara? jpn;
  Ara? kor;
  Ara? nld;
  Ara? per;
  Ara? pol;
  Ara? por;
  Ara? rus;
  Ara? slk;
  Ara? spa;
  Ara? srp;
  Ara? swe;
  Ara? tur;
  Ara? urd;
  Ara? zho;

  Translations({
    this.ara,
    this.bre,
    this.ces,
    this.cym,
    this.deu,
    this.est,
    this.fin,
    this.fra,
    this.hrv,
    this.hun,
    this.ita,
    this.jpn,
    this.kor,
    this.nld,
    this.per,
    this.pol,
    this.por,
    this.rus,
    this.slk,
    this.spa,
    this.srp,
    this.swe,
    this.tur,
    this.urd,
    this.zho,
  });

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        ara: json["ara"] == null ? null : Ara.fromJson(json["ara"]),
        bre: json["bre"] == null ? null : Ara.fromJson(json["bre"]),
        ces: json["ces"] == null ? null : Ara.fromJson(json["ces"]),
        cym: json["cym"] == null ? null : Ara.fromJson(json["cym"]),
        deu: json["deu"] == null ? null : Ara.fromJson(json["deu"]),
        est: json["est"] == null ? null : Ara.fromJson(json["est"]),
        fin: json["fin"] == null ? null : Ara.fromJson(json["fin"]),
        fra: json["fra"] == null ? null : Ara.fromJson(json["fra"]),
        hrv: json["hrv"] == null ? null : Ara.fromJson(json["hrv"]),
        hun: json["hun"] == null ? null : Ara.fromJson(json["hun"]),
        ita: json["ita"] == null ? null : Ara.fromJson(json["ita"]),
        jpn: json["jpn"] == null ? null : Ara.fromJson(json["jpn"]),
        kor: json["kor"] == null ? null : Ara.fromJson(json["kor"]),
        nld: json["nld"] == null ? null : Ara.fromJson(json["nld"]),
        per: json["per"] == null ? null : Ara.fromJson(json["per"]),
        pol: json["pol"] == null ? null : Ara.fromJson(json["pol"]),
        por: json["por"] == null ? null : Ara.fromJson(json["por"]),
        rus: json["rus"] == null ? null : Ara.fromJson(json["rus"]),
        slk: json["slk"] == null ? null : Ara.fromJson(json["slk"]),
        spa: json["spa"] == null ? null : Ara.fromJson(json["spa"]),
        srp: json["srp"] == null ? null : Ara.fromJson(json["srp"]),
        swe: json["swe"] == null ? null : Ara.fromJson(json["swe"]),
        tur: json["tur"] == null ? null : Ara.fromJson(json["tur"]),
        urd: json["urd"] == null ? null : Ara.fromJson(json["urd"]),
        zho: json["zho"] == null ? null : Ara.fromJson(json["zho"]),
      );

  Map<String, dynamic> toJson() => {
        "ara": ara?.toJson(),
        "bre": bre?.toJson(),
        "ces": ces?.toJson(),
        "cym": cym?.toJson(),
        "deu": deu?.toJson(),
        "est": est?.toJson(),
        "fin": fin?.toJson(),
        "fra": fra?.toJson(),
        "hrv": hrv?.toJson(),
        "hun": hun?.toJson(),
        "ita": ita?.toJson(),
        "jpn": jpn?.toJson(),
        "kor": kor?.toJson(),
        "nld": nld?.toJson(),
        "per": per?.toJson(),
        "pol": pol?.toJson(),
        "por": por?.toJson(),
        "rus": rus?.toJson(),
        "slk": slk?.toJson(),
        "spa": spa?.toJson(),
        "srp": srp?.toJson(),
        "swe": swe?.toJson(),
        "tur": tur?.toJson(),
        "urd": urd?.toJson(),
        "zho": zho?.toJson(),
      };
}
