//
//  DetailPresenter.swift
//  CoreDataHW
//
//  Created by Виталий Таран on 31.08.2022.
//


import Foundation
import UIKit
import CoreData

// MARK: - Detail Presenter Protocol

protocol DetailPresenterType {
    var person: Person? { get set }
    init (person: Person, storage: StorageManagerType)
    func updatePerson(avatar: Data?,
                      name: String?,
                      dateOfBirth: String?,
                      gender: String?)
}

// MARK: - Detail Presenter

class DetailPresenter: DetailPresenterType {

    required init(person: Person, storage: StorageManagerType) {
        self.person = person
        storageManager = storage
    }

    var person: Person?
    let storageManager: StorageManagerType

    func updatePerson(avatar: Data?,
                      name: String?,
                      dateOfBirth: String?,
                      gender: String?) {
        
        guard let person = person else { return }
        storageManager.updatePerson(person, avatar, name, dateOfBirth, gender)
    }
}
