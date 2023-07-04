
import { SelectionModel } from '@angular/cdk/collections';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { usergroup } from 'src/app/_models/userm';
import { AccountService } from '../../_services/account.service';
import { NewUserGroupComponent } from '../new-user-group/new-user-group.component';



@Component({
  selector: 'app-user-grp',
  templateUrl: './user-grp.component.html',
  styleUrls: ['./user-grp.component.css']
})
export class UserGrpComponent implements OnInit {
  allUser!: usergroup[];
  dataSource!: MatTableDataSource<usergroup>;
  @ViewChild(MatSort, { static: true }) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  displayedColumns: string[] = ['usug_id', 'ugname', 'description', ];
  selection = new SelectionModel<usergroup>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];


  constructor(public fb: FormBuilder, public accountservice: AccountService, public router: Router,
    public dialog: MatDialog) {

   
  }

  ngOnInit(): void {
    this.accountservice.getUserGroup().subscribe(data => {

      this.tabledata = data.rows;

      this.dataSource = new MatTableDataSource( this.tabledata );

      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator; 
      console.log(this.tabledata)
       this.dataSource.paginator = this.paginator; 
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
    const dialogRef = this.dialog.open(NewUserGroupComponent, {
      width: '600px',
      height: '500px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      position: {top:'7.7%'}


    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
    //  this.animal = result;
    });


  }
  applyFilter(event: any) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}

