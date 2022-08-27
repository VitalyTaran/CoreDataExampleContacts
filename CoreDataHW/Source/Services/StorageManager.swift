//
//  StorageManager.swift
//  CoreDataHW
//
//  Created by Виталий Таран on 27.08.2022.
//

import CoreData

class StorageManager {

    // MARK: - Properties

   private let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")

    private lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "PersonModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private lazy var context: NSManagedObjectContext = persistentContainer.viewContext

    // MARK: - Functions

    func savePerson(name: String) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Person",
                                                                 in: context) else {return}
        let newPerson = Person(entity: entityDescription,
                               insertInto: context)
        newPerson.name = name
        saveContext()
    }

    func fetchAllPerson() -> [Person]? {
        do {
            let persons = try context.fetch(fetchRequest) as? [Person]
            return persons
        } catch {
            print(error)
            return nil
        }
    }

    func deletePerson(person: Person) {
        context.delete(person)
        saveContext()
    }

    // MARK: - Delete all data

    func deleteAllData() {
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                context.delete(result)
            }
        } catch {
            print(error)
        }
        saveContext()
    }

    // MARK: - Core Data Saving support

    private func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
