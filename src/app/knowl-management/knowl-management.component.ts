import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { kmService } from '../_services/km.service';

@Component({
  selector: 'app-knowl-management',
  templateUrl: './knowl-management.component.html',
  styleUrls: ['./knowl-management.component.css']
})
export class KnowlManagementComponent implements OnInit {
  form: FormGroup;
  response: any;

  constructor(private kmService: kmService,private formBuilder: FormBuilder,
    private router:Router) { }

  ngOnInit(): void {

    this.form = this.formBuilder.group({
      data:['']
    });
  }


  searchAPI(){
    // this.kmService.searchApi(this.form.value)
    // .subscribe(res => {
    //   console.log(res);
    //   this.kmService.searchResult = res;
    //   if(res){
        this.router.navigate(['/home/users/know-management1',this.form.value.data]);
    //   }
    // })
  }
  isShow = false;
  dotShow()
{
  console.log('show')
  this.isShow= !this.isShow;

}

}
