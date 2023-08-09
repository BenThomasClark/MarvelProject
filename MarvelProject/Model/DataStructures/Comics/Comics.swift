//
//  Comics.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import Foundation

struct Comics: Codable, Hashable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
    
    func getItemsName() -> [String]? {
        var output: [String] = []
        guard let items = self.items else {
            return output
        }
        for item in items {
            output.append(item.name ?? "")
        }
        return output
    }
}
