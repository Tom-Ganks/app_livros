import 'package:flutter/material.dart';
import '../viewmodels/book_viewmodel.dart';
import '../../data/model/book_model.dart';

class BookRegisterPage extends StatefulWidget {
  const BookRegisterPage({super.key});

  @override
  _BookRegisterPageState createState() => _BookRegisterPageState();
}

class _BookRegisterPageState extends State<BookRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _autorController = TextEditingController();
  final _descricaoController = TextEditingController();
  double _avaliacao = 0;

  final BookViewModel _viewModel = BookViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Livro'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o título';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _autorController,
                decoration: InputDecoration(labelText: 'Autor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o autor';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Avaliação: $_avaliacao'),
              Slider(
                value: _avaliacao,
                min: 0,
                max: 5,
                divisions: 5,
                onChanged: (value) {
                  setState(() {
                    _avaliacao = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Book book = Book(
                      titulo: _tituloController.text,
                      autor: _autorController.text,
                      descricao: _descricaoController.text,
                      avaliacao: _avaliacao,
                    );
                    _viewModel.addBook(book);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
