//
//  Builder.swift
//  mvp+c
//
//  Created by Артем Макар on 29.01.23.
//

import Foundation

protocol Builder {
    func makeStartViewController(coordinator: Coordinator) -> MainViewController
    func makeDetailViewController(coordinator: Coordinator, data: Any) -> DetailViewController
}

class ModelBuilder: Builder {
    func makeStartViewController(coordinator: Coordinator) -> MainViewController {
        let viewController = MainViewController()
        let networkService = NetworkService()
        let model = MainModel(city: [("Brest", 52.10, 23.69), ("Vitebsk", 55.19, 30.20), ("Homyel", 52.43, 30.95), ("Grodno", 53.63, 23.89), ("Minsk", 53.90, 27.57), ("Mogilev", 53.92, 30.34)])
        let presenter = MainPresenter(view: viewController, model: model, coordinator: coordinator, networkService: networkService)
        viewController.set(presenter: presenter)
        return viewController
    }
    
    func makeDetailViewController(coordinator: Coordinator, data: Any) -> DetailViewController {
        let viewController = DetailViewController()
        let presenter = DetailPresenter(view: viewController, data: data)
        viewController.set(presenter: presenter)
        return viewController
    }
    
    func makeStartCoordinator() -> Coordinator {
        let coordinator = Coordinator(builder: self)
        return coordinator
    }
}



//, ("Brest1", 52.10, 23.69), ("Brest2", 52.10, 23.69), ("Brest3", 52.10, 23.69), ("Brest4", 52.10, 23.69), ("Brest5", 52.10, 23.69), ("Brest6", 52.10, 23.69), ("Brest7", 52.10, 23.69), ("Brest8", 52.10, 23.69), ("Brest9", 52.10, 23.69), ("Brest10", 52.10, 23.69), ("Brest11", 52.10, 23.69), ("Brest12", 52.10, 23.69), ("Brest13", 52.10, 23.69), ("Brest14", 52.10, 23.69), ("Brest15", 52.10, 23.69)
