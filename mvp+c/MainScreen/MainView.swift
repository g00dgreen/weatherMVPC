//
//  MainView.swift
//  mvp+c
//
//  Created by Артем Макар on 25.01.23.
//

import UIKit
class MainViewController : UIViewController {

    private var tableView = UITableView()
    private var presenter: MainViewPresenterProtocol?
    
    
    var tableCellValue: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.showValue()
        createTable()
        
    }
    
    

    func createTable() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}
extension MainViewController: MainViewProtocol {
    func setValue(value: Any) {
        tableCellValue = value as? [String]
    }
    
    
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCellValue?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = String(tableCellValue?[indexPath.row] ?? "error")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.setCity(value: indexPath.row)
        presenter?.showDetail(data: presenter?.city ?? ("error", 1.0, 1.0))
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension MainViewController {
    func set(presenter: MainViewPresenterProtocol) {
        self.presenter = presenter
    }
}
