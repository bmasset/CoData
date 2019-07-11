//
//  ViewController.swift
//  CoData
//
//  Created by B Masset on 10/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit
import CoreData

class ListeController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var nameTF: UITextField!
    
    var listes: [Liste] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateListe()
    }

    func updateListe() {
        CoreDataHelper().getListe { (listes) in
            if listes != nil {
                DispatchQueue.main.async {
                    self.listes = listes!
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func addListe(_ sender: UIButton) {
        CoreDataHelper().saveListe(nameTF.text)
        updateListe()
        
    }
}

