//
//  Thumbnail.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import Foundation

struct Thumbnail: Codable, Hashable {
    var path: String?
    let thumbnailExtension: Extension?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
