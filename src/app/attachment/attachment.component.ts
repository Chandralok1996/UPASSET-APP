import { HttpClient } from '@angular/common/http';
import { Component, HostListener, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { environment } from 'src/environments/environment';
import { AssetService } from '../_services/asset.service';

@Component({
  selector: 'app-attachment',
  templateUrl: './attachment.component.html',
  styleUrls: ['./attachment.component.css']
})
export class AttachmentComponent implements OnInit {
  filesToUpload: Array<File> = [];
  constructor( private http: HttpClient, public assetservice: AssetService,
    public dialogRef: MatDialogRef<AttachmentComponent>, 
    ) { }
    @HostListener('window:keyup.esc') onKeyUp() {
      this.dialogRef.close();
    }

  ngOnInit(): void {
  }

  fileChangeEvent(fileInput: any) {
    this.filesToUpload = <Array<File>>fileInput.target.files;
  }

  upload() {
  
    const formData: any = new FormData();
    const files: Array<File> = this.filesToUpload;
    console.log(files);
    var astdid = this.assetservice.att_astdid
    for(let i =0; i < files.length; i++){
        formData.append("up", files[i], files[i]['name']);
    }
    formData.append("details", JSON.stringify(astdid))

    console.log('form data variable :   '+ formData.toString());

    if(this.assetservice.att_astg_grp === 'DESKTOP' || this.assetservice.att_astg_grp === 'LAPTOP'){
      this.http.post(`${environment.apiUrl}/assets/api/v1/attachdesktop`, formData)
    
          .subscribe(files => console.log('files', files))
  }

  else  if(this.assetservice.att_astg_grp === 'MONITOR'){
    this.http.post('http://172.16.15.21:6700/assets/api/v1/attachmonitor', formData)
   
        .subscribe(files => console.log('files', files))
}

else  if(this.assetservice.att_astg_grp === 'ACCESSORIES'){
  this.http.post('http://172.16.15.21:6700/assets/api/v1/attachaccessories', formData)
      .subscribe(files => console.log('files', files))
}
else  if(this.assetservice.att_astg_grp === 'SERVER'){
  this.http.post('http://172.16.15.21:6700/assets/api/v1/attachserver', formData)
      .subscribe(files => console.log('files', files))
}

  }
   

  onNoClick() {
    this.dialogRef.close();
  }
}
