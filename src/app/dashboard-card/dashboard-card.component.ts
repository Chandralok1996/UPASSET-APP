import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
// import { Chart } from 'chart.js';
import { AssetService } from '../_services/asset.service';
import Chart from 'chart.js/auto';
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
  @ViewChild('mychart2') mychart2:any;
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
  bmsname: any;
  bmscount: any;

   constructor( private route:ActivatedRoute, private assetservice:AssetService,private router: Router) {
   }
   ngAfterViewInit() {



  }

ngOnInit(): void {
    this.totalcountITNONIT()
    this.categorygraphdata()
    this.categorygraphnondata();
    this.categorygraphdata2();

}
totalcountITNONIT(){
  this.assetservice.totalcountITNONIT().subscribe(data => {

   this.TotalIT=data.rows[0].count;
    this.TotalNonIT=data.rows[1].count;
  (this.TotalIT)
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
 
   this.resultcount = this.graphdata.map((a:any) => a.count);
   this.assetgroup=this.graphdata.map((a:any)=>a.astg_group);
   this.resultcount1 = this.resultcount.map((i:any)=>Number(i));

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
          const activePoints :any = myLineChart.getElementsAtEventForMode(event, 'nearest', { intersect: true }, true);

          // var activePoints = myLineChart.getElementsAtEvent(event);
         (activePoints);
          var total=activePoints[0].index;
         (total);
          this.color = myLineChart.data.labels?.[total];
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

  (this.graphnondata);
   this.elecname=this.graphnondata[0].category;
  this.elecount=this.graphnondata[0].count;
  this.bmsname=this.graphnondata[1].category;
  this.bmscount=this.graphnondata[1].count;
  
   this.resultnoncount = this.graphnondata.map((a:any) => a.count);
   this.assetnongroup=this.graphnondata.map((a:any)=>a.category);
   this.resultnoncount1 = this.resultnoncount.map((i:any)=>Number(i));

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
          const activePoints :any = myLineChart1.getElementsAtEventForMode(event, 'nearest', { intersect: true }, true);

          // var activePoints = myLineChart.getElementsAtEvent(event);
         (activePoints);
          var total=activePoints[0].index;
         (total);
          this.color1 = myLineChart1.data.labels?.[total];
          this.total_no1=myLineChart1.data.datasets[0].data[total];
          this.router.navigate(['/home/users/dashboardreport', this.color1]);
        }
      }
  });
   }
  })

}



//third graph
categorygraphdata2()
{
  this.assetservice.categorygraphdata().subscribe(data=>{
   this.graphdata=data.rows
   this.itrack=this.graphdata[0].astg_group;
   this.itcount=this.graphdata[0].count;
   this.itdevice=this.graphdata[1].astg_group;
   this.devicecount=this.graphdata[1].count;
 
   this.resultcount = this.graphdata.map((a:any) => a.count);
   this.assetgroup=this.graphdata.map((a:any)=>a.astg_group);
   this.resultcount1 = this.resultcount.map((i:any)=>Number(i));

   if(this.resultcount1 && this.assetgroup)
   {
    this.canvas = this.mychart2.nativeElement;
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
          const activePoints :any = myLineChart.getElementsAtEventForMode(event, 'nearest', { intersect: true }, true);

          // var activePoints = myLineChart.getElementsAtEvent(event);
         (activePoints);
          var total=activePoints[0].index;
         (total);
          this.color = myLineChart.data.labels?.[total];
          this.total_no=myLineChart.data.datasets[0].data[total];
          this.router.navigate(['/home/users/dashboardreport', this.color]);
        }
      }
  });
   }
  })

}


}


