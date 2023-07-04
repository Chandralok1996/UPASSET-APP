import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';

import { environment } from '../../environments/environment';
import { User } from '../_models';
import { organization, role, UserC, usergroup, userpdp } from '../_models/userm';


@Injectable({ providedIn: 'root' })
export class AccountService {
    private userSubject!: BehaviorSubject<User>;
    public user: User;
    isLoggedIn = true;
    user_id: any;
    user_id1:any;
    empid1: any;


       constructor(
        private router: Router,
        private http: HttpClient,
       // private accountService: AccountService
    ) 
    {
        let storedUser:any = localStorage.getItem('user');
        this.user = JSON.parse(storedUser);
        // this.userSubject = new BehaviorSubject<User>(JSON.parse(localStorage.getItem('user')));
        // debugger;
        // this.user = this.userSubject.asObservable();
        

    }

    // public get userValue(): User {
    //     return this.userSubject.value;
    // }


    login(name:any, password:any) {
      
        return this.http.post<any>(`${environment.apiUrl}/user/api/v1/login`, { name, password })
            .pipe(map(user => {
               this.user = user;
               
                // store user details and jwt token in local storage to keep user logged in between page refreshes
                localStorage.setItem('user', JSON.stringify(user));
               // this.userSubject.next(user);
                return user;
            }));
    }

    adlogin(name:any, password:any) {
      
        return this.http.post<any>(`${environment.apiUrl}/user/api/v1/adlogin`, { name, password })
            .pipe(map(user => {
               this.user = user;
               
                // store user details and jwt token in local storage to keep user logged in between page refreshes
                localStorage.setItem('user', JSON.stringify(user));
               // this.userSubject.next(user);
                return user;
            }));
    }

    logout() {
        // remove user from local storage and set current user to null
        localStorage.removeItem('user');
       // this.user = undefined;
        this.router.navigate(['/login']);
    }

    alluserdetails1(): Observable<any>{
     (this.user.orgdet.org)
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getuser/${this.user.orgdet.usorg_id}`);
    }

    leftemplist(): Observable<any>{
      
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getleftuser/${this.user.orgdet.usorg_id}`);
    }


    getUserRole(): Observable<any>{
        return this.http.get<role>(`${environment.apiUrl}/user/api/v1/getusrl`);
    }

    getUserGroup(): Observable<any>{
        return this.http.get<usergroup>(`${environment.apiUrl}/user/api/v1/getsupportgrp/${this.user.orgdet.usorg_id}`);
    }

    organization(): Observable<any>{
        return this.http.get<organization>(`${environment.apiUrl}/user/api/v1/getorg`);
    }


    building(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getbuilding`);
    }

    floor(building: string) {
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getfloor/${building}`);
    }

    branch(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getbranch`);
    }
    sectioncode(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getsec`);
    }

   
    designation(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getdesignation`);
    }
    // group(): Observable<any>{
    //     return this.http.get<any>(`${environment.apiUrl}user/api/v1/getsupportgrp/:${orgid}`);
    // }

    title(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getusertitle`);
    }

    department(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getdept/${this.user.orgdet.usorg_id}`);
    }

    usertype(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getusertype`);
    }

    reportingtoo(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getuserreportingto/${this.user.orgdet.usorg_id}`);
    }

    getbyuser(user:any): Observable<any> {
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getbyuser/${user}`);
    }

    newUser(user: UserC): Observable<any> {

        return this.http.post(`${environment.apiUrl}/user/api/v1/createuser`, user);

    }

    rejoinUser(user: UserC): Observable<any> {

        return this.http.post(`${environment.apiUrl}/user/api/v1/rejoinuser`, user);

    }

    userUpdate(user:any): Observable<any>  {
        return this.http.put<any>(`${environment.apiUrl}/user/api/v1/updateuser`, user)
    }

    passwordUpdate(user:any): Observable<any>  {
        return this.http.put<any>(`${environment.apiUrl}/user/api/v1/updatepassword`, user)
    }

    newDesignation(user:any): Observable<any>  {
        return this.http.post<any>(`${environment.apiUrl}/user/api/v1/newdesg`, user)
    }

    newBranch(user:any): Observable<any>  {
        return this.http.post<any>(`${environment.apiUrl}/user/api/v1/newbranch`, user)
    }

    newBuilding(user:any): Observable<any>  {
        return this.http.post<any>(`${environment.apiUrl}/user/api/v1/newbuilding`, user)
    }
    newSeccode(user:any): Observable<any>  {
        return this.http.post<any>(`${environment.apiUrl}/user/api/v1/newseccode`, user)
    }
    newDepartment(user:any): Observable<any>  {
        return this.http.post<any>(`${environment.apiUrl}/user/api/v1/newdept/${this.user.orgdet.usorg_id}`, user)
    }

    inactiveUser(user:any): Observable<any> {

        return this.http.post(`${environment.apiUrl}/user/api/v1/leftuser`, user);

    }

    validateGetLoginName(name:any){
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/validateloginname/${name}`);
    }

    validateGetEight(eightid:any){
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/validateeightid/${eightid}`);
    }

    validateGetLocalid(empid:any){
        return this.http.get<any>(`${environment.apiUrl}/user/api/v1/validateempid/${empid}`);
	}


	//reset-password
	reset(password:any): Observable<any>{
   	 debugger;
   	 return this.http.put<any>(`${environment.apiUrl}/user/api/v1/updatepassword`,password);
	}

}
