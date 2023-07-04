
import { NgModule } from '@angular/core';
import {HttpClientModule} from '@angular/common/http';
import { MaterialModule } from './material_module/material/material.module';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { AuthGuard, ErrorInterceptor, JwtInterceptor } from './_helpers';
import { AccountService } from '../app/_services/account.service';
import { AlertComponent } from '../app/_components/alert.component';
import { SidenavComponent } from './sidenav/sidenav.component';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { DesktopPdfComponent } from './Asset-management/desktop-pdf/desktop-pdf.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule } from '@angular/router';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrModule } from 'ngx-toastr';
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
    FormsModule,
    RouterModule,
    BrowserModule,
    MaterialModule,
    HttpClientModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    ToastrModule.forRoot()
  ],
  providers: [  AccountService, AuthGuard,
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },


],
  bootstrap: [AppComponent]
})
export class AppModule { }
