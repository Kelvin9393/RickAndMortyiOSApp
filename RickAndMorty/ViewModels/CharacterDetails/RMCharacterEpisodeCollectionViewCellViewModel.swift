//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 05/02/2023.
//

import Foundation

protocol RMEpisodeDataRender {
    var episode: String { get }
    var air_date: String { get }
    var name: String { get }
}

final class RMCharacterEpisodeCollectionViewCellViewModel {
    
    private let episodeDataUrl: URL?
    private var isFetching = false
    private var dataBlock: ((RMEpisodeDataRender) -> ())?
    
    private var episode: RMEpisode? {
        didSet {
            guard let model = episode else {
                return
            }
            
            dataBlock?(model)
        }
    }
    
    // MARK: - Init
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
    
    // MARK: - Public
    
    public func registerForData(_ block: @escaping (RMEpisodeDataRender) -> ()) {
        self.dataBlock = block
    }
    
    public func fetchEpisode() {
        guard !isFetching else {
            if let model = episode {
                dataBlock?(model)
            }
            return
        }
        
        guard let url = episodeDataUrl, let request = RMRequest(url: url) else {
            return
        }
        
        isFetching = true
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let episode):
                DispatchQueue.main.async {
                    self?.episode = episode
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
