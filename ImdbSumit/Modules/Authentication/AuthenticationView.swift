//
//  AuthenticationView.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import UIKit

protocol AuthenticationViewDelegate: AnyObject {
    func authenticationView(_ view: AuthenticationView, didEnterEmail email: String)
    func authenticationView(_ view: AuthenticationView, didEnterPassword password: String)
}

class AuthenticationView: UIView {
    
    // MARK: - UI Components
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Properties
    
    weak var delegate: AuthenticationViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupContainerView()
        setupTextFields()
        setupSubmitButton()
        addContraintToEamilTextField()
        addContraintToPasswordTextField()
        addContraintToSubmitButton()
    }
    
    private func setupTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(eamilEntered(sender:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordEntered(sender:)), for: .editingChanged)
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(submitButton)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            containerView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func setupSubmitButton() {
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }
    
    private func addContraintToEamilTextField() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addContraintToPasswordTextField() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16.0),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func addContraintToSubmitButton() {
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16.0),
            submitButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            submitButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc func eamilEntered(sender: UITextField) {
        delegate?.authenticationView(self, didEnterEmail: sender.text!)
    }
    
    @objc func passwordEntered(sender: UITextField) {
        delegate?.authenticationView(self, didEnterPassword: sender.text!)
    }
    
    @objc func submitButtonTapped() {
    }
}

extension AuthenticationView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}
