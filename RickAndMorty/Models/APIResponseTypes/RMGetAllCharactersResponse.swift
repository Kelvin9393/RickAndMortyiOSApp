//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 29/12/2022.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
