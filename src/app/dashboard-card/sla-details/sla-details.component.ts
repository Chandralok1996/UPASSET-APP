import { SelectionModel } from '@angular/cdk/collections';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { IncidentService } from 'src/app/_services/incident.service';
import * as XLSX from 'xlsx';

@Component({
  selector: 'app-sla-details',
  templateUrl: './sla-details.component.html',
  styleUrls: ['./sla-details.component.css']
})
export class SlaDetailsComponent implements OnInit {

  allUser: any[];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  displayedColumns: string[] = ['ticket_no','problem','employee_name','support_group','engineer','call_status','priority'];


  selection = new SelectionModel<any>(true, []);
   tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];
  excel: any;
  key: string;
  form: FormGroup;

  currentDate = new Date();
  currentMonthString = Math.floor(this.currentDate.getMonth() / 3) + 1;
  priority: any;
  incidenttype: any;
  submitted = false;
  flag: number;
  quater: string;


  constructor(private route: ActivatedRoute,
    public incidentservice: IncidentService,
    private formBuilder: FormBuilder,) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe((params) => {
       this.key = params.get('id');
       this.quater =  params.get('quater');
      
      this.getengineerResult();
   });
   this.defaultData();

   this.form = this.formBuilder.group({
    prority: ['', Validators.required],
    call_type:['', Validators.required]
   })

  }
  get f() { return this.form.controls; }
  
  getengineerResult(){
    if(this.key === 'withinsla'){
      this.flag = 1;
      this.incidentservice.sla(this.quater)
      .subscribe(data => {
         console.log(data);
      this.tabledata = data.within;
      console.log(this.tabledata)
      this.excel =  this.tabledata;
  
      this.dataSource = new MatTableDataSource( this.tabledata );
  
      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator;      
         
      })
    }else if(this.key === 'outofsla'){
      this.flag = 0;
      this.incidentservice.sla(this.quater)
    .subscribe(data => {
       
    this.tabledata = data.outof;
    console.log(this.tabledata)
    this.excel =  this.tabledata;

    this.dataSource = new MatTableDataSource( this.tabledata );

    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;      
       
    })
    }
    
  }

  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }


  exportAsXLSX(){
    // console.log('llll',this.data1);
    var ws = XLSX.utils.json_to_sheet(this.excel);          
    var wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "data");            
    XLSX.writeFile(wb, "REPORT.xlsx");       
        }

        submit(){

          this.incidentservice.flagData(this.form.value.prority,this.form.value.call_type,this.flag,this.quater)
    .subscribe(data => {
      console.log(data); 
      this.tabledata = data.rows;
      this.excel =  this.tabledata;
  
      this.dataSource = new MatTableDataSource( this.tabledata );
  
      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator;       
    })

        }

        defaultData(){
          this.incidentservice.getpriority()
          .subscribe(data => {
              this.priority = data.rows;
          }),
          this.incidentservice.inctype().subscribe(data => {
            this.incidenttype = data.rows;
            
          })
        }

}
