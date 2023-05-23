// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_cadastro/cubit/modal_cubit.dart';

// ignore: must_be_immutable
class TelaPerfil extends StatefulWidget {
  ModalCubit cubit;
  TelaPerfil({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isNotMobile = size.width > 600;
    return isNotMobile
        ? Scaffold(
            floatingActionButton: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              width: 250,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(Colors.transparent),
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  foregroundColor: MaterialStatePropertyAll(Colors.transparent),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.purple,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.purple,
            ),
            drawer: Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          // mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 9.0,
                              ),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                isSelected: false,
                                highlightColor: Colors.transparent,
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                icon: Icon(
                                  Icons.reorder,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          width: 250,
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.white,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Perfil',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                            height: 60,
                            width: 250,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Colors.white,
                                ),
                              ),
                              onPressed: () {
                                widget.cubit.initial();
                              },
                              child: Text(
                                'Deslogar',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.purple,
                  width: 80,
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.8,
                  constraints: BoxConstraints(
                    maxWidth: 1366,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 40.0,
                      left: 40.0,
                      right: 40.0,
                      top: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Perfil',
                          style: TextStyle(
                            inherit: false,
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Nome',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                            30,
                          ),
                          bottomLeft: Radius.circular(25),
                        ),
                        color: Colors.purple,
                      ),
                      width: size.width,
                      height: 75,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              isSelected: false,
                              highlightColor: Colors.transparent,
                              color: Colors.white,
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: GestureDetector(
                                        onTap: () {},
                                        child: Drawer(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30.0),
                                              bottomRight:
                                                  Radius.circular(30.0),
                                            ),
                                          ),
                                          width: size.width * 0.8,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      // mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 9.0,
                                                          ),
                                                          child: IconButton(
                                                            splashColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            isSelected: false,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            color: Colors.black,
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            icon: Icon(
                                                              Icons.reorder,
                                                              color:
                                                                  Colors.black,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          30,
                                                        ),
                                                      ),
                                                      width: 285,
                                                      height: 56,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                            Colors.white,
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Perfil',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 20.0,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            30,
                                                          ),
                                                        ),
                                                        height: 56,
                                                        width: 285,
                                                        child: ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                              Colors.white,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            widget.cubit
                                                                .login();
                                                          },
                                                          child: Text(
                                                            'Deslogar',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 24,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.reorder,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Perfil',
                              style: TextStyle(
                                inherit: false,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 40),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 60,
                          constraints: BoxConstraints(
                            maxWidth: 200,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.purple),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Salvar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
