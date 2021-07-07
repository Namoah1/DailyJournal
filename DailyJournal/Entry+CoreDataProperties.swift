//
//  Entry+CoreDataProperties.swift
//  DailyJournal
//
//  Created by Nana Adwoa Odeibea Amoah on 7/6/21.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: Date?

}

extension Entry : Identifiable {

}
