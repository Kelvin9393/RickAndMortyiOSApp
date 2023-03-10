//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 24/12/2022.
//

import Foundation

struct RMEpisode: Codable, RMEpisodeDataRender {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
