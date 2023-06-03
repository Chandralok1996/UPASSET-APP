export class User{
    id:string
    token:string
    name:string
    password:string
    rolename:string
    username:string
    userid:string
    vipstatus:string
    empid:string
    message:string
    orgdet: {
        org:string,
        usorg_id: string
    }
}


export interface userdataCount {
    status:string;
    data1:string;
    count:number;
    sgname:string;
    priority:string;
    
}