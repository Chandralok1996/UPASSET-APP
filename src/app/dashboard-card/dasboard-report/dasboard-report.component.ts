
import { SelectionModel } from '@angular/cdk/collections';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { assetdata } from 'src/app/_models/asset';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AssetService } from 'src/app/_services/asset.service';
import * as XLSX from 'xlsx';
import { event } from 'jquery';

@Component({
  selector: 'app-dasboard-report',
  templateUrl: './dasboard-report.component.html',
  styleUrls: ['./dasboard-report.component.css']
})
export class DasboardReportComponent implements OnInit {
  devicelist: any;
  allasset:any;
  fileName!:'ExcelSheet.xlsx';
  excel:any;
  length = 32;
devicename:any;
showdesktable:boolean=false;

dataSource!: MatTableDataSource<assetdata>;

@ViewChild(MatSort, { static: true }) sort!: MatSort;
@ViewChild(MatPaginator) paginator!: MatPaginator;
@ViewChild('TABLE') table!: ElementRef;
displayedColumns: string[] = ['select','assetname','assetid','owner_name','quantity', 'custodian','class','make','serialno','model','hostname'];
selection = new SelectionModel<assetdata>(true, []);
tabledata: any;
value: any;
pageSize = 8;

pageSizeOptions: number[] = [8, 16, 24, 32];
  produts: any;
  catname: any;
  datacount: any;
  showittable: boolean=false;
  electable: boolean=false;
  bmstable: boolean=false;
  filterData: any;
  statusFilter: any;
  tableFilterData:any;
  constructor(private assetservice:AssetService, private route:ActivatedRoute,private router: Router) { }


  ngOnInit(): void {
    this.getcasestatus(event);
    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');
      this.catname=assetid;

    if(assetid=="Device")
    {

        this.assetservice.devicelist().subscribe(data => {

         this.tabledata=data.rows;
         this.datacount=this.tabledata.length;
         this.tableFilterData = this.tabledata;
       //  this.excel=data.rows;
       this.dataSource = new MatTableDataSource( this.tableFilterData );
       this.dataSource.sort = this.sort;
       this.dataSource.paginator = this.paginator;

         this.showdeskdata();
        });

    }
    else if(assetid=="IT RACK")
    {
      this.assetservice.ITracklistser().subscribe(data => {
        this.tabledata=data.rows;
        this.datacount=this.tabledata.length;
        this.tableFilterData = this.tabledata;
        this.dataSource = new MatTableDataSource( this.tableFilterData );
       this.dataSource.sort = this.sort;
       this.dataSource.paginator = this.paginator;
       this.showitrackdata();

      });
    }
    else if(assetid=="BMS")
    {
      this.assetservice.getbms().subscribe(data => {
        this.tabledata=data.rows;
        this.datacount=this.tabledata.length;
        this.tableFilterData = this.tabledata;
        this.dataSource = new MatTableDataSource( this.tableFilterData );
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
        this.showbmsdata();
      });
    }
    else if(assetid=="ELECTRICAL")
    {
      this.assetservice.getelectrical().subscribe(data => {
        this.tabledata=data.rows;
        this.datacount=this.tabledata.length;
        this.tableFilterData = this.tabledata;
        this.dataSource = new MatTableDataSource( this.tableFilterData );
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
        this.showelecdata();
      });
    }
    else{
    console.log("wrong id");
    }

    })
    this.exportexcel()
  }
  applyFilter(filterValue:String) {
    this.tabledata.filter = filterValue.trim().toLowerCase();
   
  }
  exportexcel(): void
    {
      /* pass here the table id */
      let element = document.getElementById('excel-table');
      const ws: XLSX.WorkSheet =XLSX.utils.table_to_sheet(element);
      /* generate workbook and add the worksheet */
      const wb: XLSX.WorkBook = XLSX.utils.book_new();
      XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
      /* save to file */
      XLSX.writeFile(wb, this.fileName);

    }

    getcasestatus(event:any){
      this.assetservice.filterStatus().subscribe((data:any) => {
        this.filterData=data.rows;       
      })
    }

    getSelectStatus(data:any){
    this.tableFilterData = this.tabledata.filter((item:any )=> item.status.toLowerCase() == data.toLowerCase());
  }

  download(): void {
    let wb = XLSX.utils.table_to_book(document.getElementById('excel-table'), { display: false, raw: true });
    XLSX.writeFile(wb, "invoiceReport.xlsx");
  }
  showdeskdata()
  {
    this.showdesktable=true;
  }
  showitrackdata()
  {
    this.showittable=true;
  }
  showelecdata()
  {
    this.electable=true;
  }
  showbmsdata()
  {
    this.bmstable=true;
  }
}

