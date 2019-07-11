//
//  MaTabBar.swift
//  CoData
//
//  Created by B Masset on 11/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit

class MaTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .darkGray
        // sera lightGray quand non sélectionné
        tabBar.unselectedItemTintColor = .lightGray
        // changer la background color de ma tabBar
        // jaune c'est pas joli
        //tabBar.barTintColor = .yellow
        
        // tabBar transparente
        tabBar.barTintColor = .clear
        tabBar.backgroundImage = UIImage()
    }
}
