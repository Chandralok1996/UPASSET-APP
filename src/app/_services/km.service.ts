import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';

import { environment } from '../../environments/environment';
import { User } from '../_models';
import { organization, role, UserC, usergroup, userpdp } from '../_models/userm';



@Injectable({ providedIn: 'root' })
export class kmService {
    searchResult: any;

    constructor(  private http: HttpClient){
      
    }

    searchApi(data: any): Observable<any> {

        return this.http.post(`https://splus.augtrans.com:5008/search`, data);

    }

    getsearchApi(kmdt_id,count): Observable<any> {

        return this.http.get(`${environment.apiUrl}/km/getkmfiledetails/${kmdt_id}/${count}`);

    }

    getsearchApiDelete(kmdt_id): Observable<any> {
        return this.http.delete(`${environment.apiUrl}/km/deleteUserFile/${kmdt_id}`);

    }

    getFile(file): Observable<any>{     
        return this.http.get<any>(file); 
    }

    
    getCategory(): Observable<any>{
        
        return this.http.get<any>(`${environment.apiUrl}/km/getkmcategory`); 
    }

    createArticle(data): Observable<any>{
        console.log(data);
        return this.http.post<any>(`${environment.apiUrl}/km/uploadfile`, data)

    }

   


}
