import 'package:flutter/material.dart';
import '../../data/repository/book_repository.dart';
import '../../data/model/book_model.dart';

class BookViewModel with ChangeNotifier {
  final BookRepository _bookRepository = BookRepository();

  // Adicionar um livro
  Future<void> addBook(Book book) async {
    await _bookRepository.addBook(book);
    notifyListeners();
  }

  // Listar todos os livros
  Stream<List<Book>> getBooks() {
    return _bookRepository.getBooks();
  }

  // Atualizar um livro
  Future<void> updateBook(Book book) async {
    await _bookRepository.updateBook(book);
    notifyListeners();
  }

  // Deletar um livro
  Future<void> deleteBook(String bookId) async {
    await _bookRepository.deleteBook(bookId);
    notifyListeners();
  }
}
