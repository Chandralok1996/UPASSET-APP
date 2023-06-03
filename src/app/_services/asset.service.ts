import { Injectable, Input } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { BehaviorSubject, Observable, throwError } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';

import { environment } from '../../environments/environment';
import { User } from '../_models';
import { assetlist } from '../_models/asset';
import { AccountService } from './account.service';


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
        private accountService: AccountService
    )
    {}

    // assetDesktop(): Observable<any>{
    //     return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getdesktop/${this.accountService.user.orgdet.usorg_id}`);
    // }








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

    assetforperticularuser(user_id) {
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
      //  console.log(this.accountService.user.orgdet.usorg_id)
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

    getbyassetdetails(asset) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyasset/${asset}`);
    }

    getbyassetdetailsMonitor(asset) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyassetMonitor/${asset}`);
    }

    getbyassetdetailsAccesory(asset) {
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyassetAccessories/${asset}`);
    }

    monitor(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getmonitor`);
    }

    accessories(): Observable<any>{
        return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getaccessory`);
    }



    assetDesktopInsert(asset): Observable<any>  {

        return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createdesktop`, asset)
        // .pipe(
        //     tap((_) => {
        //         console.log(_)
        //     }),
        //     catchError(this.handleError)

        // );

    }

    assetDesktopUpdate(asset): Observable<any>  {
        return this.http.put<any>(`${environment.apiUrl}/assets/api/v1/updatedesktop`, asset)
    }

    assetMonitorInsert(asset): Observable<any>  {
        return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createmonitor`, asset)
    }

    assetMonitorUpdate(asset): Observable<any>  {
        return this.http.put<any>(`${environment.apiUrl}/assets/api/v1/updatemonitor`, asset)
    }

    assetAccessoriesInsert(asset): Observable<any>  {
        return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createaccessory`, asset)
    }

    handleError(error) {
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

serverModel(make) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyservermodel/${make}`);
}

serverramSize(rtype: string) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyserverram/${rtype}`);
}

serverOSS(os: string) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyserveros/${os}`);
}

assetServerInsert(asset): Observable<any>  {

    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createserver`, asset)

}

assetServerUpdate(asset): Observable<any>  {

    return this.http.put<any>(`${environment.apiUrl}/assets/api/v1/updateserver`, asset)

}

getbyassetserverdetails(asset) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getbyserverdetails/${asset}`);
}



sortstatus(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getasts`);
}

sortAssetGroup(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastg`);
}



reportData(data): Observable<any>{

     return this.http.post<any>(`${environment.apiUrl}/report/api/v1/assetreport`, data);
 }

 newVendor(asset): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewvendor`, asset)
}

newOS(asset): Observable<any>  {
    console.log(asset);
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewos`, asset)
}

newMake(asset): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewmodel`, asset)
}

newProc(asset): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewpro`, asset)
}

newram(asset): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewram`, asset)
}

newhdd(asset): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewhdd`, asset)
}


newgpu(asset): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/addnewgpu`, asset)
}


validateAssetno(asset) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/validateastname/${asset}`);
}


validateSerialNum(group,serialno) {
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/validateserialno/${group}/${serialno}`);
}


getbyassetHistory(astd_id) {
    return this.http.get<any>(`${environment.apiUrl}/history/api/v1/asthistory/${astd_id}`);
}


getbyuserHistory(empid) {
    return this.http.get<any>(`${environment.apiUrl}/history/api/v1/asthistoryempid/${empid}`);
}

organization(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/user/api/v1/getorg`);
}


// asset management API

assettype(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastt`);
}
assetcat(astt_id){
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastc/${astt_id}`);
}

assetgrp(astc_id){
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getastg/${astc_id}`);
}
makee(astg_id): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetmake/${astg_id}`);
}
model(astupmk_id){
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
createasset(data): Observable<any>  {
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createasset`, data)
}
 //update-asset-API
 assetupdation(astd_id): Observable<any>  {
    return this.http.put<any>(`${environment.apiUrl}/assets/api/v1/updateasset`,astd_id)
}

//list-api
assetlist(): Observable<any>{
    return this.http.get<any>(`${environment.apiUrl}/assets/api/v1/getassetlist`);
}

//pdp-detail
getbyasset(astd_id): Observable<any>{
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
masttypeadd(data): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createtype`,data);
}

mastcateadd(astt_id): Observable<any>{
    return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createcategory`,astt_id);
}

mastgrpadd(astc_id): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/creategroup`,astc_id);
}

mastmkadd(astg_id): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createmake`,astg_id);
}

mastmodeladd(astupmk_id): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createmodel`,astupmk_id);
}

custodianadd(data): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createcustodian`,data);
}

mastlocadd(data): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createlocation`,data);
}

masterconfidentadd(data): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createconf`,data);
}

masterintegadd(data): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createinte`,data);
}

mastavailadd(data): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createavail`,data);
}

mastfamadd(data): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/assets/api/v1/createfamily`,data);
}

//mailsend-api
warrantymail(data): Observable<any>{
  return this.http.post<any>(`${environment.apiUrl}/warnty/api/v1/getWarrantyMailList`,data);
 }

 warrantylist():Observable<any>{
  return this.http.get<any>(`${environment.apiUrl}/warnty/api/v1/emailwarrantylist`);
}
warrantyupdatemail(wemail_id): Observable<any>  {
  return this.http.put<any>(`${environment.apiUrl}/warnty/api/v1/updatewemail`,wemail_id)
}
warmaildel(data): Observable<any>  {
  console.log(data);

  return this.http.post<any>(`${environment.apiUrl}/warnty/api/v1/deletewemail`,data)

}


}



