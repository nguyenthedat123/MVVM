//
//  TableViewController.swift
//  ApiAlamofire
//
//  Created by The Dat on 7/7/21.
//
// o day chi moi khoi tao class DetailCharacterVC
// chua khoi tao file xib DetailCharacterVC

import UIKit
import Alamofire
import SDWebImage

final class TableViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var table: UITableView!
    var viewModel: CharacterViewModel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        table.delegate = self
        table.dataSource = self
        bindViewModel()
    }
    //MARK: - func
    private func bindViewModel() {
        viewModel = CharacterViewModel()
        viewModel.needReloadTableView = { [weak self] in
            self?.table.reloadData()
        }
        viewModel.requestData()
    }
}
// MARK: - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.bindData(data: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailCharacterVC = DetailCharacterVC(nibName: "DetailCharacterVC", bundle: nil)
////        let setail = DetailCharacterVC(nibName: "DetailCharacterVC", bundle: nil)
        detailCharacterVC.bindData(data: viewModel.didSelectRowAt(indexPath: indexPath))
        self.navigationController!.pushViewController(detailCharacterVC, animated: true)
    }
}

// MARK: - UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    
}
