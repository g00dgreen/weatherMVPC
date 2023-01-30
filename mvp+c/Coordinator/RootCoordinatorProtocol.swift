//
//  RootCoordinatorProtocol.swift
//  mvp+c
//
//  Created by Артем Макар on 29.01.23.
//

import UIKit

protocol RootCoordinator: AnyObject {
    func start(_ navigationController: UINavigationController)
}
