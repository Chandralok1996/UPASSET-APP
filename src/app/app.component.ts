import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { User } from './_models';
import { AccountService } from './_services/account.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'thyssentt';
  user: User;
  public buttonName:any = 'Show';
  public admin:boolean = false;
  public asset:boolean = false;
  date1: string;
  collapsed=true;
 

	

    constructor(public accountService: AccountService, private router: Router) {
       
        // this.accountService.user.subscribe(x => this.user = x);
        
    }

    ngOnInit(): void {
     
    }

    logout() {
      this.accountService.logout();
      this.router.navigate(['/login']);
  }


}
