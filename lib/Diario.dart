import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Diario extends StatefulWidget {
  const Diario({super.key});

  @override
  State<Diario> createState() => _DiarioState();
}

class _DiarioState extends State<Diario> {
  // controller
  // controller do textfield de diario
  TextEditingController _diarioController = TextEditingController();
  // controller do textfield de lista de afazeres
  TextEditingController _listaController = TextEditingController();

  // listas
  // lista de afazeres
  List<String> _afazeres = [];
  // checagem dos itens da lista de afazeres
  List<bool> _isChecked = [];
  // opcoes de cores
  List _opcoes = [];

  // variaveis de codigo
  // cores
  var _corBorda = Colors.transparent;
  var _cores = Colors.amber.shade300;
  var _amarelo = Colors.amber.shade300;
  var _verde = Colors.lightGreen.shade300;
  var _rosa = Colors.pink.shade300;
  var _roxo = Colors.deepPurple.shade300;
  var _azul = Colors.blue.shade300;
  var _corSlider = Colors.pink.shade300;
  var _corCheckbox = Colors.transparent;

  // atributos
  // texto do diario
  String _txtDiario = "";

  // permitir edicao no textfield
  bool _permitirDiario = true;

  // visibilidade
  bool _botaoDiario = false;
  bool _botaoInserirDiario = true;
  bool _visibilityTextinho = false;

  // icons slider
  double _nvlFelicidade = 0;
  String _nvlFelicidadeIcon = "";

  // texto de acordo com o slider
  String _tituloTextinho = "";
  String _textinho = "";

  // escolha de cor radio
  String _escolhaCor = "";

  // verificacao do tema no switch
  bool modoClaro = true;

  // metodos
  // metodo que gera cores aleatorias de acordo com numeros random e muda a cor da borda do texto
  void _coresBorda(){
    _opcoes = [this._amarelo, this._verde, this._rosa, this._roxo, this._azul];

    // gerador de numero random (0, 1, 2, 3, 4)
    var _gerarNum = Random().nextInt(_opcoes.length);

    _corBorda = _opcoes[_gerarNum];
  }

  // metodo que ao enviar o texto do textfield exibe ele na tela formatado e com novas funcoes
  void _enviarTexto(){
    if(_diarioController.text != ""){
      setState(() {
        _txtDiario = _diarioController.text;
        _coresBorda();
        _diarioController.text = "";
        _botaoDiario = true;
        _permitirDiario = false;
        _botaoInserirDiario = false;
      });
    }
  }

  // metodo que edita o texto anteriormente enviado
  void _editarTexto(){
    setState(() {
      _permitirDiario = true;
      _diarioController.text = _txtDiario;
      _corBorda = Colors.transparent;
      _txtDiario = "";
      _botaoDiario = false;
      _botaoInserirDiario = true;
    });
  }

  // metodo que limpa o campo do textfield
  void _limparTexto(){
    setState(() {
      _diarioController.text = "";
    });
  }

  // metodo que deleta o texto anteriormente enviado
  void _deletarTexto(){
    setState(() {
      _permitirDiario = true;
      _txtDiario = "";
      _botaoDiario = false;
      _botaoInserirDiario = true;
      _corBorda = Colors.transparent;
    });
  }

  // metodo que altera o icon do slider
  void _mudarSlider(){
    if(_nvlFelicidade == 0){
      _nvlFelicidadeIcon = "(╥_╥)";
      _corSlider = Colors.deepPurple.shade800;
    } else if(_nvlFelicidade == 1){
      _nvlFelicidadeIcon = "(╯︵╰)";
      _corSlider = Colors.blue.shade700;
    } else if(_nvlFelicidade == 2){
      _nvlFelicidadeIcon = "(⋟﹏⋞)";
      _corSlider = Colors.green.shade600;
    } else if(_nvlFelicidade == 3){
      _nvlFelicidadeIcon = "(￢_￢)";
      _corSlider = Colors.amber.shade500;
    } else if(_nvlFelicidade == 4){
      _nvlFelicidadeIcon = "ヽ(´▽`)/";
      _corSlider = Colors.red.shade400;
    } else if(_nvlFelicidade == 5){
      _nvlFelicidadeIcon = "(♡°▽°♡)";
      _corSlider = Colors.pink.shade300;
    }
  }

  // metodo que altera o texto de acordo com o slider
  void _mudarTextinho(){
    if(_nvlFelicidade == 0){
      _visibilityTextinho = true;
      _tituloTextinho = "(╥_╥) - Você parece estar tendo um dia difícil...";
      _textinho = "Parece que hoje foi difícil e as nuvens parecem ter se acumulado, mas lembre-se, mesmo os dias mais sombrios cedem ao brilho de uma nova aurora! Permita-se descansar, recarregar suas energias e enfrentar o amanhã com renovada esperança. Você é mais forte do que imagina e merece dias melhores.";
    } else if(_nvlFelicidade == 1){
      _visibilityTextinho = true;
      _tituloTextinho = "(╯︵╰) - Você parece estar tendo um dia triste...";
      _textinho = "Quando a tristeza nos envolve, é como se o mundo perdesse um pouco de cor. Mas mesmo nos momentos mais sombrios, lembre-se de que a luz ainda brilha dentro de você! Permita-se sentir, pois cada lágrima é um passo em direção à cura. Você não está sozinho(a). Deixe que aqueles que te amam estejam ao seu lado, compartilhando o peso do seu fardo. Em breve, essa tristeza dará lugar à esperança e ao sorriso.";
    } else if(_nvlFelicidade == 2){
      _visibilityTextinho = true;
      _tituloTextinho = "(⋟﹏⋞) - Você parece estar tendo um dia complicado...";
      _textinho = "Às vezes, a vida nos presenteia com momentos que nos deixam chateados e desanimados. Mas lembre-se, até nas situações mais desafiadoras, há lições a serem aprendidas e crescimento a ser alcançado! Permita-se sentir essa chateação, mas não deixe que ela te consuma.";
    } else if(_nvlFelicidade == 3){
      _visibilityTextinho = true;
      _tituloTextinho = "(￢_￢) - Você parece estar tendo um dia entediante...";
      _textinho = "Quando o tédio parece dominar o momento, lembre-se de que cada instante é uma oportunidade para descobrir algo novo. Permita-se explorar novos hobbies, ler um livro empolgante ou simplesmente contemplar o mundo ao seu redor. Às vezes, as melhores descobertas surgem dos momentos mais simples. Mantenha a mente aberta e curiosa, pois a vida está cheia de surpresas esperando para serem encontradas.";
    } else if(_nvlFelicidade == 4){
      _visibilityTextinho = true;
      _tituloTextinho = "ヽ(´▽`)/ - Você parece estar tendo um dia animado...";
      _textinho = "Que maravilha ver você tão feliz! Seu sorriso irradia luz e contagia a todos ao seu redor. Que este momento de felicidade seja apenas o começo de uma jornada repleta de momentos igualmente especiais. Celebre cada conquista, cada pequena vitória, pois são elas que tornam a vida verdadeiramente memorável. Que sua felicidade transborde e inspire aqueles ao seu redor a buscar alegria em cada dia.";
    } else if(_nvlFelicidade == 5){
      _visibilityTextinho = true;
      _tituloTextinho = "(♡°▽°♡) - Você parece estar tendo um dia muito feliz...";
      _textinho = "Sua felicidade é contagiante e ilumina até os cantos mais sombrios. É inspirador ver você transbordando de alegria, irradiando positividade por onde passa. Que esse momento de felicidade intensa seja apenas o começo de uma jornada repleta de sorrisos e realizações. Que cada dia seja marcado por novas razões para sorrir e que você nunca perca esse brilho especial que torna cada momento mágico.";
    }
  }

  // metodo que adiciona afazeres na lista
  void _addAfazeres(String afazer) {
    setState(() {
      _afazeres.add(afazer);
      _listaController.clear();
      _isChecked.add(false);
    });
  }

  // metodo que gera uma cor aleatoria para o checkbox com base em um numero random
  void _coresChecked(){
    _opcoes = [this._amarelo, this._verde, this._rosa, this._roxo, this._azul];

    // gerador de numero random (0, 1, 2, 3, 4)
    var _gerarNum = Random().nextInt(_opcoes.length);

    _corCheckbox = _opcoes[_gerarNum];
  }

  // metodo que deleta os afazeres concluidos
  void _deletarConcluidos() {
    setState(() {
      for (int i = _isChecked.length - 1; i >= 0; i--) {
        if (_isChecked[i]) {
          _afazeres.removeAt(i);
          _isChecked.removeAt(i);
        }
      }
    });
  }

  // metodo que muda as cores do tema de acordo com o radio
  void _mudarTema() {
    if(_escolhaCor == "amarelo"){
      _cores = _amarelo;
    } else if (_escolhaCor == "verde"){
      _cores = _verde;
    } else if (_escolhaCor == "rosa"){
      _cores = _rosa;
    } else if (_escolhaCor == "roxo"){
      _cores = _roxo;
    } else if (_escolhaCor == "azul"){
      _cores = _azul;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: modoClaro ? ThemeData.light() : ThemeData.dark(), // se modoClaro for true => tema light, se for false => tema dark
      debugShowCheckedModeBanner: false, // nao aparecer o banner de debug no app
      // tab controller
      home: DefaultTabController(
        initialIndex: 1,
        length: 3, // 3 controllers
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Rotina",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _cores
              ),
            ),
            bottom: TabBar(
              splashFactory: NoSplash.splashFactory, // sem efeito splash
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    // remove a cor do focus na tab
                    return states.contains(MaterialState.focused) ? null : Colors.transparent;
                  }
              ),
              indicatorColor: _cores, // cores dos indicadores da tab quando selecionados
              unselectedLabelColor: Colors.grey, // cores dos icons da tab quando nao selecionados
              tabs: [
                // tab 1 - diario
                Tab(
                  icon: Icon(
                      Icons.edit_rounded,
                      color: _cores
                  ),
                ),
                // tab 2 - lista de afazeres
                Tab(
                  icon: Icon(
                      Icons.format_list_bulleted_rounded,
                      color: _cores
                  ),
                ),
                // tab 3 - configuracoes
                Tab(
                  icon: Icon(
                      Icons.settings_rounded,
                      color: _cores
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // tela 1 - diario
              Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: Text(
                                        "Como foi seu dia?",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.deepPurple[200],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            TextField(
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepPurple.withOpacity(0.3)
                                      )),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepPurple.withOpacity(0.3)
                                      )),
                                ),
                                keyboardType: TextInputType.text,
                                enabled: _permitirDiario,
                                maxLines: null,
                                controller: _diarioController
                            ),
                            Visibility(
                              visible: _botaoInserirDiario,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple.shade300)
                                        ),
                                        onPressed: (){
                                          _enviarTexto();
                                          FocusScope.of(context).requestFocus(new FocusNode());
                                        },
                                        child: Text(
                                          "Salvar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10)
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade300)
                                        ),
                                        onPressed: (){
                                          _limparTexto();
                                          FocusScope.of(context).requestFocus(new FocusNode());
                                        },
                                        child: Text(
                                          "Limpar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                            left: BorderSide(
                                              color: _corBorda,
                                              width: 6.0,
                                            ),
                                          )
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          this._txtDiario,
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      )
                                  ),
                                  Visibility(
                                    visible: _botaoDiario,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple.shade300)
                                              ),
                                              onPressed: (){
                                                _editarTexto();
                                                FocusScope.of(context).requestFocus(new FocusNode());
                                              },
                                              child: Icon(
                                                Icons.edit_rounded,
                                                color: Colors.white,
                                              )
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 10)
                                          ),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade300)
                                              ),
                                              onPressed: (){
                                                _deletarTexto();
                                                FocusScope.of(context).requestFocus(new FocusNode());
                                              },
                                              child: Icon(
                                                Icons.delete_rounded,
                                                color: Colors.white,
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Text(
                                    "Dê uma nota para seu dia!",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.pink[200],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child:  Slider(
                                        value: _nvlFelicidade,
                                        min: 0,
                                        max: 5,
                                        divisions: 5,
                                        label: _nvlFelicidadeIcon,
                                        activeColor: _corSlider,
                                        onChanged: (double? novoValor){
                                          setState(() {
                                            _nvlFelicidade = novoValor!;
                                            _mudarSlider();
                                            _mudarTextinho();
                                          });
                                        }
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Visibility(
                                          visible: _visibilityTextinho,
                                          child: Text(
                                            _tituloTextinho,
                                            style: TextStyle(
                                              color: _corSlider,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Visibility(
                                    visible: _visibilityTextinho,
                                    child: Text(
                                      _textinho,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  )
              ),
              // tela 2 - lista de afazeres
              Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "| Lista de afazeres:",
                                  style: TextStyle(
                                      color: _verde,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                            TextField(
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: _verde
                                      )),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: _verde
                                      )),
                                ),
                                keyboardType: TextInputType.text,
                                maxLines: null,
                                controller: _listaController
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(_azul)
                                        ),
                                        onPressed: (){
                                          FocusScope.of(context).requestFocus(new FocusNode());
                                          _addAfazeres(_listaController.text);
                                        },
                                        child: Icon(
                                            Icons.add,
                                            color: Colors.white
                                        )
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(_verde)
                                        ),
                                        onPressed: (){
                                          FocusScope.of(context).requestFocus(new FocusNode());
                                          _deletarConcluidos();
                                        },
                                        child: Text(
                                          "Deletar Concluídos",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600
                                          ),
                                        )
                                    ),
                                  ],
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20)
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: _afazeres.length,
                              itemBuilder: (context, index) {
                                return CheckboxListTile(
                                    title: Text(_afazeres[index]),
                                    activeColor: _corCheckbox,
                                    value: _isChecked[index],
                                    onChanged: (bool? valor){
                                      setState(() {
                                        _coresChecked();
                                        _isChecked[index] = valor!;
                                      });
                                    }
                                );
                              },
                            ),
                          ],
                        ),
                      )
                  )
              ),
              // tela 3 - configuracoes
              Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "| Configurações de Tema",
                              style: TextStyle(
                                  color: _cores,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        SwitchListTile(
                            title: Text("Modo Claro"),
                            activeColor: _cores,
                            value: modoClaro,
                            inactiveTrackColor: _cores.withOpacity(0.5),
                            inactiveThumbColor: _cores,
                            onChanged: (bool? valor){
                              setState(() {
                                modoClaro = valor!;
                              });
                            }
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "| Cores do Tema",
                                style: TextStyle(
                                    color: _azul,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )
                          ],
                        ),
                        RadioListTile(
                          title: Text("Amarelo"),
                          value: "amarelo",
                          activeColor: _amarelo,
                          groupValue: _escolhaCor,
                          onChanged: (String? escolha){
                            setState(() {
                              _escolhaCor = escolha!;
                              _mudarTema();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("Verde"),
                          value: "verde",
                          activeColor: _verde,
                          groupValue: _escolhaCor,
                          onChanged: (String? escolha){
                            setState(() {
                              _escolhaCor = escolha!;
                              _mudarTema();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("Rosa"),
                          value: "rosa",
                          activeColor: _rosa,
                          groupValue: _escolhaCor,
                          onChanged: (String? escolha){
                            setState(() {
                              _escolhaCor = escolha!;
                              _mudarTema();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("Roxo"),
                          value: "roxo",
                          activeColor: _roxo,
                          groupValue: _escolhaCor,
                          onChanged: (String? escolha){
                            setState(() {
                              _escolhaCor = escolha!;
                              _mudarTema();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("Azul"),
                          value: "azul",
                          activeColor: _azul,
                          groupValue: _escolhaCor,
                          onChanged: (String? escolha){
                            setState(() {
                              _escolhaCor = escolha!;
                              _mudarTema();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
