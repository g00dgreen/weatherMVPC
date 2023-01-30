//
//  WeatherCollectionView.swift
//  mvp+c
//
//  Created by Артем Макар on 30.01.23.
//

import UIKit

class WeatherCollectionView: UICollectionView {

    var data: WetherData?
    required init(data: WetherData) {
        self.data = data
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        delegate = self
        dataSource = self
        register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.id)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension WeatherCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.id, for: indexPath) as! WeatherCollectionViewCell
        cell.tempLabel.text = "\(data!.hourly.temperature2M[indexPath.row])°C"
        cell.windLabel.text = "\(data!.hourly.windspeed10M[indexPath.row]) km/h"
        cell.timeLabel.text = "\(data!.hourly.time[indexPath.row])"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}

