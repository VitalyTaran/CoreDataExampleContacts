//
//  TextField + Ext.swift
//  CoreDataHW
//
//  Created by Виталий Таран on 19.08.2022.
//

import UIKit

extension UITextField {
    func setting(systemImage: String, text: String) {
        self.isUserInteractionEnabled = false
        //        textField.delegate = self
        self.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        let image = UIImage(systemName: systemImage)
        imageView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0,
                                                             width: imageView.frame.width + 20,
                                                             height: imageView.frame.height + 10))
        iconContainerView.addSubview(imageView)
        self.leftView = iconContainerView
        self.text = text
    }
}

