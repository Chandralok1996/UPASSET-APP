import { SelectionModel } from '@angular/cdk/collections';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { HttpClient } from '@angular/common/http';
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
import { AssteDektopComponent } from '../asste-dektop/asste-dektop.component';
import { UpdateDesktopComponent } from '../update-desktop/update-desktop.component';

@Component({
  selector: 'app-asste-dektop-list',
  templateUrl: './asste-dektop-list.component.html',
  styleUrls: ['./asste-dektop-list.component.css']
})
export class AssteDektopListComponent implements OnInit {
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
  filesToUpload: Array<File> = [];
  rowData: any;


  constructor(public fb: FormBuilder,
     public assetservice: AssetService, 
    public router: Router,
    public dialog: MatDialog,
    public alterservices: AlertService,
    private http: HttpClient) {

   
  }

  ngOnInit(): void {
    this.updateData();

   
  }

  updateData(){
    this.assetservice.nonitlist().subscribe(data => {
      this.tabledata = data.rows;
      this.rowData = data.rowCount;

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
    this.router.navigate(['/home/users/desktopcreation']);


  }

  OpenUpdate(astd_id:any){
  
    this.assetservice.astd_id = astd_id;
    this.router.navigate(['/home/users/updatedesktop',astd_id]);
    

  }
  
  applyFilter(event: any) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  Success(){
    
    this.alterservices.error('Asset Created successfully', {  autoClose: true, keepAfterRouteChange: true });       
  }
  fileChangeEvent(fileInput: any) {
    this.filesToUpload = <Array<File>>fileInput.target.files;
  }

  upload(astd_id:any) {
    console.log(astd_id);
    var astdid = astd_id;
    const formData: any = new FormData();
    const files: Array<File> = this.filesToUpload;
    console.log(files);

    for(let i =0; i < files.length; i++){
        formData.append("up", files[i], files[i]['name']);
    }
    formData.append("details", JSON.stringify(astdid))
    console.log('form data variable :   '+ formData.toString());
    this.http.post('http://localhost:6700/assets/api/v1/attachdesktop', formData)
    //.map(files => files.json())
        .subscribe(files =>{ console.log('files', files)
        this.alterservices.error('file attachment succesfully', { autoClose: false, keepAfterRouteChange: false });       
  
      })
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
    this.updateData();
    console.log('The dialog was closed');

  });
}

}




