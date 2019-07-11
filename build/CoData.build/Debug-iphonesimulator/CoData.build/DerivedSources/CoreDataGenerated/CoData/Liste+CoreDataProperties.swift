//
//  Liste+CoreDataProperties.swift
//  
//
//  Created by B Masset on 11/07/2019.
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

}
