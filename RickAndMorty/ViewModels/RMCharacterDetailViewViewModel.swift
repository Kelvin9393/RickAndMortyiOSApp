//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 01/01/2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var requestUrl: URL? {
        URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
    public func fetchCharacterData() {
        guard let url = requestUrl,
              let request = RMRequest(url: url) else {
            print("Failed to create")
            return
        }
        
        RMService.shared.execute(request, expecting: String.self) { result in
            switch result {
            case .success(let str):
                print(str)
            case .failure(let error):
                print(error )
            }
        }
    }
}
