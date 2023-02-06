//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 05/02/2023.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    
    private let imageUrl: URL?
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> ()) {
        guard let imageUrl = imageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        RMImageLoader.shared.downloadImage(imageUrl, completion: completion)
    }
}
