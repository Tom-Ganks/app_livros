class Book {
  String? id;
  String titulo;
  String autor;
  String descricao;
  double avaliacao;
  String? imageUrl;

  Book({
    this.id,
    required this.titulo,
    required this.autor,
    required this.descricao,
    required this.avaliacao,
    this.imageUrl,
  });

  // Método para converter o objeto Book em um Map
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'autor': autor,
      'descricao': descricao,
      'avaliacao': avaliacao,
      'imageUrl': imageUrl,
    };
  }

  // Método para criar um objeto Book a partir de um Map
  factory Book.fromMap(Map<String, dynamic> map, String id) {
    return Book(
      id: id,
      titulo: map['titulo'],
      autor: map['autor'],
      descricao: map['descricao'],
      avaliacao: map['avaliacao'],
      imageUrl: map['imageUrl'],
    );
  }
}
