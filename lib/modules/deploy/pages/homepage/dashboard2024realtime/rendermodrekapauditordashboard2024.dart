import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient2base/modules/base/nodeexplorerdefinition/fieldexplorerdefinition.dart';
import 'package:matrixclient2base/modules/base/nodeexplorerdefinition/nodeexplorerdefinition.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwfiedvalue/vwfieldvalue.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwrowdata/vwrowdata.dart';
import 'package:matrixclient2base/modules/base/vwnode/vwnode.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:uuid/uuid.dart';
import 'package:vwform/modules/deployedcollectionname.dart';
import 'package:vwform/modules/vwcardparameter/vwcardparameterutil.dart';
import 'package:vwform/modules/vwform/vwformdefinition/vwformdefinition.dart';
import 'package:vwform/modules/vwform/vwformdefinition/vwformfield/vwformfield.dart';
import 'package:vwform/modules/vwform/vwformdefinition/vwsectionformdefinition/vwsectionformdefinition.dart';
import 'package:vwutil/modules/util/nodeutil.dart';
import 'package:vwutil/modules/util/vwdateutil.dart';

class RenderModRekapAuditorDashboard2024 extends StatefulWidget
{
  RenderModRekapAuditorDashboard2024({required this.fieldValue});

  final VwFieldValue fieldValue;

  RenderDashboard2024State createState()=>RenderDashboard2024State();
}

class RenderDashboard2024State extends State<RenderModRekapAuditorDashboard2024>
{

  List<Employee> employees = <Employee>[];
  late FieldValueDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    //VwFieldValue? rekaplhpperauditorpertahunanggaranFieldValue=this.widget.node.content.rowData!.getFieldByName("rekaplhpperauditorpertahunanggaran");
    employeeDataSource = FieldValueDataSource(
        fieldValue: widget.fieldValue);
  }


  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
  
  
static VwFormDefinition getFormDefinitionFromFieldValue({required VwFieldValue fieldValue}){
    try
        {
          
          return VwFormDefinition.fromJson(fieldValue!.valueClassEncodedJson!.data!);      
        }
        catch(error)
  {
    
  }
  
  return VwFormDefinition(recordId: Uuid().v4(), timestamp: VwDateUtil.nowTimestamp(), formName: "<invalid_form_name>", sections: [], formResponseSyncCollectionName:"<invalid_collection_name>");
}  

static List<GridColumn> createGridColumnList({required VwFormDefinition formDefinition })
{
  List<GridColumn> returnValue=[];
      try
      {
        for(int lb=0;lb<formDefinition.sections.length;lb++)
        {
          VwSectionFormDefinition currentSection=formDefinition.sections[lb];

          for(int lc=0;lc<currentSection.formFields.length;lc++)
          {
            VwFormField currentFormField=currentSection.formFields.elementAt(lc);

           GridColumn currentGridColumn=  GridColumn(
                columnName: currentFormField.fieldDefinition.fieldName,
                width: 135,
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      currentFormField.fieldUiParam.caption!=null?currentFormField.fieldUiParam.caption!:currentFormField.fieldDefinition.fieldName,style: TextStyle(fontWeight: FontWeight.w600),
                    )));
           
           
           returnValue.add(currentGridColumn);


          





          }

        }    
      }
      catch(error)
  {
    
  }
      
      
return returnValue;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekap Per Auditor Per Tahun Anggaran'),
      ),
      body: SfDataGrid(
        headerRowHeight: 80,
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: createGridColumnList(formDefinition: RenderDashboard2024State.getFormDefinitionFromFieldValue ( fieldValue: widget.fieldValue))
      ),
    );
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

class FieldValueDataSource extends DataGridSource{
  FieldValueDataSource({
    required this.fieldValue
}){

    if(fieldValue.valueRowDataList!=null && fieldValue.valueClassEncodedJson!=null && fieldValue.valueClassEncodedJson!.className==DeployedCollectionName.vwFormDefinition)
      {
       VwFormDefinition formDefinition= VwFormDefinition.fromJson(fieldValue.valueClassEncodedJson!.data!);

        this._rowData=FieldValueDataSource.createDataGridCellList(formDefinition: formDefinition, rowDataList: this.fieldValue.valueRowDataList!);
      }

  }

  static List<DataGridRow>  createDataGridCellList({
   required VwFormDefinition formDefinition,
    required List<VwRowData> rowDataList
}){
    List<DataGridRow> returnValue=[];
    try
    {
      for(int la=0;la<rowDataList.length;la++)
        {
          List<DataGridCell> currentGrid=[];
          DataGridRow currentDataGridRow= DataGridRow(
            cells: currentGrid
          );

          returnValue.add(currentDataGridRow);

          VwRowData currentRowData=rowDataList.elementAt(la);

          for(int lb=0;lb<formDefinition.sections.length;lb++)
            {
              VwSectionFormDefinition currentSection=formDefinition.sections[lb];

              for(int lc=0;lc<currentSection.formFields.length;lc++)
                {
                  VwFormField currentFormField=currentSection.formFields.elementAt(lc);


                  if(currentFormField.fieldDefinition.valueTypeId==VwFieldValue.vatString)
                    {
                      DataGridCell currentDataGridCell= DataGridCell<String>(
                          columnName: currentFormField.fieldDefinition.fieldName,
                          value: currentRowData.getFieldByName(currentFormField.fieldDefinition.fieldName)!=null?currentRowData.getFieldByName(currentFormField.fieldDefinition.fieldName)!.valueString.toString():""
                      );
                      currentGrid.add(currentDataGridCell);
                    }
                  else  if(currentFormField.fieldDefinition.valueTypeId==VwFieldValue.vatNumber)
                    {
                      double valueFloat=0;

                      try
                      {
                        valueFloat= currentRowData.getFieldByName(currentFormField.fieldDefinition.fieldName)!=null?currentRowData.getFieldByName(currentFormField.fieldDefinition.fieldName)!.valueNumber!:0;
                      }
                      catch(error)
                        {

                        }


                      DataGridCell currentDataGridCell= DataGridCell<String>(
                          columnName: currentFormField.fieldDefinition.fieldName,
                          value: valueFloat.toString()
                      );
                      currentGrid.add(currentDataGridCell);
                    }
                  else  if(currentFormField.fieldDefinition.valueTypeId==VwFieldValue.vatValueLinkNode)
                    {
                      if(currentFormField.fieldUiParam.collectionListViewDefinition!=null && currentFormField.fieldUiParam.collectionListViewDefinition!.cardParameter!=null)
                        {
                          String titleFieldName=  currentFormField.fieldUiParam.collectionListViewDefinition!.cardParameter!.titleFieldName;
                          String? titleSubFieldName=  currentFormField.fieldUiParam.collectionListViewDefinition!.cardParameter!.titleSubFieldName;


                          VwFieldValue? currentFieldValue=currentRowData.getFieldByName(currentFormField.fieldDefinition.fieldName);

                          if(currentFieldValue!=null && currentFieldValue.valueLinkNode!=null)
                            {
                             VwNode? linkNode=  NodeUtil.getNode(linkNode: currentFieldValue!.valueLinkNode!);
                              if(linkNode!=null&& linkNode.content.rowData!=null)
                                {
                                 NodeExplorerDefinition currentNodeExplorerDefinition= NodeExplorerDefinition (keyName:  "title",
                                  fieldExplorerList: [

                                    FieldExplorerDefinition(fieldName: titleFieldName,nodeType: VwNode.ntnRowData)

                                  ] );

                                 VwFieldValue? titleFieldValue= VwCardParameterUtil.exploreField(sourceNode:linkNode , definition: FieldExplorerDefinition(fieldName: titleFieldName,nodeType: VwNode.ntnRowData));

                                 if(titleSubFieldName!=null && titleSubFieldName.length>0  && titleFieldValue!=null)
                                   {
                                     VwNode? titleLinkNode=  NodeUtil.getNode(linkNode: titleFieldValue!.valueLinkNode!);
                                     if(titleLinkNode!=null)
                                       {
                                         VwFieldValue? subtitleFieldValue= VwCardParameterUtil.exploreField(sourceNode: titleLinkNode!, definition: FieldExplorerDefinition(fieldName: titleFieldName,nodeType: VwNode.ntnRowData));

                                         if(subtitleFieldValue!=null)
                                           {
                                             if(subtitleFieldValue.valueTypeId==VwFieldValue.vatString)
                                               {

                                                 DataGridCell currentDataGridCell= DataGridCell<String>(
                                                     columnName: currentFormField.fieldDefinition.fieldName,
                                                     value:  subtitleFieldValue.valueString.toString()
                                                 );
                                                 currentGrid.add(currentDataGridCell);
                                               }
                                           }

                                       }
                                   }
                                 else
                                   {
                                     if(titleFieldValue!=null)
                                       {
                                         DataGridCell currentDataGridCell= DataGridCell<String>(
                                             columnName: currentFormField.fieldDefinition.fieldName,
                                             value:  titleFieldValue!.valueString.toString()
                                         );
                                         currentGrid.add(currentDataGridCell);
                                       }

                                   }


                                }
                            }


                        }

                    }
                  else
                    {
                      DataGridCell currentDataGridCell= DataGridCell<String>(
                          columnName: currentFormField.fieldDefinition.fieldName,
                          value: "<null>"
                      );
                      currentGrid.add(currentDataGridCell);
                    }



                }


            }


        }

    }
    catch(error)
    {

    }


    return returnValue;
  }

  final VwFieldValue fieldValue;

  List<DataGridRow> _rowData=[];

  @override
  List<DataGridRow> get rows => _rowData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }
}

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<String>(
          columnName: 'designation', value: e.designation),
      DataGridCell<int>(columnName: 'salary', value: e.salary),
    ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }
}