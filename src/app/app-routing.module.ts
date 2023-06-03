import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { AuthGuard } from './_helpers';

const userModule = () => import('../app/User_management/user.module').then(x => x.UserModule);


const routes: Routes = [
  {path: '', pathMatch:'full', redirectTo:'login' },
  { path: 'login', component:LoginComponent  },
  { path: 'home' , component:HomeComponent, canActivate: [AuthGuard],// canActivate: [AuthGuard], 
  children: [{
      path: 'users', loadChildren: userModule
  }]
},
  
    //{ path: '**', redirectTo: '/' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
