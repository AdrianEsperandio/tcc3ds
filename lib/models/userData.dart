class UserData {
  static const tableUsuario = "usuario";
  static const colNomeUsuario = "nomeUsuario";
  static const colSobrenomeUsuario = "sobrenomeUsuario";
  static const colCpfUsuario = "cpfUsuario";
  static const colEmailUsuario = "emailUsuario";
  static const colSenhaUsuario = "senhaUsuario";
  static const colTelefoneUsuario = "telefoneUsuario";
  static const colDataNasc = "dataNasc";
  static const colFotoUsuario = "fotoUsuario";

  String? nomeUsuario;
  String? sobrenomeUsuario;
  String? cpfUsuario;
  String? emailUsuario;
  String? senhaUsuario;
  String? telefoneUsuario;
  String? dataNasc;
  String? fotoUsuario;

  UserData({
    this.nomeUsuario,
    this.sobrenomeUsuario,
    this.cpfUsuario,
    this.emailUsuario,
    this.senhaUsuario,
    this.telefoneUsuario,
    this.dataNasc,
    this.fotoUsuario,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colNomeUsuario: nomeUsuario,
      colSobrenomeUsuario: sobrenomeUsuario,
      colCpfUsuario: cpfUsuario,
      colEmailUsuario: emailUsuario,
      colSenhaUsuario: senhaUsuario,
      colTelefoneUsuario: telefoneUsuario,
      colDataNasc: dataNasc,
      colFotoUsuario: fotoUsuario,
    };
    if (cpfUsuario != null) map[colCpfUsuario] = cpfUsuario;
    return map;
  }

  UserData.fromMap(Map<String, dynamic> map) {
    cpfUsuario = map[colCpfUsuario];
    nomeUsuario = map[colNomeUsuario];
    sobrenomeUsuario = map[colSobrenomeUsuario];
    emailUsuario = map[colEmailUsuario];
    senhaUsuario = map[colSenhaUsuario];
    telefoneUsuario = map[colTelefoneUsuario];
    dataNasc = map[colDataNasc];
    fotoUsuario = map[colFotoUsuario];
  }
}
