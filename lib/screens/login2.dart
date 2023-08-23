import 'package:flutter/material.dart';
import 'package:ept_frontend/services/auth.dart';

class Login2 extends StatelessWidget {
  Login2({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    final bool esPantallaChica = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        body: Center(
            child: esPantallaChica
                ? const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _Logo(),
                      ContenidoForm(),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(32.0),
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: const Row(
                      children: [
                        Expanded(child: _Logo()),
                        Expanded(
                          child: Center(child: ContenidoForm()),
                        ),
                      ],
                    ),
                  )
                )
              );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool esPantallaChica = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/logo.jpeg'),
        const Padding(
          padding: EdgeInsets.all(16.0)          
        ),
      ],
    );
  }
}

class ContenidoForm extends StatefulWidget {
  const ContenidoForm({Key? key}) : super(key: key);
  @override
  State<ContenidoForm> createState() => EstadoContenidoForm();
}

class EstadoContenidoForm extends State<ContenidoForm> {
  bool esVisible = false;
  bool recordarContrasenia = false;  
  String email = '';
  String password = '';
  String error = '';
  
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {                
                // validacion email                
                if (value == null || value.isEmpty) {
                  return 'El email no puede estar vacío';
                }
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return 'Email invalido';
                }

                setState(() {
                  email = value;
                });
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Ingrese su email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La contraseña no puede estar vacía';
                }

                if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }

                setState(() {
                  password = value;
                });
                return null;
              },
              obscureText: !esVisible,
              decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(esVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        esVisible = !esVisible;
                      });
                    },
                  )),
            ),
            _gap(),
            CheckboxListTile(
              value: recordarContrasenia,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  recordarContrasenia = value;
                });
              },
              title: const Text('Recordarme'),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Iniciar Sesion',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () async {
                  dynamic result = await auth.login(email, password);
                  if(!context.mounted) return;
                  Navigator.pop(context);
                  //Falta verificar por las cuentas guardadas en firebase.
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
