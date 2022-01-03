import {Component, OnInit} from '@angular/core';
import {EmployeesService} from "../service/employees.service";
import {Employee} from "../interface/employee";
import {map, Observable, of, startWith} from "rxjs";
import {AppState} from "../interface/app-state";
import {CustomResponse} from "../interface/custom-response";
import {DataState} from "../enum/data-state.enum";
import {catchError} from "rxjs/operators";

@Component({
  selector: 'app-employees',
  templateUrl: './employees.component.html',
  styleUrls: ['./employees.component.css']
})
export class EmployeesComponent implements OnInit {
  appState$!: Observable<AppState<CustomResponse>>;
  readonly DataState = DataState;

  constructor(private employeesService: EmployeesService) {
  }

  ngOnInit(): void {
    this.appState$ = this.employeesService.getEmployees$
      .pipe(
        map(response => {
          return {dataState: DataState.LOADED_STATE, appData: response}
        }),
        startWith({dataState: DataState.LOADING_STATE}),
        catchError((error: string) => {
          return of({dataState: DataState.ERROR_STATE, error: error})
        })
      );
  }

  // handleSuccessfulResponse(response: any) {
  //   this.employees = response.data.employees;
  // }

}
