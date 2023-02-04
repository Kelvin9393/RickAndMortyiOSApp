//
//  RMCharacterDetailView.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 01/01/2023.
//

import UIKit

/// View for single character info
final class RMCharacterDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
