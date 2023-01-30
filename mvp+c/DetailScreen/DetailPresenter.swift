//
//  DetailPresenter.swift
//  mvp+c
//
//  Created by Артем Макар on 29.01.23.
//

import Foundation

protocol DetailPresenterProtocol {
    init(view: DetailViewProtocol, data: Any)
    func showValue()
    var data: Any { get set }
}
protocol DetailViewProtocol: AnyObject {
    func setValue(value: Any)
}

class DetailPresenter: DetailPresenterProtocol  {
    
    var data: Any
    weak var view: DetailViewProtocol?
    
    required init(view: DetailViewProtocol, data: Any) {
        self.view = view
        self.data = data
    }
    
    func showValue() {
        self.view?.setValue(value: data)
    }
}
