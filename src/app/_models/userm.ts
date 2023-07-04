export class userpdp {
  username?: string;
  user_id?: number;
  deptname?: string;
  deptid?: number;
  emailid?: string;
  mobile?: number;
  location?: string;
  designation_id?: number;
  ut_id?: number;
  ugid?: number
  ugname?: string;
  sgid?: string;
  sgname?: string;
  role_id?: string;
  name_role?: string;
  createdtime?: string;
  description?: string;
  first_name?: string;




}

export class role {
  role_id?: string;
  name_role?: string;
  service_id?: string;
  description?: string;
}

export class usergroup {
  ugid?: string;
  ugname?: string;
  description?: string;
}

export class organization {
  org?: string;
  uscorg_id?: string
}

export class UserC {

  role?: string;
  usergrp?: string;
  designation?: string;
  building?: string;
  floor?: string;
  org?: string;
  branch?: string;
  firstname?: string;
  middlename?: string;
  lastname?: string;
  description?: string;
  title?: string;
  email?: string;
  eightid?: string;
  seccode?: string;
  loginname?: string;
  empid?: string;
  usertype?: string;
  reportingto?: string;
  department?: string;
  password?: string;


}
