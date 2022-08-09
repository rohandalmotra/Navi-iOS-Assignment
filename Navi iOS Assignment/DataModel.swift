//
//  DataModel.swift
//  Navi iOS Assignment
//
//  Created by Rohan Dalmotra on 08/08/22.
//

import Foundation

struct DataModel: Codable{
    
    let title: String
    let created_at: String
    let closed_at: String
    let user: User
}
struct User: Codable{
    let login: String
    let avatar_url: String
}
