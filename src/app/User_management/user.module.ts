import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { NgMultiSelectDropDownModule } from 'ng-multiselect-dropdown';
import {AutocompleteLibModule} from 'angular-ng-autocomplete';
import { OwlDateTimeModule, OwlNativeDateTimeModule } from 'ng-pick-datetime';
// import { Ng2SearchPipeModule } from 'ng2-search-filter';
// import { NgxPaginationModule } from 'ngx-pagination';

 import { MaterialModule } from '../material_module/material/material.module'
 import { UserRoutingModule } from './user-routing.module';
 import { UserLayoutComponent } from '../User_management/user-layout/user-layout.component';
 import { UserListComponent } from '../User_management/user-list/user-list.component';
 import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { UserRoleComponent } from './user-role/user-role.component';
import { UserGrpComponent } from './user-grp/user-grp.component';
import { UserCreationComponent } from './user-creation/user-creation.component';
import { DashboardComponent } from './dashboard/dashboard.component';

import { EndUserLandComponent } from '../end-user/end-user-land/end-user-land.component';
import { SidenavComponent } from '../sidenav/sidenav.component';
import { NewUserRoleComponent } from './new-user-role/new-user-role.component';
import { NewUserGroupComponent } from './new-user-group/new-user-group.component';
import { AssteDektopComponent } from '../Asset-management/asste-dektop/asste-dektop.component';
import { AssteDektopListComponent } from '../Asset-management/asste-dektop-list/asste-dektop-list.component';
import { AssteServerListComponent } from '../Asset-management/asste-server-list/asste-server-list.component';
import { AssteServerComponent } from '../Asset-management/asste-server/asste-server.component';
import { AssteLaptopComponent } from '../Asset-management/asste-laptop/asste-laptop.component';
import { AssteLaptopListComponent } from '../Asset-management/asste-laptop-list/asste-laptop-list.component';
import { IndidentListComponent } from '../incident-management/indident-list/indident-list.component';
import { IncPdpComponent } from '../incident-management/inc-pdp/inc-pdp.component';
import { FilterComponent } from '../incident-management/filter/filter.component';
import { SupportListComponent } from '../support-user/support-list/support-list.component';
import { SupportPdpComponent } from '../support-user/support-pdp/support-pdp.component';
import { CoordinatorListComponent } from '../coordinator/coordinator-list/coordinator-list.component';
import { UserpdpComponent } from './userpdp/userpdp.component';
import { UsergrpPdpComponent } from './usergrp-pdp/usergrp-pdp.component';
import { UserrolePdpComponent } from './userrole-pdp/userrole-pdp.component';
import { MonitorListComponent } from '../Asset-management/monitor-list/monitor-list.component';
import { AssetMonitorComponent } from '../Asset-management/asset-monitor/asset-monitor.component';
import { AssetDesktopDetailsComponent } from '../Asset-management/asset-desktop-details/asset-desktop-details.component';
import { UpdateDesktopComponent } from '../Asset-management/update-desktop/update-desktop.component';
import { AssetAccessoriesListComponent } from '../Asset-management/asset-accessories-list/asset-accessories-list.component';
import { AssetAccessoriesComponent } from '../Asset-management/asset-accessories/asset-accessories.component';
import { UpdateMonitorComponent } from '../Asset-management/update-monitor/update-monitor.component';
import { UpdateAccesoryComponent } from '../Asset-management/update-accesory/update-accesory.component';
import { AssetAccessoriesDetailsComponent } from '../Asset-management/asset-accessories-details/asset-accessories-details.component';
import { AssetMonitorDetailsComponent } from '../Asset-management/asset-monitor-details/asset-monitor-details.component';
import { UpdateUserComponent } from './update-user/update-user.component';
import { InventoryComponent } from '../Asset-management/inventory/inventory.component';
import { UpdateTicketComponent } from '../update-ticket/update-ticket.component';
import { AttachmentComponent } from '../attachment/attachment.component';
import { UserProfileComponent } from '../user-profile/user-profile.component';
import { ConfirmLogoutComponent } from '../confirm-logout/confirm-logout.component';
import { NewTicketUserComponent } from '../new-ticket-user/new-ticket-user.component';
import { SortComponent } from '../sort/sort.component';
import { ReportingComponent } from '../reporting/reporting.component';
import { GraphComponent } from '../graph/graph.component';
import { ValidatorComponent } from '../Validation/validator/validator.component';
import { UpdateServerComponent } from '../Asset-management/update-server/update-server.component';
import { ServerPdpComponent } from '../Asset-management/server-pdp/server-pdp.component';
import { AssetSortComponent } from '../Asset-Report/asset-sort/asset-sort.component';
import { ReportDataComponent } from '../Asset-Report/report-data/report-data.component';

import { AddFieldComponent } from '../Asset-management/add-field/add-field.component';
import { UserAddFieldComponent } from './user-add-field/user-add-field.component';
import { InactiveFormComponent } from './inactive-form/inactive-form.component';
import { RejoinFormComponent } from './rejoin-form/rejoin-form.component';
import { LeftempListComponent } from './leftemp-list/leftemp-list.component';



import { NewArticleComponent } from '../knowl-management/new-article/new-article.component';
import { ItlistComponent } from '../Asset-management/itlist/itlist.component';


import { NewTicketComponent } from '../new-ticket/new-ticket.component';
import { DateListComponent } from '../date/date-list/date-list.component';
import { AssetComponent } from '../history/asset/asset.component';
import { UserComponent } from '../history/user/user.component';
import { AccPdfComponent } from '../Asset-management/acc-pdf/acc-pdf.component';

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
import { UpdateComponent } from '../Asset-management/update/update.component';
import { MailsendComponent } from '../Asset-management/mailsend/mailsend.component';










@NgModule({
    imports: [
        CommonModule,
        ReactiveFormsModule,
        FormsModule,
         UserRoutingModule,
         MaterialModule,
         NgbModule,
         NgMultiSelectDropDownModule,
         OwlDateTimeModule,
         OwlNativeDateTimeModule,
         AutocompleteLibModule
        
     //  BrowserAnimationsModule,
        
        // Ng2SearchPipeModule,
        // NgxPaginationModule,
    ],
    declarations: [
        UserLayoutComponent,
         UserListComponent,
         UserRoleComponent,
         UserGrpComponent,
         UserCreationComponent,
         DashboardComponent,
         EndUserLandComponent,
         NewUserRoleComponent,
         NewUserGroupComponent,
         AssteDektopComponent,
         AssteDektopListComponent,
         AssteServerListComponent,
         AssteServerComponent,
         AssteLaptopComponent,
     AssteLaptopListComponent,
     IndidentListComponent,
     IncPdpComponent,
     FilterComponent,
     SupportListComponent,
     CoordinatorListComponent,
     SupportPdpComponent,
     UserpdpComponent,
     UsergrpPdpComponent,
     UserrolePdpComponent ,
     AssetMonitorComponent,
     MonitorListComponent,
     AssetDesktopDetailsComponent,
     UpdateDesktopComponent,
     AssetAccessoriesComponent,
     AssetAccessoriesListComponent,
     UpdateMonitorComponent,
     UpdateAccesoryComponent,
     AssetAccessoriesDetailsComponent,
     AssetMonitorDetailsComponent,
     UpdateUserComponent,
     InventoryComponent,
     UpdateTicketComponent,
     AttachmentComponent,
     UserProfileComponent,
ConfirmLogoutComponent ,
NewTicketUserComponent,
SortComponent,
ReportingComponent,
GraphComponent,
ValidatorComponent,
UpdateServerComponent,
ServerPdpComponent,
AssetSortComponent,
ReportDataComponent,
AddFieldComponent,
UserAddFieldComponent,
InactiveFormComponent,
RejoinFormComponent,
LeftempListComponent,

NewTicketComponent,
DateListComponent,
AssetComponent,
UserComponent,
AccPdfComponent,
NewArticleComponent,
DashboardCardComponent,
PendingStatusComponent,
CallModeStatusComponent,
CallResStatusComponent,
CallTypeStatusComponent,
EngineerDetailsComponent,
SlaDetailsComponent,
EngineerCallComponent,
HardwareDetailComponent,
ItlistComponent,
DasboardReportComponent,
UpdateComponent,
 MailsendComponent,

       
        
    ],
    exports: [
        CommonModule,
        ReactiveFormsModule,
        FormsModule,
         UserRoutingModule,
         MaterialModule,
     //  BrowserAnimationsModule,
        
        // Ng2SearchPipeModule,
        // NgxPaginationModule,
    ],
})
export class UserModule { }
