import { Component, HostListener, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AlertService } from 'src/app/_services';
import { AssetService } from 'src/app/_services/asset.service';
import { IncidentService } from 'src/app/_services/incident.service';
import { kmService } from 'src/app/_services/km.service';

@Component({
  selector: 'app-new-article',
  templateUrl: './new-article.component.html',
  styleUrls: ['./new-article.component.css']
})
export class NewArticleComponent implements OnInit {
  fileArr = [];
  imgArr = [];
  fileObj = [];
  form: FormGroup;
  msg: string;
  progress: number = 0;
  username: any;
  
  keyword1='username';
  loading = false;
  submitted = false;
  category: any;
  result: any;

  constructor( public fb: FormBuilder,
    private sanitizer: DomSanitizer,
    public assetService: AssetService,
    private kmservice: kmService,
    public alterservices: AlertService,
    private router:Router,
    private modalService:NgbModal) {
      this.form = this.fb.group({
        avatar: ['',Validators.required],
        userid: ['',Validators.required],
        kmctid: ['',Validators.required],
        docname: ['',Validators.required],
        keyword: ['',Validators.required],
        file_abstract: ['',Validators.required]
      })
     }

  ngOnInit(): void {
    this.dropdown();
  }
  
  get f() { return this.form.controls; }

  dropdown(){
    this.assetService.userName().subscribe(data => {
      this.username = data.rows;     
    }),
    this.kmservice.getCategory().subscribe(data => {
      this.category = data.rows; 
    })

  }

  upload(e) {
    console.log(e);
    const fileListAsArray = Array.from(e);
    fileListAsArray.forEach((item, i) => {
      const file = (e as HTMLInputElement);
      const url = URL.createObjectURL(file[i]);
      this.imgArr.push(url);
      this.fileArr.push({ item, url: url });
    })
console.log(this.fileArr);
    this.fileArr.forEach((item) => {
      this.fileObj.push(item.item)
    })

    // Set files form control
    this.form.patchValue({
      avatar: this.fileObj
    })

   // this.form.get('avatar').updateValueAndValidity();
    console.log(this.form.value.avatar);   
    
  }

  remove(index){
    this.fileArr.splice(index,1);
    this.fileObj.splice(index,1);
    console.log(this.fileArr)
    console.log(this.fileObj);
    this.form.patchValue({
      avatar: this.fileObj
    })

    console.log(this.form.value.avatar)

  }

  // Clean Url
  sanitize(url: string) {
    return this.sanitizer.bypassSecurityTrustUrl(url);
  }

  selectEvent(item) {
    this.form.value.userid =  item.user_id;
    console.log(this.form.value.userid);
    this.form.patchValue({
      userid: item.user_id
    });
    console.log(this.form.value.userid);
  }

  
  onChangeSearch(val: string) {}
  
  onFocused(e){}


  
  onSubmit() {
debugger
    for(let i=0; i<this.category.length; i++){
      if(this.form.value.kmctid === this.category[i].category_name){
        this.form.value.kmctid = this.category[i].kmct_id;
        console.log(this.form.value.kmctid)
    }
    }

    this.submitted = true;
    // reset alerts on submit
    this.alterservices.clear();

    console.log(this.form.value);
   
    // stop here if form is invalid
    if (this.form.invalid) {
      return;
    }
    this.loading = true;
    this.createArticle();

  }

  createArticle(){

    const formData: any = new FormData();
    const files: Array<File> = this.form.value.avatar;
     console.log(this.form.value);

    for (let i = 0; i < files.length; i++) {

      formData.append("up", files[i], files[i]['name']);
    }

    formData.append("details", JSON.stringify(this.form.value))
    console.log(formData)

    this.kmservice.createArticle(formData)
    .subscribe(res => {
     
      this.loading = false;
      console.log(res);
      if(res.Status === 'Uploaded File Added Successfully')
      {
         this.router.navigate(['/home/users/knowl-management']);
        this.alterservices.success(res.Status, { autoClose: true, keepAfterRouteChange: true });     
      }else  if(res.Status === 'Uploaded File Already Exists!!!')
      {
        this.result = res.Status;
        this.alterservices.error('Uploaded File Already Exists!!!, Please rename the document', { autoClose: true, keepAfterRouteChange: true });     
      }

     if(res.error){
      this.alterservices.error(res.error, { autoClose: true, keepAfterRouteChange: true });
     }
         
    },
    error => {
      this.loading = false;
      this.alterservices.success(error, { autoClose: true, keepAfterRouteChange: true });

    }
    

    )
  }


  

  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  
  
  }
  
  close(){
         this.router.navigate(['/home/users/knowl-management']);
  }

   
@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}

 

divScroll(e) {
  //console.log('div App', e);
}

}
