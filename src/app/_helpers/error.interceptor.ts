import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

import { AccountService } from '../_services/account.service';

@Injectable()
export class ErrorInterceptor implements HttpInterceptor {
    constructor(private accountService: AccountService) {}

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        return next.handle(request).pipe(catchError(err => {
            let errorMessage = ''; 
           
            if ([401, 403].includes(err.status) && this.accountService.user) {
                errorMessage = `Error: ${err.error}`
                // auto logout if 401 or 403 response returned from api
                this.accountService.logout();
            }
            else if ([200,400].includes(err.status) && this.accountService.user){
                errorMessage = `Error: ${err.error.text}`
                console.log(err.status)
            }
            else{
                errorMessage = `Error Code: ${err.error}\n ${err.message} `
            }
           
         //   const error = err.error.message || err.statusText;
           // console.error(err);
            return throwError(errorMessage);
        }))
    }
}