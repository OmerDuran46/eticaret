import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContantUsPage extends ConsumerStatefulWidget {
  const ContantUsPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ContantUsPageState();
}

class _ContantUsPageState extends ConsumerState<ContantUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(onTap:() {
         Navigator.pop(context);
        } ,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.pink,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Bize Ulaşın",
          style: TextStyle(
            color: Colors.pink,
          ),
        ),
      ),
      body: Material(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 1,
                ),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Firma Adı Ve Adres",style: TextStyle(color: Colors.pink),),
                    SizedBox(height: 5,),
                    Text("T-Soft E-ticaret Sistemleri, Avşar Mahallesi"),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 1,
                ),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Müşteri Hizmetleri",style: TextStyle(color: Colors.pink),),
                    SizedBox(height: 5,),
                    Text("212 612 44 55"),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 1,
                ),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Telefon",style: TextStyle(color: Colors.pink),),
                    SizedBox(height: 5,),
                    Text("212 612 44 55"),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 1,
                ),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Toptan Sipariş",style: TextStyle(color: Colors.pink),),
                    SizedBox(height: 5,),
                    Text("212 612 44 55"),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 1,
                ),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Firma Adres",style: TextStyle(color: Colors.pink),),
                    SizedBox(height: 5,),
                    Text("Avşar Mahallesi Batı Çevre Yolu Bulvarı Teknokent"),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 1,
                ),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("E-Mail",style: TextStyle(color: Colors.pink),),
                    SizedBox(height: 5,),
                    Text("omer.duran@tsoft.com.tr"),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 1,
                ),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Vergi Dairesi",style: TextStyle(color: Colors.pink),),
                    SizedBox(height: 5,),
                    Text("Esenler"),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 1,
                ),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Vergi Numarası",style: TextStyle(color: Colors.pink),),
                    SizedBox(height: 5,),
                    Text("545 651 8464"),
                  ],
                )),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
