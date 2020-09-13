//
//  SignInCoordinator.swift
//  MVVM-C
//
//  Created by Norman, ThankaVijay on 13/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import RxSwift

final class SignInCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        guard let signInViewController = viewController as? SignInViewController else { return }
        
        // Now Coordinator initializes and injects viewModel
        let signInViewModel = SignInViewModel(authentication: SessionService())
        signInViewController.viewModel = signInViewModel
        
        // Coordinator subscribes to events and notifies parentCoordinator
        signInViewModel.didSignIn
            .subscribe(onNext: { [weak self] in
                guard let `self` = self else { return }
                self.navigationController.viewControllers = []
                self.parent?.didFinish(coordinator: self)
                (self.parent as? SignInListener)?.didSignIn()
            })
            .disposed(by: self.disposeBag)
        
        self.navigationController.viewControllers = [signInViewController]
    }
}
