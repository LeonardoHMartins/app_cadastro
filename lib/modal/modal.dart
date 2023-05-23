import 'package:app_cadastro/screens/tela_perfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_cadastro/cubit/modal_cubit.dart';
import 'package:app_cadastro/screens/esqueceu_senha.dart';
import 'package:app_cadastro/screens/tela_cadastro.dart';
import 'package:app_cadastro/screens/tela_login.dart';

class Modal extends StatefulWidget {
  const Modal({Key? key}) : super(key: key);

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: GestureDetector(
                      onTap: () {},
                      child: const ModalOptions(),
                    ),
                  ),
                );
              },
            );
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.purple),
          ),
          child: const Text(
            'Entrar',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class ModalOptions extends StatefulWidget {
  const ModalOptions({Key? key}) : super(key: key);

  @override
  State<ModalOptions> createState() => _ModalOptionsState();
}

class _ModalOptionsState extends State<ModalOptions> {
  final cubit = ModalCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModalCubit, ModalState>(
      bloc: cubit,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ModalInitial || state is ModalLogin) {
          return _buildModalContainer(TelaLogin(cubit: cubit));
        } else if (state is ModalEsqueceuSenha) {
          return _buildModalContainer(EsqueceuSenha(cubit: cubit));
        } else if (state is ModalCadastro) {
          return _buildModalContainer(TelaCadastro(cubit: cubit));
        } else if (state is ModalPerfil) {
          return Center(child: TelaPerfil(cubit: cubit));
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildModalContainer(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
