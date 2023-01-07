import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eticaret/ui/screens/homePage/account/login_control_page/login_control_pages.dart';
import 'package:eticaret/ui/screens/homePage/product_list_page/product_list_pages.dart';
import 'package:eticaret/ui/screens/homePage/search/search_page.dart';
import '../../../../core/api/api_response.dart';
import '../../../../main.dart';
import '../../urun_detay/urun_detay_page.dart';
import '../addToCart/i_search_info_view_model.dart';
import '../i_get_home_page_info_view_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePages extends ConsumerStatefulWidget {
  const HomePages({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePagesState();
}

class _HomePagesState extends ConsumerState<HomePages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 20,
                height: 60,
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    enabled: false,
                    suffixIcon: const Icon(
                      Icons.mic_none_outlined,
                      color: Colors.black87,
                    ),
                    hintText: "Burada Ara",
                    hintStyle: const TextStyle(
                      fontSize: 13,
                    ),
                    prefixIcon: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.black87,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          title: CachedNetworkImage(
            imageUrl: "https://omerduran.1ticaret.com/Data/EditorFiles/tsoftmagaza_logo.png",
            fit: BoxFit.cover,
            width: 150,
          ),
          centerTitle: true),
      body: home(
        ref.watch(iGetIndexInfoViewModel),
      ),
    );
  }

  Widget home(
    IGetIndexInfoViewModel iGetIndexInfoViewModel,
  ) {
    if (iGetIndexInfoViewModel.indexResponse.status == Status.loading) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (iGetIndexInfoViewModel.indexResponse.status == Status.completed) {
      var storyImage = iGetIndexInfoViewModel.indexResponse.data.data!.list[0].options;
      var sliderImage = iGetIndexInfoViewModel.indexResponse.data.data!.list[1].options;
      var sliderUrunBilgi = iGetIndexInfoViewModel.indexResponse.data.data!.list[2].options;
      var banner1 = iGetIndexInfoViewModel.indexResponse.data.data!.list[3].options;
      var banner2 = iGetIndexInfoViewModel.indexResponse.data.data!.list[4].options;
      var banner3 = iGetIndexInfoViewModel.indexResponse.data.data!.list[5].options;
      var banner4 = iGetIndexInfoViewModel.indexResponse.data.data!.list[6].options;

      return ListView(
        children: [
          SizedBox(
              width: double.infinity,
              height: 143,
              child: ListView.builder(
                padding: const EdgeInsets.all(13),
                scrollDirection: Axis.horizontal,
                itemCount: storyImage.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductListPage(storyImage[index].id.toString()),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: listeElemani(storyImage[index].image, storyImage[index].name),
                    ),
                  );
                },
              )),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                sliderElemani(sliderImage[0].image),
                sliderElemani(sliderImage[1].image),
                sliderElemani(sliderImage[2].image),
                sliderElemani(sliderImage[3].image),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginControlPage(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 30,
              child: const Center(
                  child: Text(
                "Çok Satanlar",
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
            ),
          ),
          SizedBox(
            width: 200,
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sliderUrunBilgi.length,
              itemBuilder: (BuildContext context, int index) {
                var productId = sliderUrunBilgi[index].id;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UrunDetayPage(
                          urunId: productId!.toString(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.pink,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(
                              1,
                            ),
                            child: sliderUrun(
                              sliderUrunBilgi[index].image,
                              sliderUrunBilgi[index].name.toString(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Text(
                            ("${double.parse((sliderUrunBilgi[index].price_sell * (1 + 18 / 100)).toStringAsFixed(2))}  TL"),
                            style: GoogleFonts.poppins(color: Colors.red)

                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image(image: CachedNetworkImageProvider(banner1[0].image), fit: BoxFit.fill, height: 250)),
              const SizedBox(height: 5),
              SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image(image: CachedNetworkImageProvider(banner2[0].image), fit: BoxFit.fill, height: 250)),
              const SizedBox(height: 5),
              SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image(image: CachedNetworkImageProvider(banner3[0].image), fit: BoxFit.fill, height: 250)),
              const SizedBox(height: 5),
              SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image(image: CachedNetworkImageProvider(banner4[0].image), fit: BoxFit.fill, height: 250)),
              const SizedBox(height: 5),
              SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image(image: CachedNetworkImageProvider(banner1[0].image), fit: BoxFit.fill, height: 250)),
            ],
          ),
        ],
      );
    } else {
      return const Center(
        child: Text(
          "Anasayfa oluşurken hata oluştu",
        ),
      );
    }
  }

  addToCart({
    productCount,
    productId,
  }) async {
    await ref.watch(iGetAddToCartInfoViewModel).addToCard(productCount, productId, "");
  }

  gelenMesaj(IGetAddToCartInfoViewModel iGetAddToCartInfoViewModel) {
    return iGetAddToCartInfoViewModel.addToCartResponse.data.message[0].text[0].toString();
  }

  sliderUrun(String sliderUrunImage, String procutName) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 190,
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      sliderUrunImage,
                    ),
                    fit: BoxFit.fill),
              ),
              child: const Text(""),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 100,
          height: 35,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    procutName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Colors.black,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }

  sliderElemani(String sliderImage) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  sliderImage,
                ),
                fit: BoxFit.fill),
          ),
          child: const Text(""),
        ),
      ],
    );
  }

  listeElemani(String oresim, String storyTitle) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                border: Border.all(width: 1, color: Colors.red),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.pink,
                    blurRadius: 1,
                    spreadRadius: 0.1,
                    offset: Offset(0, 0),
                  )
                ],
                image: DecorationImage(image: CachedNetworkImageProvider(oresim), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: 70,
          height: 20,
          child: Center(
            child: Text(
              storyTitle,
              style: const TextStyle(fontFamily: 'Montserrat', fontSize: 15, overflow: TextOverflow.ellipsis, color: Colors.pink),
            ),
          ),
        )
      ],
    );

  }

  getIndex() {
    ref.read(iGetIndexInfoViewModel).getIndex();
  }
}
