//
//  LoginViewController.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - UI Components
    
    private var loginView = LoginView()

    // MARK: - Properties

    private var credentials: (String,String) = ("", "")

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = "Login"
        setupLoginView()
    }
    
    private func setupLoginView() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        loginView.layer.cornerRadius = 20
        loginView.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        loginView.loginViewDelegate = self
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func navigateToHomeView() {
        let homeViewController = HomeViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }

}

extension LoginViewController: LoginViewDelegate {
    
    func loginView(_ view: LoginView, didEnterEmail email: String) {
        credentials.0 = email
    }
    
    func loginView(_ view: LoginView, didEnterPassword password: String) {
        credentials.1 = password
    }
    
    
    func loginButtonTapped(_ view: LoginView) {
        if !credentials.0.isEmpty && !credentials.1.isEmpty {
            FirebaseAuthHandler.shared.signInUser(with: credentials.0, password: credentials.1) { [weak self] user, error in
                if let error = error {
                    self?.alert(message: error.localizedDescription, title: "Error!")
                }
                if let _ = user {
                    self?.navigateToHomeView()
                }
            }
        }
    }
    
    func signUpButtonTapped(_ view: LoginView) {
        let newViewController = SignUpViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
