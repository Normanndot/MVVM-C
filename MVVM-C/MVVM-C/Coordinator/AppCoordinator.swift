//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Norman, ThankaVijay on 13/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol SignInListener {
    func didSignIn()
}

final class AppCoordinator: BaseCoordinator {
    
    var window = UIWindow(frame: UIScreen.main.bounds)
    
    override func start() {
        self.navigationController.navigationBar.isHidden = true
        
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
        
        // TODO: here you could check if user is signed in and show appropriate screen
        let coordinator = SignInCoordinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}

extension AppCoordinator: SignInListener {
    func didSignIn() {
        self.navigationController.showAlert(title: "Success", message: "Signed in")
        // TODO: Navigate to Dashboard
    }
}
