//
//  API+CoreFunctionality.swift
//  MarvelProject
//
//  Created by Ben Clark on 09/08/2023.
//

import Foundation

extension APIMediator {
    func md5Generator(pubKey: String, timeStamp: Int, privKey: String) -> String {
        let md5 = "\(timeStamp)\(privKey)\(pubKey)"
        return md5.MD5
    }
    
    func getURL() -> URL? {
        let time = 12345
        return urlRequest(time: time)
        func urlRequest(time: Int) -> URL?{
            var api = "https://gateway.marvel.com:443/v1/public/characters?limit=\(heroLimit)&ts=\(time)&apikey=\(publicKey)&hash="
            api.append(md5Generator(pubKey:publicKey, timeStamp: time, privKey: privateKey))
            let apiUrl = URL(string: api)
            return apiUrl
        }
    }
    
    
}
