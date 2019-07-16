//
//  Liste+CoreDataProperties.swift
//  
//
//  Created by B Masset on 16/07/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Liste {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Liste> {
        return NSFetchRequest<Liste>(entityName: "Liste")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var article: NSSet?

}

// MARK: Generated accessors for article
extension Liste {

    @objc(addArticleObject:)
    @NSManaged public func addToArticle(_ value: Article)

    @objc(removeArticleObject:)
    @NSManaged public func removeFromArticle(_ value: Article)

    @objc(addArticle:)
    @NSManaged public func addToArticle(_ values: NSSet)

    @objc(removeArticle:)
    @NSManaged public func removeFromArticle(_ values: NSSet)

}
