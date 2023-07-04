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

  allUser!: userpdp[];
  dataSource!: MatTableDataSource<userpdp>;

  @ViewChild(MatSort, { static: true }) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  
  displayedColumns: string[] = ['assetname','assetid','owner_name', 'serialno','make','model','status'];
  selection = new SelectionModel<userpdp>(true, []);
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
    this.assetservice.itlist().subscribe(data => {
     
      
      this.tabledata = data.rows;
      this.rowData = data.rowCount;
       console.log(this.rowData);
    

      this.dataSource = new MatTableDataSource( this.tabledata );

      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator; 
     
    this.dataSource.paginator = this.paginator; 
    });

  }

  onRowClicked(row: any) {
    //('Row clicked: ', row);
    // this.apiservice.dataRow = row;
    //('row click',this.apiservice.dataRow);
    // // this.apiservice.userid = row.name;
    // //('name: ', row.company);
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
     ('The dialog was closed');
    });
  }


  applyFilter(event: any) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}

