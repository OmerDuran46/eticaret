
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eticaret/main.dart';
import 'package:eticaret/ui/screens/homePage/account/price_alarm/get_price_alarm_info_view_model.dart';
import 'package:eticaret/ui/screens/urun_detay/urun_detay_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../core/api/api_response.dart';
import '../../../../splash/splash.dart';


class PricaAlarmPage extends ConsumerStatefulWidget {
  const PricaAlarmPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PricaAlarmPageState();
}

class _PricaAlarmPageState extends ConsumerState<PricaAlarmPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPriceAlarm();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  InkWell(onTap: () {
          Navigator.pop(context);
        },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.pink,
          ),
        ),
        title: const Text(
          "Fiyat Alarm Listem",
          style: TextStyle(color: Colors.pink),
        ),
        centerTitle: true,
      ),
      body: priceAlartWidget(ref.watch(iGetPriceAlarmInfoViewModel),ref.watch(iGetApplicationLoginInfoViewModel)),
    );
  }

  Widget priceAlartWidget(IGetPriceAlarmInfoViewModel iGetPriceAlarmInfoViewModel,IGetApplicationLoginViewModel iGetApplicationLoginViewModel) {
    if (iGetPriceAlarmInfoViewModel.getPriceAlarmResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetPriceAlarmInfoViewModel.getPriceAlarmResponse.status == Status.completed) {
      var priceAlarmList = iGetPriceAlarmInfoViewModel.getPriceAlarmResponse.data;

      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: priceAlarmList.data.length,
          itemBuilder: (context, index) {
            return InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UrunDetayPage(urunId: priceAlarmList.data[index].productId),));
            },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 150,
                child: Material(
                  elevation: 10,
                  shadowColor: Colors.grey,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
                    width: double.infinity,
                    height: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 90,
                          height: 150,
                          child: Ink.image(
                            image: CachedNetworkImageProvider(priceAlarmList.data[index].productData.image.big),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          height: 1,width: 1,color: Colors.red,
                        ),
                        Expanded(
                          child: SizedBox(

                            width: (MediaQuery.of(context).size.width+70) /2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        priceAlarmList.data[index].productData.title,
                                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,  overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    InkWell(onTap: () {
                                        deleteAlarm(priceAlarmList.data[index].alarmId).then((value){
                                          getApplicationToken(iGetApplicationLoginViewModel);
                                          getPriceAlarmRefresh();
                                      });

                                    } ,
                                      child: Container(
                                        height: 25,
                                        alignment: Alignment.topRight,
                                        child: const Icon(Icons.delete),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  ("${double.parse((priceAlarmList.data[index].currentPrice).toStringAsFixed(2))} TL"),
                                  style: const TextStyle(overflow: TextOverflow.ellipsis, color: Colors.red, fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ("${double.parse((priceAlarmList.data[index].alarmPrice).toStringAsFixed(2))} TL"),
                                  style: const TextStyle(overflow: TextOverflow.ellipsis, color: Colors.green, fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),


                                Text(
                                  ("${(priceAlarmList.data[index].alarmDay)} Gün"),
                                  style: const TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black, fontWeight: FontWeight.w500, fontSize:15),
                                ),

                                Text( DateTime.parse(priceAlarmList.data[index].recordTime.toString()).toString()),


                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const Center(
        child: Text("Sorun oluştu."),
      );
    }
  }


  deleteAlarm(alarmId)async{
    await ref.watch(iDeleteAlarmInfoViewModel).deleteAlarm(alarmId);
  }
  getPriceAlarm(){
    ref.read(iGetPriceAlarmInfoViewModel).getPriceAlarm();
  }
  getPriceAlarmRefresh(){
    ref.watch(iGetPriceAlarmInfoViewModel).getPriceAlarm();
  }
  getApplicationToken(IGetApplicationLoginViewModel iGetApplicationLoginViewModel) async {
    await ref.read(iGetApplicationLoginInfoViewModel).applicationLogin();
    String token = iGetApplicationLoginViewModel.applicationLoginResponse.data.data[0].token;
    var applicationToken = Hive.box("ApplicationToken");
    applicationToken.put("token", token);

  }
}
