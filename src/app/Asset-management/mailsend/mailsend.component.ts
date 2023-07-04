import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AssetService } from '../../_services/asset.service';
import { AlertService } from 'src/app/_services';
@Component({
  selector: 'app-mailsend',
  templateUrl: './mailsend.component.html',
  styleUrls: ['./mailsend.component.css']
})
export class MailsendComponent implements OnInit {
  warrentyForm: any;
  tabledata: any;
  submitted = false;
  update : boolean =false;
  button:string = 'Submit';
  email_id : any;
  constructor(private formBuilder: FormBuilder,
    public assetservice: AssetService,
    public alterservices: AlertService) { }



  ngOnInit(): void {
    this.warrentyForm = this.formBuilder.group({
      wto:['', Validators.required],
      wcc:[''],
      functionality:[''],

      // wfrom:['', [Validators.required, Validators.pattern('[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$')]],
      // wpass:['',Validators.required],

    })

     this.listData();




      }

      listData() : void {
        this.assetservice.warrantylist().subscribe(data => {
          this.tabledata=data.rows;
          (this.tabledata);

         });
      }

      mailUpdate(data:any) : void {
        this.button = 'Update';
        this.update = true;
        var patchData = {
          wto : data.emailto,
          wcc : data.emailcc,
          functionality : data.functionality
        }
        this.email_id = data.wemail_id;
        this.warrentyForm.patchValue(patchData);

        // this.assetservice.wemail_id = wemail_id;

      }
      delMail(weid:any) : void{
        var data = {
          wemail_id: weid
        };
        this.assetservice.warmaildel(data).subscribe(res =>{
         (res);

          if (res.status) {
            this.alterservices.success(res.message, { autoClose: true, keepAfterRouteChange: true });
           this.ngOnInit();

          }
          else {

            this.alterservices.error('error', { autoClose: true, keepAfterRouteChange: true });

          }
        })
      }

      get f() { return this.warrentyForm.controls; }

      onWarrentySubmit(): void {
        this.submitted = true;

        if(this.update){
          this.warrentyForm.value.wemail_id = this.email_id;
          this.warmailupdate(this.warrentyForm.value)
        }
        else
        {
          this.warmailsend(this.warrentyForm.value)
        }

        this.warrentyForm.reset();
       this.ngOnInit();
      }

      warmailsend(data:any) : void {
        this.assetservice.warrantymail(data)
        .subscribe(res => {

         (res);

	  if (res.status) {
	   this.ngOnInit();
            this.alterservices.success(res.message, { autoClose: true, keepAfterRouteChange: true });
          }
          else {

            this.alterservices.error('error', { autoClose: true, keepAfterRouteChange: true });

          }

        })


      }


      warmailupdate(data:any) : void {
        this.assetservice.warrantyupdatemail(data)
        .subscribe(res => {

         (res);

           if (res.status) {
             this.ngOnInit();
            this.alterservices.success(res.message, { autoClose: true, keepAfterRouteChange: true });
          }
          else {

            this.alterservices.error('error', { autoClose: true, keepAfterRouteChange: true });

          }

        })


      }


}

