import { Injectable, Input } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import * as FileSaver from 'file-saver';
import * as XLSX from 'xlsx';
import { AccountService } from './account.service';

const EXCEL_TYPE = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8';
const EXCEL_EXTENSION = '.xlsx';


@Injectable({ providedIn: 'root' })
export class IncidentService {

    inid:any;
    pdp_inid:any;
    graphData: any;

    @Input() enduser={
        status:'',
        date1:'',
        priority:'',
        sgname:'',
        assignedto:'',
        openedby:'',
        empid:''
      };

       constructor(
        private router: Router,
        private http: HttpClient,
        private accountService: AccountService
    )
    {}

    public exportAsExcelFile(json: any[], excelFileName: string): void {
        const worksheet: XLSX.WorkSheet = XLSX.utils.json_to_sheet(json);
        const workbook: XLSX.WorkBook = { Sheets: { 'data': worksheet }, SheetNames: ['data'] };
        const excelBuffer: any = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });
        this.saveAsExcelFile(excelBuffer, excelFileName);
      }
      private saveAsExcelFile(buffer: any, fileName: string): void {
        const data: Blob = new Blob([buffer], { type: EXCEL_TYPE });
        FileSaver.saveAs(data, fileName + '_export_' + new Date().getTime() + EXCEL_EXTENSION);
      }


    assetName(username:any) {
        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getastname/${username}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getpriority(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getpriority`);
    }

    getstatus(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getstatus`);
    }

    assignedto(affectedpro:any) {
        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getassigned/${affectedpro}/${this.accountService.user.orgdet.usorg_id}`);
    }

    incidentgetbyid(data:any ) {
        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getincidentbyid/${data}`);
    }

    getAllTicket(days:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getincident/${days}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getMyTicket(openedby:any,days:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getmyincident/${openedby}/${days}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getassignedTicket(ownedby:any,days:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getassignedincident/${ownedby}/${days}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getunassignedTicket(days:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getunassignedincident/${days}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getclosedTicket(ownedby:any,days:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getclosedincidenthd/${ownedby}/${days}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getclosedTicketDays(days:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getclosedincidenthd/${days}/${this.accountService.user.orgdet.usorg_id}`);
    }

    updateIncident(data:any): Observable<any>{

        return this.http.put<any>(`${environment.apiUrl}/incident/api/v1/updateincident`,data);
    }

    assetGroup(astgrp:any,empid:any): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getassetsup/${astgrp}/${empid}/${this.accountService.user.orgdet.usorg_id}`);

    }
    newIncident(incident:any): Observable<any>{

        return this.http.post<any>(`${environment.apiUrl}/incident/api/v1/createincident`, incident)
        // .pipe(
        //     tap((_) => {
        //        (_)
        //     }),
        //     catchError(this.handleError)

        // );

    }

    //report API

    sortpriority(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/report/api/v1/incidentpriority`);
    }


    sortStatus(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/report/api/v1/incidentstatus`);
    }

    sortAssignedto(user_id:any): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/report/api/v1/incidentassignedto/${user_id}`);
    }

    sortsupgrp(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/report/api/v1/incidentsupportgroup`);
    }

    reporting(data:any): Observable<any>{
        return this.http.post<any>(`${environment.apiUrl}/report/api/v1/incidentreport`, data);
    }

    graph(data:any): Observable<any>{
         return this.http.post<any>(`${environment.apiUrl}/report/api/v1/incidentgraph`, data);
     }

     inctype(): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getinctype`);
    }

    incshort(intp:any): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getincshortdesc/${intp}`);
    }

    // getpriority(): Observable<any>{

    //     return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getinctype`);
    // }

    getCloseTicketDate(ownedby:any,sdate:any,edate:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getclosedincidentbydays/${ownedby}/${sdate}/${edate}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getUnassignedTicketDate(sdate:any,edate:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getunassignedincidentlistbydays/${sdate}/${edate}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getAllTicketDate(sdate:any,edate:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getallincidentlistbydays/${sdate}/${edate}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getmyTicketDate(ownedby:any,sdate:any,edate:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getmyincidentlistbydays/${ownedby}/${sdate}/${edate}/${this.accountService.user.orgdet.usorg_id}`);
    }

    geAssignTicketDate(ownedby:any,sdate:any,edate:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getassignedincidentlistbydays/${ownedby}/${sdate}/${edate}/${this.accountService.user.orgdet.usorg_id}`);
    }


    // dashboard

    getCallStatus(data:any,year:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getcallmodecount/${data}/${year}/${this.accountService.user.orgdet.usorg_id}`);
    }


    getCallType(data:any,year:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getcategorycount/${data}/${year}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getCallStatusPending(year:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getstatuscount/${year}/${this.accountService.user.orgdet.usorg_id}`);
    }


    getCalRes(data:any,year:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getresponsemodecategorycount/${data}/${year}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getCalPendningDetail(data:any,year:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getstatusdetails/${year}/${data}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getCallModeDetail(year:any,callmode:any,month:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getcallmodedetails/${year}/${callmode}/${month}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getCallResDetail(year:any,responsemode:any,month:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getresponsemodedetails/${year}/${responsemode}/${month}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getCallTypeDetail(year:any,category:any,month:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getcategorydetails/${year}/${category}/${month}/${this.accountService.user.orgdet.usorg_id}`);
    }

    getHardwareincident(quarter:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/gethardwarecount/${quarter}/${this.accountService.user.orgdet.usorg_id}`);
    }

    engineerCount(): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getenginccount/${this.accountService.user.orgdet.usorg_id}`);
    }

    getengineerDetail(userid:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/getengincdetails/${userid}/${this.accountService.user.orgdet.usorg_id}`);
    }

    sla(quarter:any): Observable<any>{
       (quarter)
        return this.http.get<any>(`${environment.apiUrl}/dashboard/totalcasessla/${quarter}/${this.accountService.user.orgdet.usorg_id}`);
    }

    flagData(priority:any,call_type:any,flag:any,quarter:any): Observable<any>{
        //quarter = 2;
        return this.http.get<any>(`${environment.apiUrl}/dashboard/sladetails/${priority}/${call_type}/${flag}/${quarter}/${this.accountService.user.orgdet.usorg_id}`);
    }

    callMode(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getcallmode`);
    }

    getresmode(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/incident/api/v1/getresmode`);
    }

    gethardwareDetail(astggrp:any,quater:any): Observable<any>{

        return this.http.get<any>(`${environment.apiUrl}/dashboard/gethardwaredetails/${quater}/${astggrp}/${this.accountService.user.orgdet.usorg_id}`);
    }




}
