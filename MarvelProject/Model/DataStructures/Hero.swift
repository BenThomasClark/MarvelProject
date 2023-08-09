//
//  Hero.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import Foundation

class Hero: Codable, Hashable, ObservableObject {
    static func == (lhs: Hero, rhs: Hero) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    var name: String?
    let description: String?
    var thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?
}
