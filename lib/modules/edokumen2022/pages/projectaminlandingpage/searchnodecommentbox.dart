import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vwform/modules/pagecoordinator/bloc/pagecoordinator_bloc.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwpublicquestionpage/vwquestionboxwidget.dart';

class SearchNodeCommentBox extends StatefulWidget{
  SearchNodeCommentBox({required super.key, required this.appInstanceParam, this.pageReloadFunction});

  final VwAppInstanceParam appInstanceParam;
  final PageReloadFunction? pageReloadFunction;

  SearchNodeCommentBoxState createState()=>SearchNodeCommentBoxState();
}

class SearchNodeCommentBoxState extends State<SearchNodeCommentBox>
{
  final List<String> fruits = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Mango',
    'Strawberry',
  ];
  String? selectedFruit ;
  String? currentPattern;

  late TextEditingController editingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.selectedFruit='';
    currentPattern='';
    editingController=TextEditingController();
  }

  Widget textResultWrapper(String caption){
    return Container(padding: EdgeInsets.fromLTRB(20, 5, 5, 5), child: Text(caption),);
  }

  Widget getSearchBox(){
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TypeAheadField(
        builder: (context, controller, focusNode) {
          return this.getOrangeTextFormField(controller: controller,focusNode:focusNode);
        },
        emptyBuilder: (context,){
          if(this.currentPattern=='')
            {

              return this.textResultWrapper("(Search Keyword)");

            }
          else {
            return this.textResultWrapper("(No Record)");
          }
        },
        controller: editingController,
        suggestionsCallback: (pattern) {
          this.currentPattern=pattern;
          if(pattern=='')
            {
              return [];
            }
          else {
            return fruits
                .where((fruit) =>
                fruit.toLowerCase().contains(pattern.toLowerCase()))
                .toList();
          }
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSelected: (suggestion) {
          setState(() {
            selectedFruit = suggestion;
            this.editingController.text=this.selectedFruit.toString();
          });
        },
      ),
    );
  }

  Widget getOrangeTextFormField({TextEditingController? controller,FocusNode? focusNode}){
    return TextFormField(
      
      readOnly: true,
      controller: controller,
      focusNode: focusNode,
      onTap: (){
        this
            .widget
            .appInstanceParam
            .appBloc
            .add(PublicLandingPagecoordinatorEvent(standardArticleMaincategory: "janji", timestamp: DateTime.now()));
      },
      decoration: InputDecoration(
        
        constraints:BoxConstraints(maxWidth: 300,) ,
        enabledBorder: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(width: 3, color: Colors.orange), //<-- SEE HERE

        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black45,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),

        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.black45,fontSize: 16),

        hintText: "Telusuri Janji ...",
        fillColor: Colors.white,
      ),
    );
  }

@override
  Widget build(BuildContext context) {

    return Container(margin: EdgeInsets.fromLTRB(50, 20, 50, 20), child:getOrangeTextFormField());



  }
}