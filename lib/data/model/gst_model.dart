class GstModel {
  GstModel({
    this.onlyPan,
    this.data,
  });

  bool? onlyPan;
  PangstmodelData? data;

  factory GstModel.fromJson(Map<String, dynamic> json) => GstModel(
        onlyPan: json["ONLY_PAN"],
        data: PangstmodelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "ONLY_PAN": onlyPan,
        "data": data!.toJson(),
      };
}

class PangstmodelData {
  PangstmodelData({
    this.error,
    this.data,
  });

  bool? error;
  DataData? data;

  factory PangstmodelData.fromJson(Map<String, dynamic> json) =>
      PangstmodelData(
        error: json["error"],
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
      };
}

class DataData {
  DataData({
    this.stjCd,
    this.stj,
    this.lgnm,
    this.dty,
    this.adadr,
    this.cxdt,
    this.gstin,
    this.nba,
    this.lstupdt,
    this.rgdt,
    this.ctb,
    this.pradr,
    this.sts,
    this.tradeNam,
    this.ctjCd,
    this.ctj,
  });

  String? stjCd;
  String? stj;
  String? lgnm;
  String? dty;
  List<dynamic>? adadr;
  String? cxdt;
  String? gstin;
  List<String>? nba;
  String? lstupdt;
  String? rgdt;
  String? ctb;
  Pradr? pradr;
  String? sts;
  String? tradeNam;
  String? ctjCd;
  String? ctj;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        stjCd: json["stjCd"],
        stj: json["stj"],
        lgnm: json["lgnm"],
        dty: json["dty"],
        adadr: List<dynamic>.from(json["adadr"].map((x) => x)),
        cxdt: json["cxdt"],
        gstin: json["gstin"],
        nba: List<String>.from(json["nba"].map((x) => x)),
        lstupdt: json["lstupdt"],
        rgdt: json["rgdt"],
        ctb: json["ctb"],
        pradr: Pradr.fromJson(json["pradr"]),
        sts: json["sts"],
        tradeNam: json["tradeNam"],
        ctjCd: json["ctjCd"],
        ctj: json["ctj"],
      );

  Map<String, dynamic> toJson() => {
        "stjCd": stjCd,
        "stj": stj,
        "lgnm": lgnm,
        "dty": dty,
        "adadr": List<dynamic>.from(adadr!.map((x) => x)),
        "cxdt": cxdt,
        "gstin": gstin,
        "nba": List<dynamic>.from(nba!.map((x) => x)),
        "lstupdt": lstupdt,
        "rgdt": rgdt,
        "ctb": ctb,
        "pradr": pradr!.toJson(),
        "sts": sts,
        "tradeNam": tradeNam,
        "ctjCd": ctjCd,
        "ctj": ctj,
      };
}

class Pradr {
  Pradr({
    this.addr,
    this.ntr,
  });

  Addr? addr;
  String? ntr;

  factory Pradr.fromJson(Map<String, dynamic> json) => Pradr(
        addr: Addr.fromJson(json["addr"]),
        ntr: json["ntr"],
      );

  Map<String, dynamic> toJson() => {
        "addr": addr!.toJson(),
        "ntr": ntr,
      };
}

class Addr {
  Addr({
    this.bnm,
    this.st,
    this.loc,
    this.bno,
    this.dst,
    this.stcd,
    this.city,
    this.flno,
    this.lt,
    this.pncd,
    this.lg,
  });

  String? bnm;
  String? st;
  String? loc;
  String? bno;
  String? dst;
  String? stcd;
  String? city;
  String? flno;
  String? lt;
  String? pncd;
  String? lg;

  factory Addr.fromJson(Map<String, dynamic> json) => Addr(
        bnm: json["bnm"],
        st: json["st"],
        loc: json["loc"],
        bno: json["bno"],
        dst: json["dst"],
        stcd: json["stcd"],
        city: json["city"],
        flno: json["flno"],
        lt: json["lt"],
        pncd: json["pncd"],
        lg: json["lg"],
      );

  Map<String, dynamic> toJson() => {
        "bnm": bnm,
        "st": st,
        "loc": loc,
        "bno": bno,
        "dst": dst,
        "stcd": stcd,
        "city": city,
        "flno": flno,
        "lt": lt,
        "pncd": pncd,
        "lg": lg,
      };
}
