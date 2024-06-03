import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_second/views/main_app.dart';

class LegalNoticeWidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainApp(body: LegalNoticeWidget());
  }
}

class LegalNoticeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
                color: const Color.fromARGB(255, 2, 2, 2), fontSize: 16),
            text:
                "ÀIRNEIS, société écossaise avec siège social situé au [adresse complète, Écosse], est enregistrée au Registre du Commerce sous le numéro [numéro]. Téléphone: [numéro de téléphone].\n\nResponsable de publication: [Nom du Responsable], Adresse email pour contact: contact@airneis.com.\n\nLe site est hébergé par [Nom de l’hébergeur], [Adresse de l’hébergeur, inclure pays si hors UE].",
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicyWidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainApp(body: PrivacyPolicyWidget());
  }
}

class PrivacyPolicyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              color: const Color.fromARGB(255, 2, 2, 2), fontSize: 16),
          text:
              "ÀIRNEIS prend votre vie privée très au sérieux et s'engage à protéger vos informations personnelles. Cette notice explique comment nous collectons, utilisons et partageons vos données personnelles en relation avec l'utilisation de notre site e-commerce et de nos services.\n\nCollecte des données: Nous collectons des informations que vous nous fournissez directement, ainsi que des données relatives à votre navigation sur notre site, via des technologies de suivi.\n\nUtilisation des données: Vos données nous permettent de gérer vos commandes, d'améliorer notre service client, et, avec votre consentement, de vous envoyer des informations commerciales. Nous utilisons également vos données pour l'amélioration continue de nos services.\n\nPartage des données: Nous ne vendons pas vos données et ne les partageons qu'avec des partenaires de confiance qui nous aident à opérer notre service, toujours dans le respect des lois sur la protection des données.\n\nSécurité: Nous appliquons des mesures strictes pour protéger vos données contre l'accès non autorisé, la modification, la divulgation ou la destruction.",
        ),
      ),
    );
  }
}

class TermsAndConditionsWidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainApp(body: TermsAndConditionsWidget());
  }
}

class TermsAndConditionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              color: const Color.fromARGB(255, 2, 2, 2), fontSize: 16),
          children: <TextSpan>[
            TextSpan(
                text:
                    "Les présentes Conditions Générales régissent l'utilisation des services et de la plateforme e-commerce d'ÀIRNEIS. Toute utilisation du site signifie l'acceptation intégrale des conditions ci-après décrites. ÀIRNEIS se réserve le droit de modifier ces conditions à tout moment.\n\nUtilisation du service: Le service est réservé à un usage personnel et non commercial. Les informations produits, y compris les prix, sont sujets à modification sans préavis.\n\nPropriété intellectuelle: Tous les contenus, y compris les textes, graphismes et images, sont protégés par le droit d'auteur et appartiennent à ÀIRNEIS ou à ses partenaires. Toute utilisation non autorisée peut faire l'objet de poursuite judiciaire.\n\n"),
            TextSpan(
              text:
                  "Pour en savoir plus sur comment nous gérons vos données personnelles, veuillez consulter notre ",
            ),
            TextSpan(
              text: "Politique de Confidentialité.",
              style: TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyWidgetScreen()),
                  );
                },
            ),
            TextSpan(
              text:
                  "\n\nPartage des données: Nous ne vendons pas vos données et ne les partageons qu'avec des partenaires de confiance qui nous aident à opérer notre service, toujours dans le respect des lois sur la protection des données.\n\nSécurité: Nous appliquons des mesures strictes pour protéger vos données contre l'accès non autorisé, la modification, la divulgation ou la destruction.",
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsWidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainApp(body: AboutUsWidget());
  }
}

class AboutUsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("À propos de ÀIRNEIS"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Chez ÀIRNEIS, nous croyons que chaque meuble doit raconter une histoire. Fondée en 2015 par Ewan McGregor et Siobhan MacDougal, deux passionnés de design et d'héritage écossais, notre entreprise était initialement un petit atelier à Edimbourg, dédié à la restauration de meubles anciens. Inspirés par la richesse de la culture écossaise et son histoire fascinante, Ewan et Siobhan ont commencé à concevoir leurs propres pièces, en combinant des motifs traditionnels avec une esthétique moderne.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Image.network(
                  'https://arnaudrein.wordpress.com/wp-content/uploads/2024/06/atelier_airneis.webp?w=1024'), // Replace with actual URL
              SizedBox(height: 20),
              Text(
                "'Le design est l'ambassadeur silencieux de votre marque.' — Paul Rand",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Image.network(
                  'https://arnaudrein.wordpress.com/wp-content/uploads/2024/06/boutique.webp?w=1024'), // Replace with actual URL
              SizedBox(height: 20),
              Text(
                "Nous sommes fiers de contribuer à l'économie locale en employant des artisans locaux et en utilisant des matériaux écologiquement responsables. Chaque pièce est fabriquée à la main avec une attention méticuleuse aux détails, garantissant non seulement un design magnifique mais aussi une durabilité exceptionnelle.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Notre voyage continue, et chaque nouveau design s'inspire des histoires, des paysages et des gens de l'Écosse. Nous vous remercions de faire partie de cette aventure.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
