//
//  HeroViewModel.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import Foundation

struct HeroViewModel {
    let hero: Hero
    
    func getName() -> String {
        hero.name ?? ""
    }
    
    func getSubtitle() -> String? {
        let name = getName()
        if name != "" && name.contains("("){
            let subtring = name.slice(from: "(", to: ")")
            return subtring
        }
        return nil
    }
    func getCleanName() -> String {
        if getSubtitle() != nil {
            let subtitle = getSubtitle() ?? ""
            var name = getName().replacingOccurrences(of: subtitle, with: "")
            name = name.replacingOccurrences(of: "()", with: "")
            return name
        }
        return getName()
    }
    
    func getImagePath() -> String? {
        guard var imagePath = hero.thumbnail?.path else { return nil }
        if (imagePath.contains("image_not_available")) {
            return nil
        }
        imagePath.append(".jpg")
        return imagePath.replacingOccurrences(of: "http", with: "https")
    }
    func getHeaderImagePath() -> String? {
        guard var imagePath = hero.thumbnail?.path else { return nil }
        if (imagePath.contains("image_not_available")) {
            return nil
        }
        imagePath.append("/portrait_uncanny")
        imagePath.append(".jpg")
        return imagePath.replacingOccurrences(of: "http", with: "https")
    }
    
    func getDescription() -> String? {
        if (hero.description != "") {
            return hero.description
        }
        return nil
    }
    
    func getComics() -> Comics? {
        hero.comics
    }
    
    func getStories() -> Stories? {
        hero.stories
    }
    
    func getEvents() -> Comics? {
        hero.events
    }
}
