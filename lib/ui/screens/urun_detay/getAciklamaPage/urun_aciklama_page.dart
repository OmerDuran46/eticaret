import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eticaret/main.dart';
import 'package:eticaret/ui/screens/urun_detay/getAciklamaPage/i_get_urun_aciklama_page_info_view_model.dart';
import '../../../../core/api/api_response.dart';
import '../i_get_urun_details_page_info_view_model.dart';

class UrunAciklamaPage extends ConsumerStatefulWidget {
  final String urunId;


  const UrunAciklamaPage({
    required this.urunId,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _UrunAciklamaPageState();
}

PageController controller = PageController();

Widget urunDetailsWidgetYeni(
    IGetUrunAciklamaInfoViewModel iGetUrunAciklamaInfoViewModel,) {
  if (iGetUrunAciklamaInfoViewModel.urunAciklamaResponse.status ==
      Status.initial) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  } else if(iGetUrunAciklamaInfoViewModel.urunAciklamaResponse.status ==
      Status.completed) {
    if(iGetUrunAciklamaInfoViewModel.urunAciklamaResponse.data.data!.isEmpty)
      {
        return const Center(child: Text("Ürüne yapılmış bir yorum bulunmamaktadır."),);
      }
    else{

    var yildiz=iGetUrunAciklamaInfoViewModel.urunAciklamaResponse.data.data![0].rate;
     var yorum=iGetUrunAciklamaInfoViewModel.urunAciklamaResponse.data.data![0].comment;
     var yorumBasligi=iGetUrunAciklamaInfoViewModel.urunAciklamaResponse.data.data![0].title;
     String comment;
     String commantTitle;
    if(yorumBasligi==""){
      commantTitle="Yorum başlığı bulunamadı.";
    }
    else{
      commantTitle=yorumBasligi;
    }

    if(yorum==""){
      comment="Ürüne girilen bir açıklama bulunamadı";
    }
    else{
      comment=yorum;
    }
    int a;
    if(yildiz=="1")
      {
        a=1;
      }
    else if(yildiz=="2") {
      a=2;
    } else if(yildiz=="3") {
      a=3;
    } else if(yildiz=="4") {
      a=4;
    } else if(yildiz=="5") {
      a=5;
    }else{
    a=  0;

    }
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Column(
            children: const [
              Text(
                "Ürün Yorumları",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 150,

                  child:  Text(
                    commantTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: a,
                    itemBuilder: (context, index) {
                      return Column(
                        children: const [
                          Icon(Icons.star, color: Colors.red),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50,

                  child:  Text(
                    comment,
                    style: const TextStyle(
                         fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );}
  }else {
    return const Center(child: Text("Yorumlar gelirken sorun oluştu",style: TextStyle(overflow: TextOverflow.ellipsis),));
  }
}

Widget urunDetailsWidget(
    IGetUrunDetailsInfoViewModel iGetUrunDetailsInfoViewModel,
    IGetUrunAciklamaInfoViewModel iGetUrunAciklamaInfoViewModel) {
  if (iGetUrunDetailsInfoViewModel.urunDetailsResponse.status ==
      Status.loading) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  } else if (iGetUrunDetailsInfoViewModel.urunDetailsResponse.status ==
      Status.completed) {
    var urunDetayi =
        iGetUrunDetailsInfoViewModel.urunDetailsResponse.data.data![0].details;
    String urunDetay;
    if(urunDetayi==""){
      urunDetay="Ürüne girilen bir açıklama bulunamadı";
    }
    else{
      urunDetay=urunDetayi;
    }
    return PageView(
      controller: controller,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                const Text("Ürün Açıklama"),
                Center(child: Html(data: urunDetay)),

              ],
            ),
          ),
        ),

        urunDetailsWidgetYeni(iGetUrunAciklamaInfoViewModel),
        const Center(
          child: Text("2"),
        ),
      ],
    );
  } else {
    return const Center(child: Text("Detay sayfası gelirken sorun oluştu",style: TextStyle(overflow: TextOverflow.ellipsis),));
  }
}

class _UrunAciklamaPageState extends ConsumerState<UrunAciklamaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProdutDetails();
    getComment();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    ref.read(iGetUrunDetailsInfoViewModel).urunDetailsResponse.status =
        Status.loading;
    ref.read(iGetUrunAciklamaInfoViewModel).urunAciklamaResponse.status =
        Status.loading;
  }

  getProdutDetails() {
    ref.read(iGetUrunDetailsInfoViewModel).getProductDetails(widget.urunId);
  }

  getComment() {
    ref.read(iGetUrunAciklamaInfoViewModel).getComment(widget.urunId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: urunDetailsWidget(ref.watch(iGetUrunDetailsInfoViewModel),
          ref.watch(iGetUrunAciklamaInfoViewModel)),
    );
  }
}
