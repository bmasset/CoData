//
//  MonArticleCell.swift
//  CoData
//
//  Created by B Masset on 17/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit

class MonArticleCell: UITableViewCell {
    
    @IBOutlet weak var articleIV: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var magasinLbl: UILabel!

    var article: Article!
    
    func setup(_ article: Article) {
        self.article = article
        nameLbl.text = self.article.name
        if let shop = self.article.shop {
            magasinLbl.text = "Magasin: " + shop

        } else {
            magasinLbl.text = ""
        }
        if let date = self.article.date {
            dateLbl.text = date.toString()
        }
        priceLbl.text = "Prix: \(self.article.prix) €"
        
        articleIV.image = self.article.image as? UIImage
    }
}
