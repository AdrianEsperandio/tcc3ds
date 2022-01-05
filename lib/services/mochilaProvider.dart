import 'package:tcc3ds/models/bookData.dart';

class MochilaProvider {
  static final Map<int, BookData> _itensMochila = {};

  static void adicionarItem(BookData livro) {
    _itensMochila[livro.idLivro!] = livro;
  }

  static void deletarItem(int index) {
    _itensMochila.remove(index);
  }

  static BookData getItem(int idLivro) => _itensMochila[idLivro]!;

  operator [](int i) => _itensMochila[i];

  static Iterable<BookData> get listaLivros => _itensMochila.values;

  static int get length => _itensMochila.length;

  static Map<int, BookData> get mapaLivros => _itensMochila;

  static BookData getTitulo(String tituloLivro) => _itensMochila[tituloLivro]!;
}
