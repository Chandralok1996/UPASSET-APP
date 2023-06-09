import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AccountService } from '../_services/account.service';

@Injectable()

export class JwtInterceptor implements HttpInterceptor {
    constructor(private accountService: AccountService) { }

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

        // add auth header with jwt if user is logged in and request is to the api url
      //  const user = this.accountService.userValue;
             const user2:any = localStorage.getItem('user');
        // const user2 = JSON.parse(localStorage.getItem('user'))
        // const isLoggedIn = user && user.token;
        // const isApiUrl = request.url.startsWith(environment.apiUrl);




        if (user2 && user2.token) {

            request = request.clone({
                setHeaders: {
                    Authorization: `Bearer ${user2.token}`
                }
            });

        }

        return next.handle(request);
    }
}
