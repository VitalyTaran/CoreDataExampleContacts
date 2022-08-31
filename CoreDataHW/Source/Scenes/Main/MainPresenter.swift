//
//  MainPresenter.swift
//  CoreDataHW
//
//  Created by Виталий Таран on 31.08.2022.
//

import Foundation

// MARK: - Main Protocol
protocol MainPresenterType {

    var persons: [Person] { get set }
    var router: RouterType? { get }
    func fetchAllPerson()
    func savePersonName(name: String)
    func deletePerson(indexPath: IndexPath)
    func pushPerson(by indexPath: IndexPath)
    init(router: RouterType?,
         storage: StorageManagerType)
}

// MARK: - Main Presenter

class MainPresenter: MainPresenterType {

    required init(router: RouterType?,
                  storage: StorageManagerType) {

        self.router = router
        self.storageManager = storage
    }

    var router: RouterType?
    var persons = [Person]()
    var storageManager: StorageManagerType

    func fetchAllPerson() {

        persons = storageManager.fetchAllPerson() ?? []
    }

    func savePersonName(name: String) {

        storageManager.savePersonName(name)
    }

    func updatePerson(person: Person,
                      avatar: Data,
                      name: String,
                      dateOfBirth: String,
                      gender: String) {

        storageManager.updatePerson(person, avatar, name, dateOfBirth, gender)
    }

    func deletePerson(indexPath: IndexPath) {

        storageManager.deletePerson(person: persons[indexPath.row])
    }

    func pushPerson(by indexPath: IndexPath) {

        router?.pushDetail(person: persons[indexPath.row])
    }
}
