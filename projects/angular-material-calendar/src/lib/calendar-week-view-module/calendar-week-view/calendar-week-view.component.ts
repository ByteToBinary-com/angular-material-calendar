import { Component, Input } from '@angular/core';
import { CalendarEventInput } from '../../calendar-modal/calendar-event/calendar-event-input';
import { Observable } from 'rxjs';
@Component({
    selector: 'app-angular-material-calendar-week-view',
    templateUrl: './calendar-week-view.component.html',
    styleUrls: [
        './calendar-week-view.component.scss'
    ],
    standalone: false
})
export class CalendarWeekViewComponent {
    @Input()
    events$?: Observable<CalendarEventInput[]>;
    constructor() {}
}
