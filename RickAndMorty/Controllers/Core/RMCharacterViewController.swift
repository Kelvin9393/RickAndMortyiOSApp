//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 24/12/2022.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endpoint: .character, queryParameters: [
            .init(name: "name", value: "rick"),
            .init(name: "status", value: "alive")
        ])
        
        RMService.shared.execute(request,
                                 expecting: RMCharacter.self) { result in
            
        }
    }
}
