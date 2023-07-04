import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { UserLayoutComponent } from '../User_management/user-layout/user-layout.component';
import { UserListComponent } from '../User_management/user-list/user-list.component';
import { AssteDektopListComponent } from '../Asset-management/asste-dektop-list/asste-dektop-list.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { UserGrpComponent } from './user-grp/user-grp.component';
import { UserRoleComponent } from './user-role/user-role.component';

import { EndUserLandComponent } from '../end-user/end-user-land/end-user-land.component';
import { AssteServerListComponent } from '../Asset-management/asste-server-list/asste-server-list.component';
import { IndidentListComponent } from '../incident-management/indident-list/indident-list.component';
import { IncPdpComponent } from '../incident-management/inc-pdp/inc-pdp.component';
import { SupportListComponent } from '../support-user/support-list/support-list.component';
import { CoordinatorListComponent } from '../coordinator/coordinator-list/coordinator-list.component';

import { UserpdpComponent } from './userpdp/userpdp.component';
import { UsergrpPdpComponent } from './usergrp-pdp/usergrp-pdp.component';
import { UserrolePdpComponent } from './userrole-pdp/userrole-pdp.component';
import { MonitorListComponent } from '../Asset-management/monitor-list/monitor-list.component';
import { AssetDesktopDetailsComponent } from '../Asset-management/asset-desktop-details/asset-desktop-details.component';
import { AssetAccessoriesListComponent } from '../Asset-management/asset-accessories-list/asset-accessories-list.component';
import { AssetAccessoriesDetailsComponent } from '../Asset-management/asset-accessories-details/asset-accessories-details.component';
import { AssetMonitorDetailsComponent } from '../Asset-management/asset-monitor-details/asset-monitor-details.component';
import { InventoryComponent } from '../Asset-management/inventory/inventory.component';
import { AuthGuard } from '../_helpers/auth.guard';
import { UserProfileComponent } from '../user-profile/user-profile.component';
import { ServerPdpComponent } from '../Asset-management/server-pdp/server-pdp.component';
import { ReportingComponent } from '../reporting/reporting.component';
import { GraphComponent } from '../graph/graph.component';
import { ReportDataComponent } from '../Asset-Report/report-data/report-data.component';
import { AddFieldComponent } from '../Asset-management/add-field/add-field.component';
import { LeftempListComponent } from './leftemp-list/leftemp-list.component';
import { AssetAccessoriesComponent } from '../Asset-management/asset-accessories/asset-accessories.component';
import { AssteServerComponent } from '../Asset-management/asste-server/asste-server.component';
import { AssetMonitorComponent } from '../Asset-management/asset-monitor/asset-monitor.component';
import { AssteDektopComponent } from '../Asset-management/asste-dektop/asste-dektop.component';
import { AssteLaptopComponent } from '../Asset-management/asste-laptop/asste-laptop.component';
import { UpdateAccesoryComponent } from '../Asset-management/update-accesory/update-accesory.component';
import { UpdateServerComponent } from '../Asset-management/update-server/update-server.component';
import { UpdateDesktopComponent } from '../Asset-management/update-desktop/update-desktop.component';
import { UpdateMonitorComponent } from '../Asset-management/update-monitor/update-monitor.component';
import { NewTicketUserComponent } from '../new-ticket-user/new-ticket-user.component';
import { NewTicketComponent } from '../new-ticket/new-ticket.component';
import { UpdateTicketComponent } from '../update-ticket/update-ticket.component';
import { UserCreationComponent } from './user-creation/user-creation.component';
import { UpdateUserComponent } from './update-user/update-user.component';
import { AssteLaptopListComponent } from '../Asset-management/asste-laptop-list/asste-laptop-list.component';
import { DateListComponent } from '../date/date-list/date-list.component';

import { AssetComponent } from '../history/asset/asset.component';
import { InactiveFormComponent } from './inactive-form/inactive-form.component';
import { RejoinFormComponent } from './rejoin-form/rejoin-form.component';
import { DashboardCardComponent } from '../dashboard-card/dashboard-card.component';
import { PendingStatusComponent } from '../dashboard-card/pending-status/pending-status.component';
import { CallModeStatusComponent } from '../dashboard-card/call-mode-status/call-mode-status.component';
import { CallResStatusComponent } from '../dashboard-card/call-res-status/call-res-status.component';
import { CallTypeStatusComponent } from '../dashboard-card/call-type-status/call-type-status.component';
import { EngineerDetailsComponent } from '../dashboard-card/engineer-details/engineer-details.component';

import { SlaDetailsComponent } from '../dashboard-card/sla-details/sla-details.component';
import { EngineerCallComponent } from '../dashboard-card/engineer-call/engineer-call.component';
import { HardwareDetailComponent } from '../dashboard-card/hardware-detail/hardware-detail.component';

import { DasboardReportComponent } from '../dashboard-card/dasboard-report/dasboard-report.component';
import { ItlistComponent } from '../Asset-management/itlist/itlist.component';
import { UpdateComponent } from '../Asset-management/update/update.component';
import { MailsendComponent } from '../Asset-management/mailsend/mailsend.component';

@NgModule({
    imports: [RouterModule.forChild(

    [

	  { path: 'mailsend', component: MailsendComponent, pathMatch: 'full', canActivate: [AuthGuard] },

		 //resetpass
        { path: 'update', component: UpdateComponent, pathMatch: 'full', canActivate: [AuthGuard] },

			
	 {path: 'dashboardreport/:id', component: DasboardReportComponent, pathMatch: 'full', canActivate: [AuthGuard]},

	 {path: 'itlist', component: ItlistComponent, pathMatch: 'full' ,   canActivate: [AuthGuard]},

            {path: 'userlist', component: UserListComponent, pathMatch: 'full' ,   canActivate: [AuthGuard]},
           
            {path: 'leftemplist', component: LeftempListComponent, pathMatch: 'full' ,   canActivate: [AuthGuard]},
           
            {path: 'userpdp/:id/:inactive/:rejoin', component: UserpdpComponent, pathMatch: 'full',  canActivate: [AuthGuard]},
            
            {path: 'userpdp', component: UserpdpComponent, pathMatch: 'full',  canActivate: [AuthGuard]},
            
            {path: 'inactive/:id', component: InactiveFormComponent, pathMatch: 'full', canActivate: [AuthGuard]},
        
            {path: 'rejoin/:id', component: RejoinFormComponent, pathMatch: 'full', canActivate: [AuthGuard]},
        
            { path: 'userlayout', component: UserLayoutComponent, pathMatch: 'full',  canActivate: [AuthGuard] },

            {path: 'userrole', component: UserRoleComponent, pathMatch: 'full',  canActivate: [AuthGuard]},
            
            {path: 'userrolepdp', component: UserrolePdpComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'usergrp', component: UserGrpComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'usergrppdp', component: UsergrpPdpComponent, pathMatch: 'full', canActivate: [AuthGuard]},

             
            {path: 'inventory', component: InventoryComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'assetdekstop', component: AssteDektopListComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'assetdetails/:id', component: AssetDesktopDetailsComponent, pathMatch: 'full' , canActivate: [AuthGuard]},

            {path: 'assetserver', component: AssteServerListComponent, pathMatch: 'full',  canActivate: [AuthGuard]},

            {path: 'assetlaptop', component: AssteLaptopListComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'assetmonitor', component: MonitorListComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'assetaccessories', component: AssetAccessoriesListComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'assetmonitprdetails/:id', component: AssetMonitorDetailsComponent, pathMatch: 'full', canActivate: [AuthGuard]},
          
            {path: 'assetaccessoriesdetails/:id', component: AssetAccessoriesDetailsComponent, pathMatch: 'full', canActivate: [AuthGuard]},

             {path: 'incident', component: IndidentListComponent, pathMatch: 'full', canActivate: [AuthGuard]},

             {path: 'incpdp/:id', component: IncPdpComponent, pathMatch: 'full' , canActivate: [AuthGuard]},

             {path: 'userprofile/:id', component: UserProfileComponent, pathMatch: 'full' , canActivate: [AuthGuard]},

            {path: 'enduser', component: EndUserLandComponent, pathMatch: 'full',  canActivate: [AuthGuard]},

            {path: 'supuser', component: SupportListComponent, pathMatch: 'full',  canActivate: [AuthGuard]},
            
            
            {path: 'coordinator', component: CoordinatorListComponent, pathMatch: 'full' , canActivate: [AuthGuard]},
            
            {path: 'serverpdp/:id', component: ServerPdpComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'report', component: ReportingComponent, pathMatch: 'full' , canActivate: [AuthGuard]},
           
            {path: 'graph', component: GraphComponent, pathMatch: 'full' , canActivate: [AuthGuard]},
            
            {path: 'assetreport', component: ReportDataComponent, pathMatch: 'full' , canActivate: [AuthGuard]},
    
            {path: 'modal', component: AddFieldComponent, pathMatch: 'full' , canActivate: [AuthGuard]},
      
        
            // form route
            {path: 'laptopcreation', component: AssteLaptopComponent, pathMatch: 'full' ,   canActivate: [AuthGuard]},

            {path: 'desktopcreation', component: AssteDektopComponent, pathMatch: 'full' ,   canActivate: [AuthGuard]},

            {path: 'monitorcreation', component: AssetMonitorComponent, pathMatch: 'full' ,   canActivate: [AuthGuard]},

            {path: 'servercreation', component: AssteServerComponent, pathMatch: 'full' ,   canActivate: [AuthGuard]},

            {path: 'accesoriescreation', component: AssetAccessoriesComponent, pathMatch: 'full' ,   canActivate: [AuthGuard]},
          
            {path: 'ticketcreation', component: NewTicketUserComponent, pathMatch: 'full', canActivate: [AuthGuard]},
          
            {path: 'ticketcreationenduser', component: NewTicketComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'usercreation', component: UserCreationComponent, pathMatch: 'full', canActivate: [AuthGuard]},

          
            // update form

            {path: 'updateaccesory/:id', component: UpdateAccesoryComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'updateserver/:id', component: UpdateServerComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'updatedesktop/:id', component: UpdateDesktopComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'updatemonitor/:id', component: UpdateMonitorComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'updateticket/:id', component: UpdateTicketComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'updateuser/:id', component: UpdateUserComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'datelist', component: DateListComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'assethistory', component: AssetComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'dashboardstatus', component: DashboardCardComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'dashboard', component: DashboardComponent, pathMatch: 'full', canActivate: [AuthGuard]},
          
            {path: 'pendingstatus/:status', component: PendingStatusComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'callmodestatus/:status', component: CallModeStatusComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'callresstatus/:status', component: CallResStatusComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'calltypestatus/:status', component: CallTypeStatusComponent, pathMatch: 'full', canActivate: [AuthGuard]},

            {path: 'engineerdetail/:id', component: EngineerDetailsComponent, pathMatch: 'full', canActivate: [AuthGuard]},
    
            {path: 'sladetail/:id/:quater', component: SlaDetailsComponent, pathMatch: 'full', canActivate: [AuthGuard]},
    
            {path: 'engineercall', component: EngineerCallComponent, pathMatch: 'full', canActivate: [AuthGuard]},
            
            {path: 'hardware/:id/:quater', component: HardwareDetailComponent, pathMatch: 'full', canActivate: [AuthGuard]},
        
            
        
        ]
        
    )],
    exports: [RouterModule]
})
export class UserRoutingModule { }
