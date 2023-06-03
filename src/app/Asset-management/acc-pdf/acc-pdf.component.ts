import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { AssetService } from 'src/app/_services/asset.service';

import { DatePipe } from '@angular/common';
import { jsPDF } from 'jspdf'
import html2canvas from 'html2canvas';

@Component({
  selector: 'app-acc-pdf',
  templateUrl: './acc-pdf.component.html',
  styleUrls: ['./acc-pdf.component.css']
})
export class AccPdfComponent implements OnInit {
  // @ViewChild('pdf-content') content: ElementRef;
  details: any;

 date = new Date();
  constructor(
    public assetService: AssetService,
    public dialogRef: MatDialogRef<AccPdfComponent>,
   
  ) { 
   
  //  this.myDate = this.datePipe.transform(this.myDate, 'yyyy-MM-dd');
  }

  ngOnInit(): void {

    this.assetService.getbyassetdetailsAccesory(this.assetService.astd_id)
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
  this.printPage()
  }


printPage() {
  window.print();
}

}

