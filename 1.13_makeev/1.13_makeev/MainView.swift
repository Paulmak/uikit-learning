//
//  MainView.swift
//  1.13_makeev
//
//  Created by Pavel on 10.09.2025.
//

import UIKit

final class MainView: UIView {
    
    private let maxNumberOfDigitsInPhoneNumberTextField = 11
    private let regex: NSRegularExpression
    
    private lazy var nameTextField: TextField = {
        let textField = TextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Имя"
        textField.autocapitalizationType = .words
        textField.delegate = self
        return textField
    }()
    
    private lazy var phoneNumberTextField: TextField = {
        let textField = TextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Номер телефона"
        textField.keyboardType = .numberPad
        textField.delegate = self
        return textField
    }()
    
    private lazy var loginButton: LoginButton = {
        let button = LoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()
    
    override init(frame: CGRect) {
        
        do {
            regex = try NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
        } catch {
            fatalError("Failed to create regular expression: \(error)")
        }
        
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureSubviews()
        configureConstraints()
        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func clearAndPrintDataFromTextFieldsWithAnimation() {
        
        loginButton.tapWithAnimation()
        
        guard
            let name = nameTextField.text, !name.isEmpty,
            let phone = phoneNumberTextField.text, !phone.isEmpty
        else {
            print("Заполните имя и телефонный номер")
            return
        }
        
        print("Имя пользователя - \(name), номер телефона - \(phone)")
        
        nameTextField.text = ""
        phoneNumberTextField.text = ""
        checkFields()
    }
    
    private func checkFields() {
        let name = nameTextField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let phone = phoneNumberTextField.text ?? ""
        
        let phoneDigits = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        let isNameValid = name.count >= 2
        let isPhoneValid = phoneDigits.count == 11
        
        loginButton.isEnabled = isNameValid && isPhoneValid
        loginButton.alpha = loginButton.isEnabled ? 1.0 : 0.5
    }
    
    private func formatPhoneNumber(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        
        guard !phoneNumber.isEmpty else { return "+7" }
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        guard range.location != NSNotFound && range.length <= phoneNumber.count else { return "+7" }
        
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
        
        if !number.isEmpty {
            if number.hasPrefix("8") {
                number = "7" + String(number.dropFirst())
            } else if !number.hasPrefix("7") {
                number = "7" + number
            }
        }
        
        if number.count > maxNumberOfDigitsInPhoneNumberTextField {
            let maxIndex = number.index(number.startIndex, offsetBy: maxNumberOfDigitsInPhoneNumberTextField)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        guard !number.isEmpty else { return "+7" }
        
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3", options: .regularExpression, range: regRange)
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3-$4-$5", options: .regularExpression, range: regRange)
        }
        
        return "+7" + number.dropFirst()
    }
    
    private func addTargets() {
        loginButton.addTarget(self, action: #selector(clearAndPrintDataFromTextFieldsWithAnimation), for: .touchUpInside)
    }
    
    private func configureSubviews() {
        addSubview(nameTextField)
        addSubview(phoneNumberTextField)
        addSubview(loginButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            loginButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 35),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}

extension MainView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            phoneNumberTextField.becomeFirstResponder()
        } else {
            textField.endEditing(true)
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkFields()
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if textField == phoneNumberTextField {
            
            if string.count == 1 {
                let allowedCharacters = CharacterSet.decimalDigits
                if string.rangeOfCharacter(from: allowedCharacters.inverted) != nil {
                    return false
                }
            }
            
            if string.count > 1 {
                
                let digitsOnly = string.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
                if digitsOnly.isEmpty {
                    return false
                }
                textField.text = formatPhoneNumber(phoneNumber: digitsOnly, shouldRemoveLastDigit: false)
                checkFields()
                return false
            } else {
                let currentText = textField.text ?? ""
                
                guard range.location <= currentText.count else { return false }
                let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
                
                let isDeletion = range.length > 0 && string.isEmpty
                textField.text = formatPhoneNumber(phoneNumber: updatedText,
                                                   shouldRemoveLastDigit: isDeletion)
                checkFields()
                return false
            }
        }
        
        if textField == nameTextField {
            let allowedCharacters = CharacterSet.letters.union(.whitespaces)
            if !string.isEmpty, string.rangeOfCharacter(from: allowedCharacters.inverted) != nil {
                return false
            }
        }
        return true
    }
}
