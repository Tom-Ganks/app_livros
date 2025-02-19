import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para adicionar um livro
  Future<void> addBook(Map<String, dynamic> bookData) async {
    try {
      await _firestore.collection('books').add(bookData);
    } catch (e) {
      print("Erro ao adicionar livro: $e");
    }
  }

  // Método para listar todos os livros
  Stream<QuerySnapshot> getBooks() {
    return _firestore.collection('books').snapshots();
  }

  // Método para atualizar um livro
  Future<void> updateBook(
      String bookId, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection('books').doc(bookId).update(updatedData);
    } catch (e) {
      print("Erro ao atualizar livro: $e");
    }
  }

  // Método para deletar um livro
  Future<void> deleteBook(String bookId) async {
    try {
      await _firestore.collection('books').doc(bookId).delete();
    } catch (e) {
      print("Erro ao deletar livro: $e");
    }
  }
}
