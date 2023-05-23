// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:app_cadastro/cubit/modal_cubit.dart';

class TelaLogin extends StatefulWidget {
  ModalCubit cubit;
  TelaLogin({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var landscape = MediaQuery.of(context).orientation;
    return Container(
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
                'Login',
                style: TextStyle(
                  inherit: false,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Entre com seu email e senha para acessar a página.',
                style: TextStyle(
                  inherit: false,
                  fontSize: 16,
                  color: Colors.black,
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
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      constraints:
                          const BoxConstraints(maxWidth: 120, minWidth: 80),
                      height: landscape == Orientation.landscape ? 50 : 40,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
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
                          widget.cubit.loginFirebase(
                            _emailController.text,
                            _passwordController.text,
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
                          'Entrar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                    'Não possui uma conta?',
                    style: TextStyle(
                      inherit: false,
                      color: Colors.black,
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        widget.cubit.cadastro();
                      },
                      child: const Text(
                        ' Cadastre-se',
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
                        style: TextStyle(
                          color: Colors.blue,
                          inherit: false,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
