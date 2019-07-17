//
//  ArticleController.swift
//  CoData
//
//  Created by B Masset on 15/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit

class ArticleController: UIViewController {
    
    var liste: Liste!
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let articles = liste.article?.allObjects as? [Article] {
            self.articles = articles
            //for article in articles {
            //    print(article.name, article.prix)
            //}
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add", let controller = segue.destination as? AddArticleController {
            controller.liste = liste
        }
    }
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: nil)
    }
    
}
