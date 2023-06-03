import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';

import { AccountService } from '../_services/account.service';

@Injectable({ providedIn: 'root' })
export class AuthGuard implements CanActivate {
    constructor(
        private router: Router,
        private accountService: AccountService
    ) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
        const user = this.accountService.user;
        if (user) {
         
            this.accountService.isLoggedIn = true;
            console.log(user);

            // authorised so return true
            return true;
        }
        else{
            this.router.navigate(['/login'], { queryParams: { returnUrl: state.url }});
        }

        // not logged in so redirect to login page with the return url { queryParams: { returnUrl: state.url }}
       
        return false;
    }
}
