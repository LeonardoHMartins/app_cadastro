// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:app_cadastro/cubit/modal_cubit.dart';

class TelaCadastro extends StatefulWidget {
  ModalCubit cubit;
  TelaCadastro({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nomeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var landscape = MediaQuery.of(context).orientation;
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 637),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cadastro',
                  style: TextStyle(
                    inherit: false,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Insira seus dados para efetuar o cadastro.',
                  style: TextStyle(
                    inherit: false,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  child: TextField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Repita a Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        constraints:
                            const BoxConstraints(maxWidth: 120, minWidth: 80),
                        height: landscape == Orientation.landscape ? 50 : 40,
                        child: FilledButton(
                          onPressed: () {
                            widget.cubit.login();
                          },
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(15),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                          ),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      child: Container(
                        constraints:
                            const BoxConstraints(maxWidth: 120, minWidth: 80),
                        height: landscape == Orientation.landscape ? 50 : 40,
                        child: ElevatedButton(
                          onPressed: () {
                            widget.cubit.cadastroFirebase(
                              _emailController.text,
                              _passwordController.text,
                              _nomeController.text,
                            );
                          },
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(15),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.purple),
                          ),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ja possui uma conta?',
                      style: TextStyle(
                        inherit: false,
                        color: Colors.black,
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          widget.cubit.login();
                        },
                        child: const Text(
                          ' Entrar',
                          style: TextStyle(color: Colors.blue, inherit: false),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        inherit: false,
                        color: Colors.black,
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          widget.cubit.esqueceuSenha();
                        },
                        child: const Text(
                          ' Esqueci a senha',
                          style: TextStyle(color: Colors.blue, inherit: false),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
