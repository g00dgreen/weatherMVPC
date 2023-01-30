//
//  DetailView.swift
//  mvp+c
//
//  Created by Артем Макар on 29.01.23.
//

import UIKit

class DetailViewController: UIViewController {
    var detailPresenter: DetailPresenter?
    var weather: WetherData?
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view = view
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailPresenter?.showValue()
        
        var collectionView = WeatherCollectionView(data: weather!)
        view.addSubview(collectionView)
        collectionView.center = view.center
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 550).isActive = true
    }
}

extension DetailViewController {
    func set(presenter: DetailPresenter) {
        self.detailPresenter = presenter
    }
}
extension DetailViewController: DetailViewProtocol {
    func setValue(value: Any) {
        weather = (value as? WetherData)
        
    }
    
    
}
