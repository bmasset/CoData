//
//  ListeCell.swift
//  CoData
//
//  Created by B Masset on 11/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit

class ListeCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    var liste: Liste!
    
    func setupCell(liste: Liste) {
        self.liste = liste
        nameLbl.text = self.liste.name
    
    }
    
}
