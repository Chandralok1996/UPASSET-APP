import { Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
// import { ThemePalette } from '@angular/material/core';
// import { ProgressSpinnerMode } from '@angular/material/progress-spinner';

// import * as am4core from '@amcharts/amcharts4/core';
// import * as am4charts from '@amcharts/amcharts4/charts';
// import am4themes_dataviz from '@amcharts/amcharts4/themes/dataviz';
// import am4themes_animated from '@amcharts/amcharts4/themes/animated';
// import { first, map } from 'rxjs/operators';
// import { IncidentService } from '../_services/incident.service';
import { ActivatedRoute, Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { MatPaginator } from '@angular/material/paginator';
import { SelectionModel } from '@angular/cdk/collections';
import { AccountService } from '../_services/account.service';
import { Chart } from 'chart.js';
import { Event } from 'jquery';
import { AssetService } from '../_services/asset.service';
import { color } from '@amcharts/amcharts4/core';
import { totalmem } from 'os';

/* Chart code */
// Themes begin
// am4core.useTheme(am4themes_dataviz);
// am4core.useTheme(am4themes_animated);

@Component({
  selector: 'app-dashboard-card',
  templateUrl: './dashboard-card.component.html',
  styleUrls: ['./dashboard-card.component.css'],
})
export class DashboardCardComponent implements OnInit {
  canvas: any;
  color:any;
  total_no:any;
  ctx: any;
  canvas1: any;
  color1:any;
  total_no1:any;
  ctx1: any;
  TotalIT:any;
  TotalNonIT:any;
  graphdata:any;
  resultcount:any;
  resultcount1:any;
  assetgroup:any;
  @ViewChild('mychart') mychart:any;
  @ViewChild('mychart1') mychart1:any;
  graphnondata: any;
  resultnoncount: any;
  assetnongroup: any;
  resultnoncount1: any;
  bmsdata: any;
  itrack: any;
  itcount: any;
  device: any;
  devicecount: any;
  itdevice: any;
  elecname:any;
  elecount:any;
  bmsname: void;
  bmscount: any;

   constructor( private route:ActivatedRoute, private assetservice:AssetService,private router: Router) {
   }
   ngAfterViewInit() {
   
 
 
  }
   
ngOnInit(): void {
    this.totalcountITNONIT()
    this.categorygraphdata()
    this.categorygraphnondata()

}
totalcountITNONIT(){
  this.assetservice.totalcountITNONIT().subscribe(data => {

   this.TotalIT=data.rows[0].count;
    this.TotalNonIT=data.rows[1].count;
   console.log(this.TotalIT)
  });

}
categorygraphdata()
{
  this.assetservice.categorygraphdata().subscribe(data=>{
   this.graphdata=data.rows
   this.itrack=this.graphdata[0].astg_group;
   this.itcount=this.graphdata[0].count;
   this.itdevice=this.graphdata[1].astg_group;
   this.devicecount=this.graphdata[1].count;
   console.log(this.itrack);
   console.log(this.graphdata);
   this.resultcount = this.graphdata.map(a => a.count);
   this.assetgroup=this.graphdata.map(a=>a.astg_group);
   this.resultcount1 = this.resultcount.map(i=>Number(i));
   console.log(this.resultcount1);
  
   console.log(this.assetgroup);
   if(this.resultcount1 && this.assetgroup)
   {
    this.canvas = this.mychart.nativeElement; 
    this.ctx = this.canvas.getContext('2d');
  var myLineChart= new Chart(this.ctx, {
      type: 'doughnut',
      data: {
        labels:this.assetgroup,
        datasets: [{
          label: 'My First Dataset',
          data:this.resultcount1,
          backgroundColor: [
            
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)'
          ],
        }],
      },
      options:
      {
        onClick:(event:any)=>
        {
          var activePoints = myLineChart.getElementsAtEvent(event);
          console.log(activePoints);
          var total=activePoints[0]["_index"];
          console.log(total);
          this.color=myLineChart.data.labels[total];
           this.total_no=myLineChart.data.datasets[0].data[total];

            this.router.navigate(['/home/users/dashboardreport', this.color]);  

           
        }
      }
  });
   }
  })

}


categorygraphnondata()
{
  this.assetservice.categorygraphnondata().subscribe(data=>{
   this.graphnondata=data.rows;
   
   console.log(this.graphnondata);
   this.elecname=this.graphnondata[0].category;
  this.elecount=this.graphnondata[0].count;
  this.bmsname=this.graphnondata[1].category;
  this.bmscount=this.graphnondata[1].count;
   console.log(this.elecname);
   this.resultnoncount = this.graphnondata.map(a => a.count);
   this.assetnongroup=this.graphnondata.map(a=>a.category);
   this.resultnoncount1 = this.resultnoncount.map(i=>Number(i));
   console.log(this.resultnoncount1);
  
   console.log(this.assetnongroup);
   if(this.resultnoncount1 && this.assetnongroup)
   {
 
    this.canvas1 = this.mychart1.nativeElement; 
    this.ctx1 = this.canvas1.getContext('2d');
    var myLineChart1= new Chart(this.ctx1, {
      type: 'doughnut',
      data: {
        labels: this.assetnongroup,
        datasets: [{
          label: 'My First Dataset',
          data:this.resultnoncount1,
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)'
            
          ],
        }],
      },
      options:
      {
        onClick:(event:any)=>
        {
          var activePoints = myLineChart1.getElementsAtEvent(event);
          console.log(activePoints);
          var total=activePoints[0]["_index"];
          console.log(total);
          this.color1=myLineChart1.data.labels[total];
        
           this.total_no1=myLineChart1.data.datasets[0].data[total];
           this.router.navigate(['/home/users/dashboardreport', this.color1]);  

        }
      }
  });
   }
  })

}

 

}


