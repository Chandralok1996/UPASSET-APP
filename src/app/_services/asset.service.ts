import { Injectable, Input } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable, throwError } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';

import { environment } from '../../environments/environment';
import { User } from '../_models';
import { assetlist } from '../_models/asset';
import { AccountService } from './account.service';
import { ToastrService } from 'ngx-toastr';


@Injectable({ providedIn: 'root' })
export class AssetService {
  priority() {
    throw new Error('Method not implemented.');
  }

    astd_id: any;
    monitor_astd_id: any;
    accesory_astd_id: any;
    att_astdid:any;
    att_astg_grp: any;
    astserd_id: any;

    @Input() enduser={
        status:'',
        assetgroup:''
      };



       constructor(
        private router: Router,
        private http: HttpClient,
        private accountService: AccountService,
       public toaster :ToastrService,
    )
    {}

 
    eightid(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/geteightid`);
    }

    status(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getasts`);
    }

    group(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastg`);
    }

    category(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastc`);
    }

    assetType(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastt`);
    }

    operatingSystem(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastos`);
    }

    servicePack(os: string): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastsp/${os}`);
    }

    spDropdown(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getos`);
    }


    manufacture(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastmfg`);
    }

    make(make: string) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastmfgmodel/${make}`);
    }

    processer(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastprocessor`);
    }

    speed(processor: string) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastspeed/${processor}`);
    }

    assetforperticularuser(user_id:any) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyassetforuser/${user_id}`);
    }

    ramType(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastramtyp`);
    }

    ramSize(rtype: string) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastramsize/${rtype}`);
    }

    hardDisk(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getasthddtyp`);
    }

    capacity(hddtype: string) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getasthddcapacity/${hddtype}`);
    }

    gpuDisk(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastgpu`);
    }

    gCard(gpucard: string) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastgpuram/${gpucard}`);
    }

    optical(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastoptdr`);
    }

    userName(): Observable<any>{
      // (this.accountService.user.orgdet.usorg_id)
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getuser/${this.accountService.user.orgdet.usorg_id}`);
    }

    userdet(name: string) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getuserdata/${name}/${this.accountService.user.orgdet.usorg_id}`);
    }

    vendor(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getvenname`);
    }

    vendorloc(vendor: string) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getvenloc/${vendor}`);
    }

    getbyassetdetails(asset:any) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyasset/${asset}`);
    }

    getbyassetdetailsMonitor(asset:any) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyassetMonitor/${asset}`);
    }

    getbyassetdetailsAccesory(asset:any) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyassetAccessories/${asset}`);
    }

    monitor(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getmonitor`);
    }

    accessories(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getaccessory`);
    }
    filterStatus(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getasts`);
    }



    assetDesktopInsert(asset:any): Observable<any>  {

        return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createdesktop`, asset)
        // .pipe(
        //     tap((_) => {
        //        (_)
        //     }),
        //     catchError(this.handleError)

        // );

    }

    assetDesktopUpdate(asset:any): Observable<any>  {
        return this.http.put<any>(`${environment.apiUrl}/assets/api/v1/updatedesktop`, asset)
    }

    assetMonitorInsert(asset:any): Observable<any>  {
        return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createmonitor`, asset)
    }

    assetMonitorUpdate(asset:any): Observable<any>  {
        return this.http.put<any>(`${environment.apiUrl}/assets/api/v1/updatemonitor`, asset)
    }

    assetAccessoriesInsert(asset:any): Observable<any>  {
        return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createaccessory`, asset)
    }

    handleError(error:any) {
        let errorMessage ;
        if (error.error instanceof ErrorEvent) {
          // Client-side errors
          errorMessage = `An Error Occured: ${error.error.message}`;
        } else  if (!navigator.onLine) { errorMessage = 'No Internet Connection'; } else {
          // Server-side errors
          return throwError(error);
            }
        return throwError({
            error: errorMessage
        });
      }


      //// server

servertype(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/servertype`);
}

hardclass(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/serverhwclass`);
}

ramslot(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/serverramslot`);
}

storageType(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/serversttype`);
}

rackno(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/serverrackno`);
}

nic(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/servernic`);
}


processor(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/serverprocessor`);
}

serverMake(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/servermodel`);
}

serverOS(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/serveros`);
}
serverram(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/serverram`);
}

serverModel(make:any) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyservermodel/${make}`);
}

serverramSize(rtype: string) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyserverram/${rtype}`);
}

serverOSS(os: string) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyserveros/${os}`);
}

assetServerInsert(asset:any): Observable<any>  {

    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createserver`, asset)

}

assetServerUpdate(asset:any): Observable<any>  {

    return this.http.put<any>(`${environment.apiUrl}/assets/api/v1/updateserver`, asset)

}

getbyassetserverdetails(asset:any) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyserverdetails/${asset}`);
}



sortstatus(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getasts`);
}

sortAssetGroup(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastg`);
}



reportData(data:any): Observable<any>{

     return this.http.post<any>(`${environment.apiUrl}/report/api/v1/assetreport`, data);
 }

 newVendor(asset:any): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewvendor`, asset)
}

newOS(asset:any): Observable<any>  {
   (asset);
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewos`, asset)
}

newMake(asset:any): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewmodel`, asset)
}

newProc(asset:any): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewpro`, asset)
}

newram(asset:any): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewram`, asset)
}

newhdd(asset:any): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewhdd`, asset)
}


newgpu(asset:any): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewgpu`, asset)
}


validateAssetno(asset:any) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/validateastname/${asset}`);
}


validateSerialNum(group:any,serialno:any) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/validateserialno/${group}/${serialno}`);
}


getbyassetHistory(astd_id:any) {
    return this.http.get<any>(`${environment.apiUrl}/history/api/v1/asthistory/${astd_id}`);
}


getbyuserHistory(empid:any) {
    return this.http.get<any>(`${environment.apiUrl}/history/api/v1/asthistoryempid/${empid}`);
}

organization(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getorg`);
}


// asset management API

assettype(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastt`);
}
assetcat(astt_id:any){
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastc/${astt_id}`);
}

assetgrp(astc_id:any){
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastg/${astc_id}`);
}
makee(astg_id:any): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetmake/${astg_id}`);
}
model(astupmk_id:any){
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetmodel/${astupmk_id}`);
}
custodian(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetcust`);
}

assetowner(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getuserlist`);
}
location(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetloc`);
}

confidential(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastupc`);
}
integrity(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetintegrity`);
}

availibility(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetavail`);
}

family(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetfamily`);
}

//Create-asset
createasset(data:any): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createasset`, data)
}
 //update-asset-API
 assetupdation(astd_id:any): Observable<any>  {
    return this.http.put<any>(`${environment.apiUrl}/assets/api/v1/updateasset`,astd_id)
}

//list-api using token
assetlist(): Observable<any>{
    const httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json', 'auth-token': JSON.parse(localStorage.getItem('user') || '').token})};
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetlist`,httpOptions)
}

//pdp-detail
getbyasset(astd_id:any): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetdetail/${astd_id}`);
}

//status-update
statuss(): Observable<any> {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getasts`);
}


//ITRACKS
itrackslist(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getlistitrack`);
}

//DEVICES
itdevices(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getlistitdevices`);
}

//electrical
electrical(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getlistelectrical`);
}

//BMS
bms(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getlistbms`);
}
//nonitlist
nonitlist(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getnonitassetlist`);
}

//ITlist
 itlist(): Observable<any>{
     return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getitassetlist`);
 }

//dashboard-API
totalcountITNONIT(): Observable<any>{

    return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getcountITNONIT`);
}
categorygraphdata():
Observable<any>{

  return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getcountITrDVs`);

}
categorygraphnondata():Observable<any>{

return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getcountbmselec`);

}
devicelist():Observable<any>{
  return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getlistitdevices`);
}
ITracklistser():Observable<any>{

  return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getlistitrack`);

}
getelectrical():Observable<any>{
  return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getlistelectrical`);
}
getbms():Observable<any>{
  return this.http.get<any>(`${environment.apiUrl}/dashboard/api/v1/getlistbms`);
}



//Master-fields-add-in-asset-api
masttypeadd(data:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createtype`,data);
}

mastcateadd(astt_id:any): Observable<any>{
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createcategory`,astt_id);
}

mastgrpadd(astc_id:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/creategroup`,astc_id);
}

mastmkadd(astg_id:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createmake`,astg_id);
}

mastmodeladd(astupmk_id:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createmodel`,astupmk_id);
}

custodianadd(data:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createcustodian`,data);
}

mastlocadd(data:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createlocation`,data);
}

masterconfidentadd(data:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createconf`,data);
}

masterintegadd(data:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createinte`,data);
}

mastavailadd(data:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createavail`,data);
}

mastfamadd(data:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createfamily`,data);
}

//mailsend-api
warrantymail(data:any): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/warnty/api/v1/getWarrantyMailList`,data);
 }

 warrantylist():Observable<any>{
  return this.http.get<any>(`${environment.apiUrl}/warnty/api/v1/emailwarrantylist`);
}
warrantyupdatemail(wemail_id:any): Observable<any>  {
  return this.http.put<any>(`${environment.apiUrl}/warnty/api/v1/updatewemail`,wemail_id)
}
warmaildel(data:any): Observable<any>  {
  return this.http.post<any>(`${environment.apiUrl}/warnty/api/v1/deletewemail`,data)

}


}



