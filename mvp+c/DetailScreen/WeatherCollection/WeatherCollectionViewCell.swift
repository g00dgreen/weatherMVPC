//
//  WeatherCollectionViewCell.swift
//  mvp+c
//
//  Created by Артем Макар on 30.01.23.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    static let id = "WeatherCollectionViewCell"
    
    var weatherView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        view.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.contentMode = .center
        label.bounds = CGRect(x: 0, y: 0, width: 100, height: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Temp"
        label.font = UIFont.systemFont(ofSize: 24)
        label.contentMode = .center
        label.bounds = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let windLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind"
        label.contentMode = .center
        label.bounds = CGRect(x: 0, y: 0, width: 100, height: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(weatherView)

        weatherView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        weatherView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        weatherView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        weatherView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        weatherView.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: weatherView.topAnchor, constant: 10).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: weatherView.rightAnchor, constant: -25).isActive = true
        
        weatherView.addSubview(windLabel)
        windLabel.bottomAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: -10).isActive = true
        windLabel.rightAnchor.constraint(equalTo: weatherView.rightAnchor, constant: -65).isActive = true
        
        weatherView.addSubview(tempLabel)
        tempLabel.topAnchor.constraint(equalTo: weatherView.topAnchor, constant: 85).isActive = true
        tempLabel.rightAnchor.constraint(equalTo: weatherView.rightAnchor, constant: -70).isActive = true
        tempLabel.bottomAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: -85).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
