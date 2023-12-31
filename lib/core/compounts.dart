import 'package:flutter/material.dart';

// import 'package:first_mansor/sheared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



void navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder:(context) => widget));
void navigateFinish(context,widget)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget), (route) => false);







Widget defult_Button({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,

  required String text,
  required  Function function,

}) =>  Container(
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepOrange,),
  width: double.infinity,

  child: MaterialButton(

    onPressed: (){
      function();
    },
    child: Text(isUpperCase?text.toUpperCase():text,style: TextStyle(color: Colors.white),),

  ),
);

Widget defultForm({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,

  required String lable,
  required IconData prefix,
  IconData? sufix,
  bool isPassword = false,
  bool isClickable = true,
  Function? onPressed,
  Function? onTap




})=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isClickable ,
  // onFieldSubmitted: (value)
  // {
  //   print(value);
  // },
  // onChanged: (value)
  // {
  //   print(value);
  // },
  validator: (value){
    if(value!.isEmpty){
      return ' must be not empty';
    }

  },

  decoration: InputDecoration(
      labelText: lable,

      prefixIcon:Icon (prefix),
      suffixIcon:sufix!= null ? IconButton(
          onPressed: (){
            onPressed!();
          },

          icon:Icon (sufix)) : null,
      border: OutlineInputBorder()
  ),
);

// Widget buildTasksItem(Map model,context)=> Dismissible(
//   key: Key (model['id'].toString()),
//   onDismissed: (direction){
//     AppCubit.get(context).deleteData( id:model['id']);
//   },
//   child:Padding(
//
//     padding: const EdgeInsets.all(15.0),
//
//     child: Row(
//
//       children: [
//
//         CircleAvatar(
//
//           radius: 40,
//
//           child: Text("${model['time']}"),
//
//         ),
//
//         SizedBox(width: 18,),
//
//         Expanded(
//
//           child: Column(
//
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//             mainAxisSize: MainAxisSize.min,
//
//             children: [
//
//               Text("${model['title']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//
//               Text(" ${model['date']}",style: TextStyle(color: Colors.grey),),
//
//             ],
//
//           ),
//
//         ),
//
//         SizedBox(width: 18,),
//
//         IconButton(
//
//           onPressed: (){
//
//             AppCubit.get(context).updateData(status: 'done', id: model['id']);
//
//           },
//
//           icon: Icon(Icons.check_box),
//
//           color: Colors.green,
//
//         ),
//
//         IconButton(
//
//           onPressed: (){
//
//             AppCubit.get(context).updateData(status: 'archive', id: model['id']);
//
//           },
//
//           icon: Icon(Icons.archive),
//
//           color: Colors.black26,
//
//         ),
//
//       ],
//
//     ),
//
//   ),
// );


Widget buildArticalItem(artical,context)=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Expanded(
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage("${artical['urlToImage']}"),
                  fit: BoxFit.cover
              )
          ),
        ),
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Text("${artical['title']}",style:Theme.of(context).textTheme.bodyText1,maxLines: 4,overflow: TextOverflow.ellipsis,)

              ),
              Text("${artical['publishedAt']}",style: TextStyle(color:Colors.grey),)
            ],
          ),
        ),
      )
    ],
  ),
);

// Widget articalBuilder(list)=>ConditionalBuilder(condition: list.length==0,
//     builder: (context)=>ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context,index)=>buildArticalItem(list[index],context),
//         separatorBuilder: (context , index)=>Divider(color: Colors.black,),
//         itemCount: 10
//     ),
//     fallback: (context)=>Center(child: CircularProgressIndicator(),)
// );

void showToast({
  required String text,
  required ToastStates state

})=>   Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: chooesToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates {SUCSESS,ERORR,WARNING}

Color chooesToastColor(ToastStates state){
  Color color;
  switch(state)
  {
    case ToastStates.SUCSESS:
      color =Colors.green;
      break;
    case ToastStates.ERORR:
      color =Colors.red;
      break;
    case ToastStates.WARNING:
      color =Colors.amber;
      break;


  }
  return color;


}

