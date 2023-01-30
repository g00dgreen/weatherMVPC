//
//  CoordinatorProtocol.swift
//  mvp+c
//
//  Created by Артем Макар on 29.01.23.
//

import Foundation

protocol CoordinatorProtocol {
    func addChildCoordinator(_ coordinator: CoordinatorProtocol)
    func removeAllChildCoordinatorsWith<T>(type: T.Type)
    func removeAllChildCoordinators()
}
