//
//  UIViewConroller+Ext.swift
//  CoreDataHW
//
//  Created by Виталий Таран on 31.08.2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(okButton)
        navigationController?.present(alert, animated: true)
    }
}
