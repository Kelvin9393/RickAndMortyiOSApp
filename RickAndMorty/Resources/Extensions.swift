//
//  Extensions.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 29/12/2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
