import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatelessWidget {
  static const routeName = 'booking';
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Data Pemesan',
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              // header(),
              // const SizedBox(height: 15),
              Stepper(
                controlsBuilder: 
                (BuildContext context, ControlsDetails controls) {
                  return Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Selanjutnya'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Batal'),
                      ),
                    ],
                  );
                },
                steps: [
                  Step(
                    state: StepState.complete,
                    title: const Text('Data Pemesan'),
                    content: Column(
                      children: <Widget>[
                        const SizedBox(height: 15),
                        Text(
                          'Silahkan isi data pemesan',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            labelStyle: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'No. HP',
                            labelStyle: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Alamat',
                            labelStyle: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Kode Pos',
                            labelStyle: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
