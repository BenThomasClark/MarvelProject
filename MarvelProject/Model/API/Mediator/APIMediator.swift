//
//  APIMediator.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import Foundation
import SwiftUI

class APIMediator: ObservableObject {
    
    @Published var Heros: [Hero] = []
    @Published var FeaturedHeros: [Hero] = []
    @Published var SearchHeros: [Hero] = []
    
    @Published var searchHeaderVisible: Bool = true
    @Published var noSearchResults: Bool = false

    let publicKey: String = "0c863702b0b77a585e4071cbc3593dea"
    let privateKey: String = "ff73168904c789744eca56e7c8dbca159776416c"
    let heroLimit = 100
    
    let featuredIds = [
        1009610, 1009718, 1009664, 1009257, 1009368,
        1009262, 1009351, 1009592, 1009220, 1009662,
        1009215, 1009356, 1011318, 1009471, 1009313,
        1009338, 1009191, 1014812, 1009261, 1009571,
        1010795, 1009507, 1009472, 1009515, 1009366,
        1009362, 1011346, 1009504, 1014873, 1010787,
        1009185, 1011490, 1009629, 1009282, 1009243,
        1009452, 1011684, 1009343, 1009508, 1016181,
        1009477, 1009466, 1009175, 1009187, 1009268,
        1009652, 1009189, 1010802, 1010373, 1009310 ] // 50
    
    var time: Int {
        let someDate = Date().timeIntervalSince1970
        let timeStamp = Int(someDate)
        return timeStamp
    }
    
    func getURLwithId(id: Int) -> URL? {
        let time = 12345
        return urlRequest(time: time)
        func urlRequest(time: Int) -> URL?{
            var api = "https://gateway.marvel.com:443/v1/public/characters/\(id)?&ts=\(time)&apikey=\(publicKey)&hash="
            api.append(md5Generator(pubKey:publicKey, timeStamp: time, privKey: privateKey))
            let apiUrl = URL(string: api)
            return apiUrl
        }
    }
    
    func listFetch() {
        let URL = self.getURL()!
        let task = URLSession.shared.dataTask(with: URL){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                print("Data error")
                return
            }
            do {
                let endpoint = try JSONDecoder().decode(JSONHead.self, from: data)
                let results = endpoint.data?.results
                DispatchQueue.main.async {
                    // Simple sorting of heros based on name value:
                    self?.Heros = results!.sorted {
                        $0.name! < $1.name!
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func sortHerosByName(_ heros: [Hero]) -> [Hero] {
        heros.sorted { lhs, rhs in
            lhs.name ?? "" < rhs.name ?? ""
        }
    }
}
