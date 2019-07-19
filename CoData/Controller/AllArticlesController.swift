//
//  AllArticlesController.swift
//  CoData
//
//  Created by B Masset on 15/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit

class AllArticlesController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var isSearching = false
    
    var allArticles: [Article] = []
    var queryArticle: [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: articleCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: articleCell)
        searchBar.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("delete"), object: nil)
    }
    
    @objc func reload() {
        CoreDataHelper().allArticles { (articles) in
            if articles != nil {
                DispatchQueue.main.async {
                    self.allArticles = articles!
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }
}

    extension AllArticlesController: UISearchBarDelegate {
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText == "" {
                isSearching = false
                tableView.reloadData()
            } else {
                isSearching = true
                CoreDataHelper().queryArticle(string: searchText) { (articles)
                    in
                    if articles != nil {
                        DispatchQueue.main.async {
                            self.queryArticle =     articles!
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            // permet de ranger le clavier
            searchBar.resignFirstResponder()
        }
    }
    
extension AllArticlesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return queryArticle.count
        } else {
            return allArticles.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: articleCell) as? MonArticleCell {
            if isSearching {
                cell.setup(queryArticle[indexPath.row])
            } else {
                cell.setup(allArticles[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
    
    // ajout perso
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    }
    
    
    
