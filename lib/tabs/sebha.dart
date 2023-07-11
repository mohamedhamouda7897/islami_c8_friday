import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaCounter = 0;
  int tsbeehatCounter = 0;
  double angle = 0;
  List<String> tsbeehat = [
    'سبحان الله',
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله",
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin:EdgeInsets.only(left: width*0.1),
                child: Image.asset(
                  'assets/images/head_of_seb7a.png',
                  width: width*0.2,
                  height: height*0.13,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                margin:EdgeInsets.only(top: height*0.1),
                child: Transform.rotate(
                  angle:angle,
                  child: GestureDetector(
                    onTap: (){
                      tsbeeeh();
                    },
                    child: Image.asset(
                      'assets/images/body_of_seb7a.png',
                      fit: BoxFit.fitHeight,
                      height: height*0.27,
                      width: width*0.7,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        SizedBox(
          height: height*0.05,
        ),
        Text(
          "Tsbeehat Number",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400
          ),
        ),
        SizedBox(
          height: height*0.03,
        ),
        Container(
          padding: EdgeInsets.only(
            left: width*0.05,
            right: width*0.05,
            top: height*0.02,
            bottom: height*0.02
          ),
          decoration: BoxDecoration(
            color: Color(0xffB7935F).withOpacity(0.5),
            borderRadius: BorderRadius.circular(25)
          ),
          child: Text(
            sebhaCounter.toString(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        SizedBox(
          height: height*0.03,
        ),
        ElevatedButton(
            onPressed: (){
              tsbeeeh();
            },
            child: Text(
              tsbeehat[tsbeehatCounter],
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              )
            ),
        )
      ],
    );
  }
  void tsbeeeh(){
    if(sebhaCounter==32){
      sebhaCounter = 0;
      if(tsbeehatCounter==3){
        tsbeehatCounter = 0;
      }else{
        tsbeehatCounter++;
      }
    }else{
      sebhaCounter++;
    }
    angle+=20;
    setState(() {

    });
  }
}
