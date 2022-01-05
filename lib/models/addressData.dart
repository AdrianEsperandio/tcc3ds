class AddressData {
  static const String tableEnderecos = "endereco";
  static const String colIdEndereco = "idEndereco";
  static const String colRuaEndereco = "ruaEndereco";
  static const String colNumeroEndereco = "numeroEndereco";
  static const String colBairroEndereco = "bairroEndereco";
  static const String colCidadeEndereco = "cidadeEndereco";
  static const String colCepEndereco = "cepEndereco";
  static const String colComplementoEndereco = "complementoEndereco";
  static const String colEstadoEndereco = "estadoEndereco";

  String? idEndereco;
  String? ruaEndereco;
  String? numeroEndereco;
  String? bairroEndereco;
  String? cidadeEndereco;
  String? cepEndereco;
  String? complementoEndereco;
  String? estadoEndereco;

  AddressData({
    this.idEndereco,
    this.ruaEndereco,
    this.numeroEndereco,
    this.bairroEndereco,
    this.cidadeEndereco,
    this.cepEndereco,
    this.complementoEndereco,
    this.estadoEndereco,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colIdEndereco: idEndereco,
      colRuaEndereco: ruaEndereco,
      colNumeroEndereco: numeroEndereco,
      colBairroEndereco: bairroEndereco,
      colCidadeEndereco: cidadeEndereco,
      colCepEndereco: cepEndereco,
      colComplementoEndereco: complementoEndereco,
      colEstadoEndereco: estadoEndereco,
    };
    if (idEndereco != null) map[colIdEndereco] = idEndereco;
    return map;
  }

  AddressData.fromMap(Map<String, dynamic> map) {
    idEndereco = map[colIdEndereco];
    ruaEndereco = map[colRuaEndereco];
    numeroEndereco = map[colNumeroEndereco];
    bairroEndereco = map[colBairroEndereco];
    cidadeEndereco = map[colCidadeEndereco];
    cepEndereco = map[colCepEndereco];
    complementoEndereco = map[colComplementoEndereco];
    estadoEndereco = map[colEstadoEndereco];
  }
}
