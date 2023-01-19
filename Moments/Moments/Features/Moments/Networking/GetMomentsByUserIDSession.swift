//
//  GetMomentsByUserIDSession.swift
//  Moments
//
//  Created by chenying on 2022/12/15.
//

import Foundation
import RxSwift
import Alamofire

protocol GetMomentsByUserIDSessionType {
    func getMoments(userID: Int) -> Observable<Viewer>
}

struct GetMomentsByUserIDSession: GetMomentsByUserIDSessionType {
    struct Response: Codable {
        let data: Data
        
        struct Data: Codable {
            let viewer: Viewer
        }
    }
    struct Session: APISession {
        typealias ReponseType = Response
        let path = L10n.Development.graphqlPath
        let headers: HTTPHeaders = .init()
        let parameters: Parameters
        init(userID: Int) {
            let variables: [AnyHashable: Encodable] = ["number_of_repos" : userID]
            parameters = ["query" : Self.query,
                          "variables" : variables]
        }
        private static let query = """
        query($number_of_repos:Int!){
          viewer {
            name
             repositories(last: $number_of_repos) {
               nodes {
                 name
               }
             }
           }
        }
        """
    }
    
    private let sessionHandler: (Session) -> Observable<Response>
    
    init(_ sessionHandler: @escaping (Session) -> Observable<Response> = {$0.post($0.path, header: $0.headers, parameters: $0.parameters)}) {
        self.sessionHandler = sessionHandler
    }
    func getMoments(userID: Int) -> Observable<Viewer> {
        let session = Session(userID: userID)
        return sessionHandler(session).map {$0.data.viewer}
    }
}
