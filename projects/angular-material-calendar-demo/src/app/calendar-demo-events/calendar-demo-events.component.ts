import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder, UntypedFormControl, UntypedFormGroup } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import * as moment from 'moment';

@Component({
    selector: 'calendar-demo-events',
    templateUrl: './calendar-demo-events.component.html',
    styleUrls: ['./calendar-demo-events.component.scss'],
    standalone: false
})
export class CalendarDemoEvents implements OnInit {

    form?: UntypedFormGroup;
    description?: string;

    constructor(
        private fb: UntypedFormBuilder,
        private dialogRef: MatDialogRef<CalendarDemoEvents>
    ) { }
    ngOnInit(): void {
        this.form = this.fb.group({
            start: new UntypedFormControl(moment().format('yyyy-MM-DDTHH:mm')),
            end: new UntypedFormControl(moment().format('yyyy-MM-DDTHH:mm')),
            title: new UntypedFormControl(''),
            description: new UntypedFormControl(''),
            color: new UntypedFormControl('#5e0d0d')
        });
    }

    save() {
        this.dialogRef.close(this.form!.value);
    }

    close() {
        this.dialogRef.close();
    }


}
