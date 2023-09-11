import 'package:ept_frontend/services/inscriptionform.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/formulario_inscripcion.dart';

class EnrolmentForm extends StatelessWidget {
  EnrolmentForm({super.key});

  Key? formKey = GlobalKey<FormState>();
  final int kindergartenYears = 5;
  final int primaryYears = 7;
  final int secondaryYears = 5;

  String? name;
  String? surname;
  String? tutorName;
  String? tutorSurname;
  String? email;
  DateTime? birthdate;
  String? level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(
                child: Text(
                  'Formulario de inscripción',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                child: FormContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormContent extends StatefulWidget {
  const FormContent({super.key});

  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  final _formKey = GlobalKey<FormState>();

  final Widget _gap = const SizedBox(
    height: 30,
  );

  String? name;
  String? surname;
  int? studentId;
  DateTime? birthdate;
  String? tutorName;
  String? tutorSurname;
  int? tutorId;
  String? email;
  NivelEducativo? level;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "fecha_nacimiento_alumno": formulario.fecha_nacimiento_alumno.toIso8601String(),

            // Nombre alumno
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? name) {
                if (name == null || name.isEmpty) {
                  return 'El nombre no puede estar vacío';
                }
              },
              decoration: const InputDecoration(
                labelText: 'Nombre del alumno',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? value) {
                setState(() => name = value);
              },
            ),
            _gap,
            // Apellido alumno
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? surname) {
                if (surname == null || surname.isEmpty) {
                  return 'El apellido no puede estar vacío';
                }
              },
              decoration: const InputDecoration(
                labelText: 'Apellido del alumno',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? value) {
                setState(() => surname = value);
              },
            ),
            _gap,
            // DNI alumno
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? studentId) {
                if (studentId == null || studentId.isEmpty) {
                  return 'El DNI del alumno no puede estar vacío';
                }
                //Valida que el dni sea numerico
                if (!RegExp(r'[0-9]*').hasMatch(studentId)) {
                  return 'El DNI debe ser numérico';
                  //Valida que tenga exactamente 8 numeros
                } else if (!RegExp(r'[0-9]{8}').hasMatch(studentId)) {
                  return 'El DNI debe contener 8 digitos. Completar con 0 a la izquierda si tiene menos.';
                }
              },
              decoration: const InputDecoration(
                labelText: 'DNI del alumno',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() => studentId = int.tryParse(value));
                }
              },
            ),
            _gap,
            //Fecha Nacimiento alumno
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Fecha de nacimiento del alumno',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    birthdate = pickedDate;
                    controller.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            _gap,
            // Nombre tutor
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? tutorName) {
                if (tutorName == null || tutorName.isEmpty) {
                  return 'El nombre no puede estar vacío';
                }
              },
              decoration: const InputDecoration(
                labelText: 'Nombre del tutor',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? value) {
                setState(() => tutorName = value);
              },
            ),
            _gap,
            // Apellido tutor
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? tutorSurname) {
                if (tutorSurname == null || tutorSurname.isEmpty) {
                  return 'El apellido no puede estar vacío';
                }
              },
              decoration: const InputDecoration(
                labelText: 'Apellido del tutor',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? value) {
                setState(() => tutorSurname = value);
              },
            ),
            _gap,
            // DNI Tutor
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? tutorId) {
                if (tutorId == null || tutorId.isEmpty) {
                  return 'El DNI del tutor no puede estar vacío';
                }
                //Valida que el dni sea numerico
                if (!RegExp(r'[0-9]*').hasMatch(tutorId)) {
                  return 'El DNI debe ser numérico';
                  //Valida que tenga exactamente 8 numeros
                } else if (!RegExp(r'[0-9]{8}').hasMatch(tutorId)) {
                  return 'El DNI debe contener 8 digitos. Completar con 0 a la izquierda si tiene menos.';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'DNI del tutor',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() => tutorId = int.tryParse(value));
                }
              },
            ),
            _gap,
            // Email tutor
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? email) {
                if (email == null || email.isEmpty) {
                  return 'El email no puede estar vacío';
                }
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email);
                if (!emailValid) {
                  return 'Email invalido';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email del tutor',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? value) {
                setState(() => email = value);
              },
            ),
            _gap,
            //Nivel Educativo
            DropdownMenu<NivelEducativo>(
              width: MediaQuery.of(context).size.width > 600
                  ? 600
                  : MediaQuery.of(context).size.width,
              onSelected: (NivelEducativo? value) {
                setState(() {
                  level = value;
                });
              },
              dropdownMenuEntries: NivelEducativo.values
                  .map<DropdownMenuEntry<NivelEducativo>>(
                      (NivelEducativo value) {
                String label;
                switch (value) {
                  case NivelEducativo.inicial:
                    label = 'Inicial';
                    break;
                  case NivelEducativo.primario:
                    label = 'Primario';
                    break;
                  case NivelEducativo.secundario:
                    label = 'Secundario';
                    break;
                }
                return DropdownMenuEntry<NivelEducativo>(
                  value: value,
                  label: label,
                );
              }).toList(),
              hintText: 'Nivel Educativo',
            ),
            _gap,
            // Aceptar
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
                    'Enviar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    //                   final String apellido_alumno;
                    // final String apellido_tutor;
                    // final String nombre_alumno;
                    // final String nombre_tutor;
                    // final String email_tutor;
                    // final int anio_lectivo;
                    // final int dni_alumno;
                    // final int dni_tutor;
                    // final DateTime fecha_nacimiento_alumno;
                    // final NivelEducativo nivel;
                    FormInscripcion formObject = FormInscripcion(
                      surname!,
                      tutorSurname!,
                      name!,
                      tutorName!,
                      email!,
                      0,
                      studentId!,
                      tutorId!,
                      birthdate!,
                      level!,
                    );
                    bool response = await InscriptionFormService()
                        .grabaFormularioInscripcion(formObject);
                    print(response ? 'se envio bien' : 'se envio mal');
                    if (response) {
                      showDialog(
                          context: super.context,
                          builder: (context) {
                            return AlertDialog(
                              title:
                                  Text('El formulario se envió correctamente'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(super.context),
                                  child: Text('Cerrar'),
                                ),
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: super.context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  "Ocurrio un error en el envio del formulario"),
                              content: Text("ERROR PERRIN"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Aceptar"))
                              ],
                            );
                          });
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
