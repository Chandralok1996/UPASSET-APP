import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';

import { AccountService, } from '../_services/account.service';
import { AlertService } from '../_services/alert.service';

// import { error } from 'protractor';

declare var $: any;
@Component({
    templateUrl: 'login.component.html',
    styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
    form: any;
    form1: any;
    loading = false;
    submitted = false;
    defaultValue:any;
    returnUrl: any;
    result: any;


    constructor(
        private formBuilder: FormBuilder,
        private route: ActivatedRoute,
        private router: Router,
        private accountService: AccountService,
        private alertService: AlertService,
    ) {

    }

    ngOnInit() {

        this.form = this.formBuilder.group({
            name: ['', Validators.required],
            password: ['', Validators.required]
        });


    }

    // convenience getter for easy access to form fields
    get f() { return this.form.controls; }




    onSubmit() {

       (this.form.value.name)
        this.submitted = true;

        // reset alerts on submit
        this.alertService.clear();

        // stop here if form is invalid
        if (this.form.invalid) {
            return;
        }

        this.loading = true;

        this.accountService.login(this.f.name.value, this.f.password.value)
            .pipe(first())
            .subscribe({
                next: (res) => {
                   (res);
                    this.accountService.user = res;

                    if (res.rolename === 'Asset Manager') {

                        this.router.navigate(['/home/users/assetlaptop']);
                    }

                    else if (res.error) {
                        $('#exampleModalLong').modal('show');
                        this.result = "Invalid username !"
                        // this.alertService.error("Please contact Admin or Try after sometime!",{autoClose:true});
                        setTimeout(function () {
                            $('#exampleModalLong').modal('hide')
                        }, 3000);
                    }

                    else if (res.rolename === 'Viewer') {
                        this.router.navigate(['/home/users/dashboardstatus']);
                    }

                    else if (res.rolename === 'Systemadmin' || res.rolename === 'Administrator') {
                        this.router.navigate(['/home/users/assetlaptop']);
                    }
                    //  else if(res.rolename === 'Helpdesk'){
                    //    this.router.navigate(['/home/users/coordinator']); 
                    //  }

                    else if (res.message) {
                        $('#exampleModalLong').modal('show');
                        this.result = "Username and Password do not match !"
                        setTimeout(function () {
                            $('#exampleModalLong').modal('hide')
                        }, 2500);
                    }
                    else {
                        this.router.navigate(['/login']);
                    }

                },
                error: error => {
                    this.alertService.error(error);
                    this.loading = false;
                    $('#exampleModalLong').modal('show');
                       setTimeout(function(){
                        $('#exampleModalLong').modal('hide')
                      }, 3000);
                }

            });





    }

    aduser:boolean = true;
    nonaduser:boolean = false;
    adUser() {
        this.nonaduser = false;
        this.aduser = true;
    }
    nonAdUser() {
        this.aduser = false;
        this.nonaduser = true;
    }


}

