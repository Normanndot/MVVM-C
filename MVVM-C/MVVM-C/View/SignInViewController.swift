//
//  SignInViewController.swift
//  MVVM-C
//
//  Created by Norman, ThankaVijay on 13/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    private let disposeBag = DisposeBag()
    var viewModel: SignInViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBindings()

        // Do any additional setup after loading the view.
    }
    
    private func setUpBindings() {
        guard let viewModel = viewModel else { return }
        
        self.emailTextField.rx.text.orEmpty
            .bind(to: viewModel.emailAddress)
            .disposed(by: self.disposeBag)
        
        self.passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.password)
            .disposed(by: self.disposeBag)
        
        self.signInButton.rx.tap
            .bind { viewModel.signInTapped() }
            .disposed(by: self.disposeBag)
        
        viewModel.isSignInActive
            .bind(to: self.signInButton.rx.isEnabled)
            .disposed(by: self.disposeBag)
        
        viewModel.didFailSignIn
            .subscribe(onNext: { error in
                print("Failed: \(error)")
            })
            .disposed(by: self.disposeBag)
    }

}

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let viewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        viewController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(viewController, animated: true, completion: nil)
    }
}
