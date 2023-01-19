//
//  MomentsDetails.swift
//  Moments
//
//  Created by chenying on 2022/12/14.
//

import Foundation

struct Viewer: Codable {
    let name: String
    let repositories: Repositories
    struct Repositories: Codable {
        let nodes: [Node]
    }
    struct Node: Codable {
        let name: String
    }
}
