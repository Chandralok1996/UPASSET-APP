import { Component, OnInit } from '@angular/core';

import * as am4core from "@amcharts/amcharts4/core";
import * as am4charts from "@amcharts/amcharts4/charts";
import am4themes_animated from "@amcharts/amcharts4/themes/animated";
import { IncidentService } from '../_services/incident.service';
import { Router } from '@angular/router';
am4core.useTheme(am4themes_animated);

@Component({
  selector: 'app-graph',
  templateUrl: './graph.component.html',
  styleUrls: ['./graph.component.css']
})
export class GraphComponent implements OnInit {
  private chart: am4charts.XYChart;
  changedData: { status: string; count: string; }[];
  graph: [{ status: string; count: string; priority: string}];

  constructor( public incidentservice: IncidentService,
    public router:Router, ) { }

  ngOnInit(): void {
    this.incidentservice.graph(this.incidentservice.enduser).subscribe(
      result=>{
     
    console.log(result.rows);
    this.graph = result.rows; 
    console.log(this.graph); 
    })

    setTimeout(() => {
      this.bar();
    }, 3000);
   
    
  }

  bar(){

   
    let chart = am4core.create("chartdiv", am4charts.XYChart);

    chart.paddingTop = 40;
// ...
// let axis = chart.yAxes.push(new am4charts.ValueAxis());
// axis.renderer.grid.template.disabled = !showgrid;
// axis.paddingLeft = 10;
// axis.paddingRight = 10;
// axis.layout = "absolute";
 
// // Set up axis title
// axis.title.text = "Something";
// axis.title.rotation = 0;
// axis.title.align = "center";
// axis.title.valign = "top";
// axis.title.dy = -40;
// // axis.title.fontWeight = 600;
// let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
// valueAxis.renderer.opposite = true;
// let categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
// categoryAxis.renderer.opposite = true;



    //chart.dispose();

    // let data = [{"status":"New ","priority":"High","count":"2"},
    // {"status":"New","priority":"Very High","count":"1"}];
     let data =  this.graph ;
    // console.log(this.graph.status);
      this.changedData = this.graph.map(item => ({ status: `${item.status} and ${item.priority}`, count: item.count }));
   
      chart.data = this.changedData;
      console.log(chart.data);
    
// chart.data = [ {
//  "status": "New",
//  "count": 2
// }, {
//  "status": "Assigned",
//  "count": 1
// }, {
//  "status": "Pending",
//  "count": 3
// }];

chart.padding(40, 40, 40, 40);

let categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());

categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "status";
categoryAxis.renderer.minGridDistance = 60;
categoryAxis.renderer.inversed = true;
categoryAxis.renderer.grid.template.disabled = true;
categoryAxis.renderer.labels.template.verticalCenter = "middle";
categoryAxis.renderer.labels.template.horizontalCenter = "middle";
categoryAxis.renderer.minGridDistance = 20;
//* split the label

var label = categoryAxis.renderer.labels.template;
label.truncate = true;
label.maxWidth = 60;
label.tooltipText = "{status}";



let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.min = 0;
valueAxis.extraMax = 0.1;
//valueAxis.rangeChangeEasing = am4core.ease.linear;
//valueAxis.rangeChangeDuration = 1500;
valueAxis.title.text = "No. of Incident";
valueAxis.title.fontWeight = "bold";

categoryAxis.title.text = "Incident Status and Incident Priority ";
categoryAxis.title.fontWeight = "bold";

let series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.categoryX = "status";
// series.dataFields.categoryX = "priority";
series.dataFields.valueY = "count";
series.tooltipText = "{valueY.value}"
series.columns.template.strokeOpacity = 0;
series.columns.template.column.cornerRadiusTopRight = 10;
series.columns.template.column.cornerRadiusTopLeft = 10;


series.columns.template.column.cornerRadiusTopLeft = 10;
//series.interpolationDuration = 1500;
//series.interpolationEasing = am4core.ease.linear;

let labelBullet = series.bullets.push(new am4charts.LabelBullet());
labelBullet.label.verticalCenter = "bottom";
labelBullet.label.dy = -10;
labelBullet.label.text = "{values.valueY.workingValue.formatNumber('#.')}";

chart.zoomOutButton.disabled = true;

// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
series.columns.template.adapter.add("fill", function (fill, target) {
 return chart.colors.getIndex(target.dataItem.index);
});

setInterval(function () {
 am4core.array.each(chart.data, function (item) {
   item.visits += Math.round(Math.random() * 200 - 100);
   item.visits = Math.abs(item.visits);
 })
 chart.invalidateRawData();
}, 2000)

categoryAxis.sortBySeries = series;
  }
 
 
  
  routerPage(){
    this.router.navigate(['home/users/report']);
  }

 

 
 


 
 

}
