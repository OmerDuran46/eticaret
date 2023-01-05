// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mvvm/main.dart';
//
// import '../../../core/api/api_response.dart';
//
// class GetProductInfoPage extends ConsumerStatefulWidget {
//   const GetProductInfoPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   ConsumerState createState() => _GetProductInfoPageState();
// }
//
// class _GetProductInfoPageState extends ConsumerState<GetProductInfoPage> {
//   Widget body(IGetProductInfoViewModel iGetProductInfoViewModel) {
//     if (iGetProductInfoViewModel.productFindResponse.status == Status.loading) {
//       return Center(
//         child: CupertinoActivityIndicator(),
//       );
//     } else if (iGetProductInfoViewModel.productFindResponse.status ==
//         Status.completed) {
//       return Center(
//           child: Text(iGetProductInfoViewModel
//               .productFindResponse.data.data!.products![1].title));
//     } else {
//       return Center(
//         child: Text("Ürün gelirken hata oluştu"),
//       );
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getProduct();
//   }
//
//   @override
//   void deactivate() {
//     // TODO: implement deactivate
//     super.deactivate();
//     ref.read(iGetProductInfoViewModel).productFindResponse.status =
//         Status.loading;
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Product list"),
//         centerTitle: true,
//       ),
//       body: body(
//         ref.watch(iGetProductInfoViewModel),
//       ),
//       drawer: Drawer(
//         child: ListView(children: const [
//           Text("Elbiseler"),
//
//
//         ]) ,
//       ),
//     );
//   }
//
//   getProduct() {
//     ref.read(iGetProductInfoViewModel).getProductList();
//   }
// }
