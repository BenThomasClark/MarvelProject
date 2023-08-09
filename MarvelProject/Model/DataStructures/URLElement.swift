//
//  URLElement.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import Foundation

struct URLElement: Codable, Hashable {
    let type: URLType?
    let url: String?
    
    func getTypeString() -> String {
        guard let _ = self.type else {
            return ""
        }
        if self.type?.rawValue == "comiclink" {
            return "Comics"
        }
        else if self.type?.rawValue == "detail" {
            return "Site"
        }
        return self.type?.rawValue.capitalized ?? ""
    }
    func getTypeImagePath() -> String {
        switch self.type?.rawValue {
        case "comiclink":
            return "books.vertical.circle.fill"

        case "detail":
            return "desktopcomputer"

        case "wiki":
            return "globe"

        default:
            return "globe"
        }
    }
}
enum URLType: String, Codable, Hashable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
