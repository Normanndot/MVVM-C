//
//  BaseCoordinator.swift
//  MVVM-C
//
//  Created by Norman, ThankaVijay on 13/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parent: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
}

class BaseCoordinator: Coordinator {
    var navigationController = UINavigationController()
    var parent: Coordinator?
    var childrens: [Coordinator] = []
        
    func start() {
        fatalError("Start method should be implemented")
    }
    
    func start(coordinator: Coordinator) {
        self.childrens.append(coordinator)
        coordinator.parent = self
        coordinator.start()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = self.childrens.firstIndex(where: { $0 === coordinator }) {
            self.childrens.remove(at: index)
        }
    }
}
