//
//  String+MD5.swift
//  MarvelProject
//
//  Created by Ben Clark on 02/08/2023.
//

import CryptoKit

extension String {
    var MD5: String {
        let value = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return value.map { String(format: "%02hhx", $0) }.joined()
    }
}
