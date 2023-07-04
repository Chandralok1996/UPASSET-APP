import { SelectionModel } from '@angular/cdk/collections';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { AttachmentComponent } from 'src/app/attachment/attachment.component';
import { assetlist } from 'src/app/_models/asset';
import { AlertService } from 'src/app/_services';
import { AssetService } from '../../_services/asset.service';
import { AssteDektopComponent } from '../asste-dektop/asste-dektop.component';
import { UpdateAccesoryComponent } from '../update-accesory/update-accesory.component';
import { UpdateDesktopComponent } from '../update-desktop/update-desktop.component';
import { UpdateMonitorComponent } from '../update-monitor/update-monitor.component';

@Component({
  selector: 'app-inventory',
  templateUrl: './inventory.component.html',
  styleUrls: ['./inventory.component.css']
})
export class InventoryComponent implements OnInit {
  allUser!: assetlist[];
  dataSource!: MatTableDataSource<assetlist>;
  @ViewChild(MatSort, { static: true }) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  displayedColumns: string[] = ['assetname','assetid', 'serialno','make','model','quantity','status'];

  selection = new SelectionModel<assetlist>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];

  group:any;
  rowData: any;


  constructor(public fb: FormBuilder,
     public assetservice: AssetService, 
    public router: Router,
    public dialog: MatDialog,
    public alterservices: AlertService,) {

   
  }

  ngOnInit(): void {
    this.assetservice.bms().subscribe(data => {
      this.tabledata = data.rows;
      this.rowData = data.rowCount;
      this.dataSource = new MatTableDataSource( this.tabledata );

      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator; 
      //  this.dataSource.paginator = this.paginator; 
    });
  }


  onRowClicked(row: any) {
    this.group = row.astg_group;
  }

  isAllSelected() {
    const numSelected = this.selection.selected.length;
    const numRows = this.dataSource.data.length;
    return numSelected === numRows;
  }

  masterToggle() {
    this.isAllSelected() ?
      this.selection.clear() :
      this.dataSource.data.forEach(row => this.selection.select(row));
  }

  openDialog(): void {
    
    const dialogRef = this.dialog.open(AssteDektopComponent, {
      width: '653px',
      height: '500px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      position: {top:'7.7%'}


    });

    dialogRef.afterClosed().subscribe(result => {
     ('The dialog was closed');
    //  this.animal = result;
    });


  }

  OpenUpdate(astd_id:any){
   
    if(this.group === 'DESKTOP'){
      this.assetservice.astd_id = astd_id;
     (this.assetservice.astd_id)

      const dialogRef = this.dialog.open(UpdateDesktopComponent, {
        width: '653px',
        height: '500px',
        scrollStrategy: new NoopScrollStrategy(),
        disableClose:true,
        position: {top:'7.7%'}
  
      });
  
      dialogRef.afterClosed().subscribe(result => {
       ('The dialog was closed');
     
      });

    }else if(this.group === 'LAPTOP'){
      this.assetservice.astd_id = astd_id;
     (this.assetservice.astd_id)

      const dialogRef = this.dialog.open(UpdateDesktopComponent, {
        width: '653px',
        height: '500px',
        scrollStrategy: new NoopScrollStrategy(),
        disableClose:true,
        position: {top:'7.7%'}
  
      });
  
      dialogRef.afterClosed().subscribe(result => {
       ('The dialog was closed');
      
      });

    }else if(this.group === 'MONITOR'){
      this.assetservice.monitor_astd_id = astd_id;
     (this.assetservice.monitor_astd_id)

      const dialogRef = this.dialog.open(UpdateMonitorComponent, {
        width: '653px',
        height: '500px',
        scrollStrategy: new NoopScrollStrategy(),
        disableClose:true,
        position: {top:'7.7%'}
  
      });
  
      dialogRef.afterClosed().subscribe(result => {
       ('The dialog was closed');
      
      });

    }else if(this.group === 'ACCESSORIES'){
      this.assetservice.accesory_astd_id = astd_id;
     (this.assetservice.accesory_astd_id)

      const dialogRef = this.dialog.open(UpdateAccesoryComponent, {
        width: '653px',
        height: '500px',
        scrollStrategy: new NoopScrollStrategy(),
        disableClose:true,
        position: {top:'7.7%'}
  
      });
  
      dialogRef.afterClosed().subscribe(result => {
       ('The dialog was closed');
      
      });

    }
    

  }
  
  applyFilter(event: any) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  Success(){
    
    this.alterservices.error('Asset Created successfully', {  autoClose: true, keepAfterRouteChange: true });       
  }

  openAttachment(astdid:any,ast_grp:any){
    this.assetservice.att_astg_grp = ast_grp
    this.assetservice.att_astdid = astdid;
  
    const dialogRef = this.dialog.open(AttachmentComponent, {
      width: '600px',
      height: '200px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      position: {top:'7.7%'}
  
    });
  
    dialogRef.afterClosed().subscribe(result => {
     ('The dialog was closed');
    //  this.animal = result;
    });
  
  }
}





