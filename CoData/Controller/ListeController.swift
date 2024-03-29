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
    @IBOutlet weak var holderView: ViewShadow!
    @IBOutlet weak var nameTF: UITextField!
    
    var listes: [Liste] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        nameTF.delegate = self
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "article", let controller = segue.destination as? ArticleController {
            controller.liste = sender as? Liste
        }
    }
    
    @IBAction func addListe(_ sender: UIButton) {
        view.endEditing(true)
        CoreDataHelper().saveListe(nameTF.text)
        updateListe()
        nameTF.text = nil
    }
}


// Delegate et DataSources

extension ListeController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListeCell") as? ListeCell {
            cell.setupCell(liste: listes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let listeASupprimer = listes[indexPath.row]
            listes.remove(at: indexPath.row)
            CoreDataHelper().deleteListe(listeASupprimer)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "article", sender: listes[indexPath.row])
    }
}

extension ListeController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
