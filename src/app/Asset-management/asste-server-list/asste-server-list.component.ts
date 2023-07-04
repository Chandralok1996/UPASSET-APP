

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
import { AssetService } from '../../_services/asset.service';
import { AssteDektopComponent } from '../asste-dektop/asste-dektop.component';
import { AssteServerComponent } from '../asste-server/asste-server.component';
import { UpdateServerComponent } from '../update-server/update-server.component';

@Component({
  selector: 'app-asste-server-list',
  templateUrl: './asste-server-list.component.html',
  styleUrls: ['./asste-server-list.component.css']
})
export class AssteServerListComponent implements OnInit {

  allUser!: assetlist[];
  dataSource!: MatTableDataSource<assetlist>;
  @ViewChild(MatSort, { static: true }) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  displayedColumns: string[] = ['assetname','assetid','owner_name', 'serialno','make','model','status'];
  selection = new SelectionModel<assetlist>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];
  rowData: any;


  constructor(public fb: FormBuilder,
     public assetservice: AssetService, 
    public router: Router,
    public dialog: MatDialog) {

  
  }

  ngOnInit(): void {
    this.updateData();
  }

  updateData(){
    this.assetservice.itrackslist().subscribe(data => {
      this.tabledata = data.rows;
      this.rowData = data.rowCount;
      this.dataSource = new MatTableDataSource( this.tabledata );
      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator; 
      console.log(this.tabledata)
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
    this.router.navigate(['/home/users/servercreation']);

  }
  applyFilter(event: any) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
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
      console.log('The dialog was closed');
    });
  }
  OpenUpdate(astd_id:any){
    this.assetservice.astserd_id = astd_id;
    this.router.navigate(['/home/users/updateserver',astd_id]);
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