//
//  MainViewController.swift
//  SpaceX
//
//  Created by david on 9/4/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import UIKit

class LaunchSpaceXVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellDataSource:[LaunchSpaceXCellViewModel] = []
    
    let viewModel:LaunchSapceXViewModel = LaunchSapceXViewModel(useCase:launchSpaceXUseCase)
    
    var total_page = 1
    var curent_page = 1
    var limitForFirstTime = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData(page: curent_page, limit: limitForFirstTime)
    }
    
    func configView()  {
        self.title = "SpaceX"        
        setupTableView()
        
    }
    
    func bindViewModel()  {
        viewModel.isLoading.bind {[weak self] isLoading in
            guard let isLoading = isLoading else{
                return
            }
            
            if isLoading  {
                self?.tableView.beginUpdates()
            }else{
                self?.tableView.endUpdates()
            }
            
        }
        
        viewModel.cellDataSource.bind {[weak self] result in
            guard let self = self,let result = result else {
                return
            }
            self.cellDataSource.append(contentsOf: result)
            self.reloadTableView()
           
        }
        
        viewModel.total_page.bind {[weak self]total_page in
            self?.total_page = total_page ?? 1
        }
        viewModel.error.bind {[weak self] result in
            if result ?? false {
                self?.showMessageError()
            }
        }
        
    }
    
    func openDetail(data:LaunchSpaceXCellViewModel)  {
        
        let detailsViewModel = LaunchSpaceXDetailViewModel(useCase: launchSpaceXDetailUseCase, launchDetail:data)
        
        let detailController = LaunchSapceXDetailVC(viewModel: detailsViewModel)
        
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailController, animated: true)
        }
    }
    
    func showMessageError() {
        
        let alert = UIAlertController(title: "Error", message: "Places try agin", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {[weak self] _ in
            self?.viewModel.getData(page: 1, limit: self?.limitForFirstTime ?? 0)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
