//
//  JSONdata.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import Foundation

struct JSONdata: Codable {
    let offset, limit, total, count: Int?
    let results: [Hero]?
}

struct singleJSONdata: Codable {
    let offset, limit, total, count: Int?
    let result: [Hero]?
}
