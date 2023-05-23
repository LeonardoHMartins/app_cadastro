import 'package:flutter/material.dart';
import 'package:app_cadastro/cubit/modal_cubit.dart';

class EsqueceuSenha extends StatefulWidget {
  final ModalCubit cubit;

  const EsqueceuSenha({Key? key, required this.cubit}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EsqueceuSenhaState createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final landscape = MediaQuery.of(context).orientation;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 637),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Esqueceu a senha',
                style: TextStyle(
                  inherit: false,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Digite seu email para recuperar sua senha.',
                style: TextStyle(
                  inherit: false,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Material(
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 120,
                        minWidth: 80,
                      ),
                      height: landscape == Orientation.landscape ? 50 : 40,
                      child: FilledButton(
                        onPressed: widget.cubit.login,
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(15),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
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
                  const SizedBox(width: 35),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 120,
                        minWidth: 80,
                      ),
                      height: landscape == Orientation.landscape ? 50 : 40,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.cubit.resetPasswordFirebase(
                            _emailController.text,
                          );
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(15),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                        ),
                        child: const Text(
                          'Confirmar',
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
            ],
          ),
        ),
      ),
    );
  }
}
