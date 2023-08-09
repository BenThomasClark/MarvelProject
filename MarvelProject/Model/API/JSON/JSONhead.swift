//
//  JSONhead.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import Foundation

struct JSONHead: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: JSONdata?
}

struct singleJSONHead: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: singleJSONdata?
}
