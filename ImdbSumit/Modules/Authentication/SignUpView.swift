//
//  SignUpView.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import UIKit

protocol SignupViewDelegate: AnyObject {
    func signupButtonTapped(_ view: SignupView)
    func signupView(_ view: SignupView, didEnterEmail email: String)
    func signupButtonTapped(_ view: SignupView, didEnterPassword password: String)
}

class SignupView: AuthenticationView {
    weak var signupDelegate: SignupViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func submitButtonTapped() {
        signupDelegate?.signupButtonTapped(self)
    }
}

// MARK: - AuthenticationViewDelegate

extension SignupView: AuthenticationViewDelegate {
    func authenticationView(_ view: AuthenticationView, didEnterEmail email: String) {
        signupDelegate?.signupView(self, didEnterEmail: email)
    }
    
    func authenticationView(_ view: AuthenticationView, didEnterPassword password: String) {
        signupDelegate?.signupButtonTapped(self, didEnterPassword: password)
    }
}
