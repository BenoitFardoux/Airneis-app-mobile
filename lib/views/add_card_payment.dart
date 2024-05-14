import 'package:flutter/material.dart';

class AddCardPayment extends StatelessWidget {
  const AddCardPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('InputDecoration.label Sample')),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(child: Text('Numéro de carte')),
                        WidgetSpan(
                          child: Text('*', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(child: Text('Mois')),
                              WidgetSpan(
                                child: Text('*',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(child: Text('Année')),
                              WidgetSpan(
                                child: Text('*',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(child: Text('CVV')),
                          WidgetSpan(
                            child:
                                Text('*', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(child: Text('Nom de la carte')),
                        WidgetSpan(
                          child: Text('*', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Paiement effectué');
                },
                child: Text('Payer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
