//
//  Person+CoreDataProperties.swift
//  CoreDataHW
//
//  Created by Виталий Таран on 25.08.2022.
//

import Foundation
import CoreData

extension PersonModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonModel> {
        return NSFetchRequest<PersonModel>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var gender: String?
    @NSManaged public var avatar: Data?
}

extension PersonModel : Identifiable {

}
