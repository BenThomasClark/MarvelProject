//
//  Hero.swift
//  MarvelProject
//
//  Created by Ben Clark on 02/08/2023.
//

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
}
/*
struct thumbnail: Codable {
    let path: String
        let thumbnailExtension: Extension?
        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension = "extension"
        }
}
enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}
*/
struct Heros: Codable {
    var results: [Hero]
}
