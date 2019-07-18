//
//  CoreDataHelper.swift
//  CoData
//
//  Created by B Masset on 11/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit
import CoreData

typealias ListeCompletion = (_ listes: [Liste]?) -> Void

class CoreDataHelper {
    
    // récupérer base CoreData
    private let appDel = UIApplication.shared.delegate as! AppDelegate
    
    // récupérer le contexte
    var context: NSManagedObjectContext {
        return appDel.persistentContainer.viewContext
    }
    
    // Sauvegarder dans CoreData
    func save() {
        appDel.saveContext()
    }
    
    // Logique ENTITY Liste
    
    func saveListe(_ string:String?) {
        guard let texte = string, texte != "" else { return }
        let nouvelleListe = Liste(context: context)
        nouvelleListe.date = Date()
        nouvelleListe.name = texte
        save()
        print("Sauvegardé")

    }
    
    func getListe(completion: ListeCompletion?) {
        let fetchRequest: NSFetchRequest<Liste> = Liste.fetchRequest()
        // pour trier les éléments reçus
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            let listes = try context.fetch(fetchRequest)
            completion?(listes)
            for l in listes {
                print(l.name)
            }
        } catch {
            completion?(nil)
            print(error.localizedDescription)
        }
    }
    
    func deleteListe(_ liste:Liste) {
        if let articles = liste.article?.allObjects as? [Article] {
            for article in articles {
                context.delete(article)
            }
        }
        
        context.delete(liste)
        do {
            try context.save()
        } catch {
          print(error.localizedDescription)
        }
        
    }
    
    // Logique Entity Article
    
    func saveArticle(name: String?, shop: String?, prix: String?, image: UIImage?, liste: Liste) {
        let new = Article(context: context)
        new.date = Date()
        new.name = name
        new.shop = shop
        new.image = image
        if let str = prix, let double = Double(str) {
            new.prix = double
        }
        new.liste = liste
        save()
    }
    
    func deleteArticle(_ article: Article) {
        context.delete(article)
        do {
            try context.save()
            NotificationCenter.default.post(name: Notification.Name("delete"), object: nil)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
