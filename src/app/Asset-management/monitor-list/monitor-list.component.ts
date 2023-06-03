import { SelectionModel } from '@angular/cdk/collections';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { AssetSortComponent } from 'src/app/Asset-Report/asset-sort/asset-sort.component';
import { AttachmentComponent } from 'src/app/attachment/attachment.component';
import { assetlist } from 'src/app/_models/asset';
import { AlertService } from 'src/app/_services';
import { AssetService } from '../../_services/asset.service';
import { AssetMonitorComponent } from '../asset-monitor/asset-monitor.component';
import { UpdateMonitorComponent } from '../update-monitor/update-monitor.component';

@Component({
  selector: 'app-monitor-list',
  templateUrl: './monitor-list.component.html',
  styleUrls: ['./monitor-list.component.css']
})
export class MonitorListComponent implements OnInit {
  allUser: assetlist[];
  dataSource: MatTableDataSource<assetlist>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  displayedColumns: string[] = ['select','assetname','assetid','owner_name', 'custodian'];
  
  selection = new SelectionModel<assetlist>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];

  

  constructor(public fb: FormBuilder,
     public assetservice: AssetService, 
    public router: Router,
    public dialog: MatDialog,
    public alterservices: AlertService,) {

   
  }

  ngOnInit(): void {
    this.updateData();
   
  }

  updateData(){
    this.assetservice.itdevices().subscribe(data => {
      console.log(data);
      this.tabledata = data.rows;

      this.dataSource = new MatTableDataSource( this.tabledata );

      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator; 
      //  this.dataSource.paginator = this.paginator; 
    });

  }


  onRowClicked(row: any) {
    console.log('Row clicked: ', row);
    // this.apiservice.dataRow = row;
    // console.log('row click',this.apiservice.dataRow);
    // // this.apiservice.userid = row.name;
    // // console.log('name: ', row.company);
    // this.router.navigate(['/atsuserpdp']);   

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
    this.router.navigate(['/home/users/monitorcreation']);


  }

  OpenUpdate(astd_id){
  
    this.assetservice.monitor_astd_id = astd_id;
    this.router.navigate(['/home/users/updatemonitor',astd_id]);


  }
  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  
openAttachment(astdid,ast_grp){
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
    console.log('The dialog was closed');
  //  this.animal = result;
  });

}


openFilter(): void {
  const dialogRef = this.dialog.open(AssetSortComponent, {
    width: '653px',
    height: '350px',
    scrollStrategy: new NoopScrollStrategy(),
    disableClose:true,
    position: {top:'7.6%'}
  });

  dialogRef.afterClosed().subscribe(result => {
    console.log('The dialog was closed');

  });
}

}




