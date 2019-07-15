//
//  AddArticleController.swift
//  CoData
//
//  Created by B Masset on 15/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit

class AddArticleController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var magasinTF: UITextField!
    
    @IBOutlet weak var prixTF: UITextField!
    
    var liste: Liste!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addArticle(_ sender: Any) {
    }
        
    @IBAction func pictureGallery(_ sender: Any) {
    }
    
    @IBAction func camera(_ sender: Any) {
    }
    
}
