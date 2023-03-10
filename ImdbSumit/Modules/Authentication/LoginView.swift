//
//  LoginView.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func signUpButtonTapped(_ view: LoginView)
    func loginButtonTapped(_ view: LoginView)
    func loginView(_ view: LoginView, didEnterEmail email: String)
    func loginView(_ view: LoginView, didEnterPassword password: String)
}

class LoginView: AuthenticationView {

    // MARK: - UI Components
    
    private var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Don't have any Account? Sign up", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Properties
    
    weak var loginViewDelegate: LoginViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        delegate = self
        setupSignUpButton()
        addContraintToSignUpButton()
    }
    
    private func setupSignUpButton() {
        addSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    private func addContraintToSignUpButton() {
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
            signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func signupButtonTapped() {
        loginViewDelegate?.signUpButtonTapped(self)
    }
    
    override func submitButtonTapped() {
        loginViewDelegate?.loginButtonTapped(self)
    }
}

// MARK: - AuthenticationViewDelegate

extension LoginView: AuthenticationViewDelegate {
    func authenticationView(_ view: AuthenticationView, didEnterEmail email: String) {
        loginViewDelegate?.loginView(self, didEnterEmail: email)
    }
    
    func authenticationView(_ view: AuthenticationView, didEnterPassword password: String) {
        loginViewDelegate?.loginView(self, didEnterPassword: password)
    }
}
