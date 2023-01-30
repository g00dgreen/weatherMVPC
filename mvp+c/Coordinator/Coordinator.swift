//
//  Coordinator.swift
//  mvp+c
//
//  Created by Артем Макар on 25.01.23.
//

import Foundation
import UIKit


class Coordinator: CoordinatorProtocol, RootCoordinator {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    // The reference is weak to prevent a retain cycle
    weak var navigationController: UINavigationController?
    private var builder: Builder
    
    init(builder: Builder) {
        self.builder = builder
    }
    
    func addChildCoordinator(_ coordinator: CoordinatorProtocol) {
        childCoordinators.append(coordinator)
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
    
    func start(_ navigationController: UINavigationController) {
        let vc = builder.makeStartViewController(coordinator: self)
        self.navigationController = navigationController
        navigationController.pushViewController(vc, animated: true)
    }
    
    func moveToDetail(withData data: Any) {
        let vc = builder.makeDetailViewController(coordinator: self, data: data)
        navigationController?.pushViewController(vc, animated: true)
    }
}
