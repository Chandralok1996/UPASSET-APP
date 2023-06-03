import { SelectionModel } from '@angular/cdk/collections';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { userpdp } from 'src/app/_models/userm';

import { UpdateUserComponent } from '../../User_management/update-user/update-user.component';
import { UserCreationComponent } from '../../User_management/user-creation/user-creation.component';
import { AssetService } from '../../_services/asset.service';

@Component({
  selector: 'app-itlist',
  templateUrl: './itlist.component.html',
  styleUrls: ['./itlist.component.css']
})
export class ItlistComponent implements OnInit {

  allUser: userpdp[];
  dataSource: MatTableDataSource<userpdp>;

  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  
  displayedColumns: string[] = ['select','assetname','assetid','owner_name', 'custodian'];
  selection = new SelectionModel<userpdp>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];


  constructor(public fb: FormBuilder, 
     public assetservice: AssetService,  
      public router: Router,
    public dialog: MatDialog) {

  }

  ngOnInit(): void {
   
  this.updateData();
  }


  updateData(){
    this.assetservice.itlist().subscribe(data => {
      console.log(data)
      this.tabledata = data.rows;
     console.log(this.tabledata)

      this.dataSource = new MatTableDataSource( this.tabledata );

      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator; 
     
    this.dataSource.paginator = this.paginator; 
    });

  }

  onRowClicked(row: any) {
    // console.log('Row clicked: ', row);
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
    const dialogRef = this.dialog.open(UserCreationComponent, {
      width: '700px',
      height: '500px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      position: {top:'7.6%'}
    });

    dialogRef.afterClosed().subscribe(result => {
      this.updateData();
      console.log('The dialog was closed');
    });
  }


  // OpenUpdate(astd_id){
  
  //   this.accountservice.user_id = astd_id;
  //   console.log(this.accountservice.user_id)
  //   const dialogRef = this.dialog.open(UpdateUserComponent, {
  //     width: '653px',
  //     height: '500px',
  //     scrollStrategy: new NoopScrollStrategy(),
  //     disableClose:true,
  //     position: {top:'7.7%'}

  //   });

  //   dialogRef.afterClosed().subscribe(result => {
  //     this.updateData();
  //     console.log('The dialog was closed');
   
  //   });

  // }
  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}

