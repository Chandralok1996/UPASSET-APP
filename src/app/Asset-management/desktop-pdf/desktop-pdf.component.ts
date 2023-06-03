import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { AssetService } from 'src/app/_services/asset.service';

import { DatePipe, formatDate } from '@angular/common';
import { jsPDF } from 'jspdf'
import html2canvas from 'html2canvas';

@Component({
  selector: 'app-desktop-pdf',
  templateUrl: './desktop-pdf.component.html',
  styleUrls: ['./desktop-pdf.component.css']
})
export class DesktopPdfComponent implements OnInit {
  // @ViewChild('pdf-content') content: ElementRef;
  details: any;

 date =formatDate(new Date(), 'yyyy-MM-dd', 'en');
  constructor(
    public assetService: AssetService,
    public dialogRef: MatDialogRef<DesktopPdfComponent>,
   
  ) { 
   
  //  this.myDate = this.datePipe.transform(this.myDate, 'yyyy-MM-dd');
  }

  ngOnInit(): void {

    this.assetService.getbyassetdetails(this.assetService.astd_id)
    .subscribe(details => {
        this.details = details.rows;
        console.log(this.details)
    });
  }


  onNoClick() {
    this.dialogRef.close();
  }

  
  



  // pdf conversion
  title = 'html-to-pdf-angular-application';
  public convetToPDF()
  {
  var data = document.getElementById('contentToConvert');
  html2canvas(data).then(canvas => {
  // Few necessary setting options
  var imgWidth = 130;
  var pageHeight = 160;
  var imgHeight = canvas.height * imgWidth / canvas.width;
  var heightLeft = imgHeight;

 
  
  const contentDataURL = canvas.toDataURL('image/png')
  let pdf = new jsPDF('p', 'mm', 'a4'); // A4 size page of PDF
  var position = 0;
  pdf.addImage(contentDataURL, 'PNG', 35, position + 5, imgWidth, imgHeight)
  pdf.save(this.details[0].assetno+'.pdf'); // Generated PDF
  });
  }

  print(): void {
    let printContents, popupWin;
    printContents = document.getElementById('print-section').innerHTML;
    popupWin = window.open('', '_blank', '');
    popupWin.document.open();
    popupWin.document.write(`
      <html>
        <head>
          <title>Print tab</title>
          <style>
          //........Customized style.......
          </style>
        </head>
    <body onload="window.print();window.close()">${printContents}</body>
      </html>`
    );
    popupWin.document.close();
}
  
printToCart(printSectionId: string){
  let popupWinindow
  let innerContents = document.getElementById(printSectionId).innerHTML;
  popupWinindow = window.open('', '_blank', 'width=600,height=700,scrollbars=no,menubar=no,toolbar=no,location=no,status=no,titlebar=no');
  popupWinindow.document.open();
  popupWinindow.document.write('<html><head><link rel="stylesheet" type="text/css" href="style.css" /></head><body onload="window.print()">' + innerContents + '</html>');
  popupWinindow.document.close();
}

}
