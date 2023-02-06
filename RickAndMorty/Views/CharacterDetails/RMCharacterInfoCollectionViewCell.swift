//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 05/02/2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let titleContainerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubviews(titleContainerView, valueLabel, iconImageView)
        titleContainerView.addSubview(titleLabel)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3),
            
            titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            valueLabel.bottomAnchor.constraint(equalTo: titleContainerView.topAnchor),
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = nil
        titleLabel.text = nil
        iconImageView.image = nil
        iconImageView.tintColor = .label
        titleLabel.textColor = .label
    }
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.displayValue
        iconImageView.image = viewModel.iconImage
        iconImageView.tintColor = viewModel.tintColor
        titleLabel.textColor = viewModel.tintColor
    }
}
