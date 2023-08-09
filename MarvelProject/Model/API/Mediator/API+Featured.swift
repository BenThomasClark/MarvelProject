//
//  APIMediatorExtras.swift
//  MarvelProject
//
//  Created by Ben Clark on 07/08/2023.
//

import Foundation

extension APIMediator {
        
    func getFeaturedList() {
        let uniqueIds = Array(Set(featuredIds))
        for id in uniqueIds {
            fetchSingleCharacter(id: id)
        }
    }
    
    func fetchSingleCharacter(id: Int) {
        let URL = self.getURLwithId(id: id)!
        let task = URLSession.shared.dataTask(with: URL){[weak self] data, _, error in
            guard let data = data, error == nil else{
                print("Data error")
                return
            }
            do {
                let endpoint = try JSONDecoder().decode(JSONHead.self, from: data)
                let results = endpoint.data?.results
                DispatchQueue.main.async {
                    self?.FeaturedHeros.append(results![0])
                    self?.FeaturedHeros = self?.sortHerosByName(self?.FeaturedHeros ?? []) ?? []
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
