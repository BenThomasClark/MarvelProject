//
//  API+Search.swift
//  MarvelProject
//
//  Created by Ben Clark on 09/08/2023.
//

import Foundation

extension APIMediator {
    
    func getSearchURL(query: String) -> URL? {
        let time = 12345
        return urlRequest(time: time)
        func urlRequest(time: Int) -> URL?{
            var api = "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(query)&ts=\(time)&apikey=\(publicKey)&hash="
            api.append(md5Generator(pubKey:publicKey, timeStamp: time, privKey: privateKey))
            let apiUrl = URL(string: api)
            return apiUrl
        }
    }
    
    func searchFetch(query: String) {
        var queryString = query
        queryString = queryString.replacingOccurrences(of: " ", with: "")
        if (query == "" || query == " ") {
            // do not search
            return
        }
            self.noSearchResults = false
            let URL = self.getSearchURL(query: query)!
            let task = URLSession.shared.dataTask(with: URL){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                    print("Data error")
                    return
                }
                do {
                    let endpoint = try JSONDecoder().decode(JSONHead.self, from: data)
                    let results = endpoint.data?.results
                    DispatchQueue.main.async {
                        if (results!.count != 0) {
                            // Simple sorting of heros based on name value:
                            self?.SearchHeros = results!.sorted {
                                $0.name! < $1.name!
                            }
                        }
                        else {
                            // set no search results flag to true,
                            // to show no results indicator
                            self?.noSearchResults = true
                        }
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
}
