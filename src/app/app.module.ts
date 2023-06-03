import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
 
import {HttpClientModule} from '@angular/common/http';

// material 
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import { MaterialModule } from './material_module/material/material.module';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { AuthGuard, ErrorInterceptor, JwtInterceptor } from './_helpers';
import { AccountService } from '../app/_services/account.service';
import { AlertComponent } from '../app/_components/alert.component';
import { UserListComponent } from './User_management/user-list/user-list.component';
import { UserLayoutComponent } from './User_management/user-layout/user-layout.component';
import { SidenavComponent } from './sidenav/sidenav.component';
import { UserModule } from '../app/User_management/user.module';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AlertService } from './_services';
import { DesktopPdfComponent } from './Asset-management/desktop-pdf/desktop-pdf.component';


@NgModule({
  declarations: [
    AppComponent,
    AlertComponent,
     SidenavComponent,
     LoginComponent,
     HomeComponent,
     
     DesktopPdfComponent,
     
    
     
    
     
     
    
     
     
    
   
    
     
      
   
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    MaterialModule,
   
   // NgbModule,
    

  ],
  providers: [  AccountService, AuthGuard,
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },

   
],
  bootstrap: [AppComponent]
})
export class AppModule { }
