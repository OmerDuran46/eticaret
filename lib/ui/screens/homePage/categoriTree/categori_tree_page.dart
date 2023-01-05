import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eticaret/ui/screens/homePage/product_list_page/product_list_pages.dart';
import '../../../../core/api/api_response.dart';
import '../../../../main.dart';
import '../search/search_page.dart';
import 'i_get_categori_tree_view_model.dart';

class CategoriTreePage extends ConsumerStatefulWidget {
  const CategoriTreePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CategoriTreePageState();
}

class _CategoriTreePageState extends ConsumerState<CategoriTreePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoriTree();
  }

  @override
  void deactivate() {
    super.deactivate();
    ref.read(iGetCategoriTreeInfoViewModel).categoriTreeResponse.status = Status.loading;
  }

  Widget kategoriWidget(IGetCategoriTreeInfoViewModel iGetCategoriTreeInfoViewModel) {
    if (iGetCategoriTreeInfoViewModel.categoriTreeResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetCategoriTreeInfoViewModel.categoriTreeResponse.status == Status.completed) {
      var categoriList = iGetCategoriTreeInfoViewModel.categoriTreeResponse.data.data!;
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            color: Colors.grey.shade300,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 40,
            child: const Text("Kategoriler",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          ),
          SizedBox(
            width: double.infinity,
            height: 590,

            child: ListView.builder(
              itemCount: categoriList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => ProductListPage(categoriList[index].id),));
                    },
                      child: ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        title: Text(categoriList[index].text),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    } else {
      return const Center(
        child: Text("Kategoriler gelirken hata oluştu"),
      );
    }
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
        centerTitle: true,
      ),
      body: kategoriWidget(ref.watch(iGetCategoriTreeInfoViewModel)),
    );
  }

  getCategoriTree() {
    ref.read(iGetCategoriTreeInfoViewModel).getCategoriTree();
  }
}
