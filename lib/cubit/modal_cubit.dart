// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'modal_state.dart';

class ModalCubit extends Cubit<ModalState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ModalCubit() : super(ModalInitial());

  void login() => emit(ModalLogin());

  void cadastro() => emit(ModalCadastro());

  void initial() => emit(ModalInitial());

  void esqueceuSenha() => emit(ModalEsqueceuSenha());

  void cancelar() => emit(ModalInitial());

  void perfil() => emit(ModalPerfil());

  void _showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.purple,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void cadastroFirebase(
    email,
    password,
    nome,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential != null) {
        _showToast('Cadastro concluido');
        emit(ModalLogin());
      } else {
        _showToast(
          'Nao funcionou o cadastro',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        _showToast(
          'Email inválido',
        );
      } else if (e.code == 'weak-password') {
        _showToast(
          'Senha fraca',
        );
      } else if (e.code == 'email-already-in-use') {
        _showToast(
          'Email ja em uso',
        );
      } else {
        _showToast(
          'Preencha todos os campos',
        );
      }
    }
  }

  void loginFirebase(emailController, passwordController) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );
      if (userCredential != null) {
        _showToast(
          'Logado',
        );
        emit(ModalPerfil());
      } else {
        _showToast(
          'Não funcionou o login',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        _showToast(
          'Email inválido',
        );
      } else if (e.code == 'user-not-found') {
        _showToast(
          'Email não encontrado',
        );
      } else if (e.code == 'wrong-password') {
        _showToast(
          'Senha não encontrada',
        );
      } else {
        _showToast(
          'Preencha todos os campos',
        );
      }
    }
  }

  void resetPasswordFirebase(emailController) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: emailController);
      if (emailController != '') {
        _showToast(
          'E-mail de redefinição de senha enviado com sucesso!',
        );
      }
    } on FirebaseAuthException {
      _showToast(
        'Erro ao enviar o e-mail de redefinição de senha, insira um email válido.',
      );
    }
  }
}
