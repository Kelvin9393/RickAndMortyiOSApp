//
//  RMTabBarController.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 24/12/2022.
//

import UIKit

/// Controller to house tabs and root tab controller
final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let charactersVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: charactersVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = .init(title: "Character", image: .init(systemName: "person.fill"), tag: 1)
        nav2.tabBarItem = .init(title: "Locations", image: .init(systemName: "globe"), tag: 2)
        nav3.tabBarItem = .init(title: "Episodes", image: .init(systemName: "tv"), tag: 3)
        nav4.tabBarItem = .init(title: "Settings", image: .init(systemName: "gear"), tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
}

