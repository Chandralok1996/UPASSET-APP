

import { SelectionModel } from '@angular/cdk/collections';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { HostListener } from '@angular/core';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { userpdp } from 'src/app/_models/userm';
import { AccountService } from '../../_services/account.service';
import { UpdateUserComponent } from '../update-user/update-user.component';
import { UserCreationComponent } from '../user-creation/user-creation.component';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {

  allUser: userpdp[];
  dataSource: MatTableDataSource<userpdp>;

  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  
  displayedColumns: string[] = ['select', 'username','loginname','user_id', 'description', 'createdtime','actions'];
  selection = new SelectionModel<userpdp>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];


  constructor(public fb: FormBuilder, public accountservice: AccountService,  public router: Router,
    public dialog: MatDialog) {

  }

  ngOnInit(): void {
   
  this.updateData();
  }


  updateData(){
    this.accountservice.alluserdetails1().subscribe(data => {

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

    this.router.navigate(['/home/users/usercreation']);

  }


  OpenUpdate(astd_id){
  
    this.router.navigate(['/home/users/updateuser',astd_id]);

    this.accountservice.user_id = astd_id;
    

  }
  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }


}

