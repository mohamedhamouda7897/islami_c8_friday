import 'package:flutter/material.dart';
class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => SebhaTabState();
}

class SebhaTabState extends State<SebhaTab> {
  int sebhaCount = 0;
  double angle = 0;
  int tasbehatCounter = 0;
  List<String> tasbehat=[
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا حول ولا قوه الا بالله'
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
                padding: EdgeInsets.only(left: width*.10),
                child: Image.asset('assets/images/head_of_seb7a.png',
                  height:height*.13,
                  width: width*.17,
                fit: BoxFit.fitHeight,),
              ),
              Transform.rotate(
                angle: 25.0,
                child: Container(
                  margin: EdgeInsets.only(top: height*.1),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: tasbeh,
                    child: Image.asset('assets/images/body_of_seb7a.png',
                      height: height*.27,
                      width: width*.65,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height*.04,
        ),
        Text(' عدد التسبيحات',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Color(0xff242424),

        ),),
        SizedBox(
          height: height*.03,
        ),
        Opacity(
          opacity: .57,
          child: Container(
            width: 69,
            height: 81,
            decoration: BoxDecoration(
              color: Color(0xFFB7935F),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: height*.03),
              child: Text(sebhaCount.toString(),
                style:Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )
                ,textAlign:TextAlign.center,),
            ),
          ),
        ),
        SizedBox(
          height: height*.04,
        ),
        ElevatedButton(onPressed: tasbeh,
          child: Text(tasbehat[tasbehatCounter],
          style:Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight:FontWeight.w400,
            color: Colors.white
          ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),

            )
          ),

        )
      ],
    );
  }
  void tasbeh(){
    if(sebhaCount < 33){
      sebhaCount ++;
    }
    else{
      sebhaCount=0;
      if(tasbehatCounter == 3){
        tasbehatCounter=0;
      }else{tasbehatCounter ++;}
    }
    angle += 5;
    setState(() {

    });
  }
}
