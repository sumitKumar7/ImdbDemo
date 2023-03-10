//
//  SignUpViewController.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: -  UI Components

    private var signUpView = SignupView()

    // MARK: - Properties

    private var credentials: (String,String) = ("", "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Sign up"
        setupSignupView()
    }
    
    private func setupSignupView() {
        signUpView.signupDelegate = self
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(signUpView)
        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: - SignupViewDelegate

extension SignUpViewController: SignupViewDelegate {
    
    func signupButtonTapped(_ view: SignupView) {
        if !credentials.0.isEmpty && !credentials.1.isEmpty {
            FirebaseAuthHandler.shared.createUser(with: credentials.0,
                                                  password: credentials.1) { [weak self] user, error in
                if let error = error {
                    self?.alert(message: error.localizedDescription, title: "Error!")
                }
                if let _ = user {
                    self?.alert(message: "User created Successfully", title: "Success!")
                }
            }
        }
    }
    
    func signupView(_ view: SignupView, didEnterEmail email: String) {
        credentials.0 = email
    }
    
    func signupButtonTapped(_ view: SignupView, didEnterPassword password: String) {
        credentials.1 = password
    }
    
}
