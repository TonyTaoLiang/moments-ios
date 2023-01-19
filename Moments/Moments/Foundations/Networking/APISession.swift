//
//  APISession.swift
//  Moments
//
//  Created by chenying on 2022/12/14.
//

import Foundation
import Alamofire
import RxSwift

enum APISessionError: Error {
    case networkError(error: Error, statusCode: Int)
    case invalidJSON
    case noData
}

protocol APISession {
    associatedtype ReponseType: Codable
    func post(_ path: String, header: HTTPHeaders, parameters: Parameters?) -> Observable<ReponseType>
}

extension APISession {
    var defaultHeader: HTTPHeaders {
        let header: HTTPHeaders = [
            "Authorization": "Bearer " + L10n.Development.token,
            "x-app-platform": "iOS",
            "x-app-version": UIApplication.appVersion,
            "x-os-version": UIDevice.current.systemVersion
        ]
        return header
    }
    var baseURL: URL {
        return API.baseURL!
    }
    func post(_ path: String, header: HTTPHeaders, parameters: Parameters?) -> Observable<ReponseType> {
        return request(path, method: .post, header: header, parameters: parameters, encoding: JSONEncoding.default)
    }
}

private extension APISession {
    func request(_ path: String, method: HTTPMethod, header: HTTPHeaders, parameters: Parameters?, encoding: ParameterEncoding) -> Observable<ReponseType> {
        let url = baseURL.appendingPathComponent(path)
        let allHeaders = HTTPHeaders(defaultHeader.dictionary.merging(header.dictionary) { $1 })
        return Observable.create { observer in
            let queue = DispatchQueue(label: "moments.app.api", qos: .background, attributes: .concurrent)
            let request = AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: allHeaders, interceptor: nil, requestModifier: nil)
                .validate()
                .responseJSON(queue: queue) { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            observer.onError(response.error ?? APISessionError.noData)
                           return
                        }
                        do {
                            let model = try JSONDecoder().decode(ReponseType.self, from: data)
                            observer.onNext(model)
                            observer.onCompleted()
                        } catch {
                            observer.onError(error)
                        }
                    case let .failure(error):
                        if let statusCode = response.response?.statusCode {
                            observer.onError(APISessionError.networkError(error: error, statusCode: statusCode))
                        }else {
                            observer.onError(error)
                        }
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
