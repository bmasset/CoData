//
//  Article+CoreDataProperties.swift
//  
//
//  Created by B Masset on 16/07/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var date: Date?
    @NSManaged public var image: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var prix: Double
    @NSManaged public var shop: String?
    @NSManaged public var liste: Liste?

}
