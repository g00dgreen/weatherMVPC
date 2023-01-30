//
//  MainPresenter.swift
//  mvp+c
//
//  Created by Артем Макар on 25.01.23.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setValue(value: Any)
}
protocol MainViewPresenterProtocol: AnyObject {
    var city: (String, Double, Double)? { get set }
    init(view: MainViewProtocol, model: MainModel, coordinator: Coordinator, networkService: NetworkServiceProtocol)
    func showValue()
    func setCity(value: Int)
    func showDetail(data: Any)
}
class MainPresenter: MainViewPresenterProtocol {
    
    var city: (String, Double, Double)?

    let networkService: NetworkServiceProtocol?
    private var coordinator: Coordinator?
    weak private var view: MainViewProtocol?
    var model: MainModel?
    
    required init(view: MainViewProtocol, model: MainModel, coordinator: Coordinator, networkService: NetworkServiceProtocol) {
        self.view = view
        self.model = model
        self.coordinator = coordinator
        self.networkService = networkService
    }
    
    func showValue() {
        var arrayOfCity: [String] = []
        model?.city.forEach{arrayOfCity.append($0.0)}
        self.view?.setValue(value: arrayOfCity)
    }
    func setCity(value: Int) {
        city = (model?.city[value])!
    }
    func showDetail(data: Any) {
        var weather: WetherData?
        guard let data = data as? (String, Double, Double) else {return}
        NetworkService.shared.getWeather(latitude: data.1, longitude: data.2) { [weak self] result in
            DispatchQueue.main.async {
                weather = result
                self?.coordinator?.moveToDetail(withData: weather!)
            }
        }


    }
    
    
}
