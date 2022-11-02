import { Inject, Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpParams, HttpStatusCode } from '@angular/common/http';
import { catchError, Observable, throwError } from 'rxjs';
import { ToastService } from './toast.service';

@Injectable({
  providedIn: 'root'
})
export class HttpService {

  constructor(
    @Inject('BASE_URL') private baseUrl: string,
    private readonly httpClient: HttpClient,
    private readonly toastService: ToastService
  ) { }

  public get<TResponse = any>(controller: string, endpoint: string, queryParams?: any): Observable<TResponse> {
    const params = new HttpParams({ fromObject: queryParams });
    const request = this.httpClient.get<TResponse>(this.getUrl(controller, endpoint), { params });
    return this.getHttpResponse(request);
  }

  public post<TResponse = any>(controller: string, endpoint: string, body?: any): Observable<TResponse> {
    const request = this.httpClient.post<TResponse>(this.getUrl(controller, endpoint), body);
    return this.getHttpResponse(request);
  }

  public put<TResponse = any>(controller: string, endpoint: string, body: any): Observable<TResponse> {
    const request = this.httpClient.put<TResponse>(this.getUrl(controller, endpoint), body);
    return this.getHttpResponse(request);
  }

  public delete<TResponse = any>(controller: string, endpoint: string): Observable<TResponse> {
    const request = this.httpClient.delete<TResponse>(this.getUrl(controller, endpoint));
    return this.getHttpResponse(request) 
  }

  public patch<TResponse = any>(controller: string, endpoint: string, body: any): Observable<TResponse> {
    const request = this.httpClient.patch<TResponse>(this.getUrl(controller, endpoint), body);
    return this.getHttpResponse(request);
  }

  private getHttpResponse<TResponse = any>(httpRequest: Observable<TResponse>): Observable<TResponse> {
    return httpRequest.pipe(
      catchError((error: HttpErrorResponse) => this.handleHttpError(error))
    )
  }

  private handleHttpError(error: HttpErrorResponse): Observable<never> {
    if (error.status === HttpStatusCode.Unauthorized) {
      // this.logoutService.logout();
      this.toastService.publish('Session expired, please login again');
    } else {
      this.toastService.publish('An error has occurred');
    }

    return throwError(() => error);
  }

  private getUrl(controller: string, endpoint?: string): string {
    const apiBaseUrl = `${this.baseUrl}api`;

    return endpoint
      ? `${apiBaseUrl}/${controller}/${endpoint}`
      : `${apiBaseUrl}/${controller}`;
  }
}
