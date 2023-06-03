import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';

import { environment } from '../../environments/environment';



@Injectable({ providedIn: 'root' })
export class EndUserService {
   

       constructor(
        private router: Router,
        private http: HttpClient
    ) 
    {}
    suplanduncount(){
        
    }

   
}