//
//  DetailViewController.swift
//  CoreDataHW
//
//  Created by Виталий Таран on 18.08.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var isEdit = Bool()

    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1.5
//        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.masksToBounds = true
//        button.setTitle("Edit", for: .normal)
        var config = UIButton.Configuration.borderedTinted()
        config.titleAlignment = .center
//        config.title = "Edit"
//        config.cornerStyle = .large
        button.configuration = config
        button.addTarget(self, action: #selector(editButtonPressed), for: .allEvents)
        return button
    }()

    private lazy var avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 100
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "face")
        return imageView
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.setting(systemImage: "person", text: "Яна Брбсва")
        return textField
    }()

    lazy var birthdayDatePicker: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date.now
        datePicker.datePickerMode = .date
        datePicker.isEnabled = true
        return datePicker
    }()

    private lazy var dateOfBirthTextField: UITextField = {

        let textField = UITextField()
        textField.setting(systemImage: "calendar", text: "10.23.4544")
        textField.inputView = birthdayDatePicker
        return textField
    }()

    private lazy var genderTextField: UITextField = {
        let textField = UITextField()
        textField.setting(systemImage: "person.2.circle", text: "female")
        return textField
    }()

    private lazy var lineUnderNameTextField: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()

    private lazy var lineUnderDateOfBirthTextField: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()

    private lazy var lineUnderGenderTextField: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()

    private lazy var dataStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .fill
        [nameTextField,
        dateOfBirthTextField,
        genderTextField].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupHierarchy()
        setupLayout()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: editButton)
        setupEditButton(title: "Edit", borderColor: .lightGray)
    }

    private func setupHierarchy() {
        view.addSubview(avatarImage)
        view.addSubview(dataStackView)
        view.addSubview(lineUnderNameTextField)
        view.addSubview(lineUnderDateOfBirthTextField)
        view.addSubview(lineUnderGenderTextField)

    }


    private func setupLayout() {

        func setUnderlineView(_ lineView: UIView, under: UIView) {
            lineView.snp.makeConstraints { make in
                make.leading.trailing.equalTo(dataStackView)
                make.top.equalTo(under.snp.bottom)
                make.height.equalTo(2)
            }
        }

        editButton.snp.makeConstraints { make in
            make.width.equalTo(70)
        }

        avatarImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
           make.height.width.equalTo(200)
        }

        dataStackView.snp.makeConstraints { make in
            make.top.equalTo(avatarImage.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(150)
        }

     setUnderlineView(lineUnderNameTextField, under: nameTextField)
        setUnderlineView(lineUnderDateOfBirthTextField, under: dateOfBirthTextField)
        setUnderlineView(lineUnderGenderTextField, under: genderTextField)

    }

    private func setupEditButton(title: String, borderColor: UIColor) {
        editButton.setTitle(title, for: .normal)
        editButton.layer.borderColor = borderColor.cgColor
    }

    @objc func editButtonPressed() {
print("edit")

        isEdit.toggle()
        if isEdit {
            setupEditButton(title: "Save", borderColor: .red)
            nameTextField.isUserInteractionEnabled = true
            dateOfBirthTextField.isUserInteractionEnabled = true
            genderTextField.isUserInteractionEnabled = true
        } else {
            setupEditButton(title: "Edit", borderColor: .lightGray)
            nameTextField.isUserInteractionEnabled = false
            dateOfBirthTextField.isUserInteractionEnabled = false
            genderTextField.isUserInteractionEnabled = false
        }
    }

}

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if !isEdit {
        if textField == nameTextField {
            return false; 
        }
        }
        return true
    }
}
