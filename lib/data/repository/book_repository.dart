import '../model/book_model.dart';
import '../../core/database_helper.dart';

class BookRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  // Adicionar um livro
  Future<void> addBook(Book book) async {
    await _databaseHelper.addBook(book.toMap());
  }

  // Listar todos os livros
  Stream<List<Book>> getBooks() {
    return _databaseHelper.getBooks().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return Book.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Atualizar um livro
  Future<void> updateBook(Book book) async {
    await _databaseHelper.updateBook(book.id!, book.toMap());
  }

  // Deletar um livro
  Future<void> deleteBook(String bookId) async {
    await _databaseHelper.deleteBook(bookId);
  }
}
