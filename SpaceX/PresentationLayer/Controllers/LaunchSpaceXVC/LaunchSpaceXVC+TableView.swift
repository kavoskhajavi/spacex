//
//  MainViewController+TableView.swift
//  SpaceX
//
//  Created by david on 9/5/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation
import UIKit
extension LaunchSpaceXVC:UITableViewDelegate,UITableViewDataSource {
    
    
    
    func setupTableView()  {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.registerCells()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 288
    }
    
    func registerCells()  {
        tableView.register(LaunchSpaceXCell.register(), forCellReuseIdentifier: LaunchSpaceXCell.identifier)
        tableView.register(LoadMore.register(), forCellReuseIdentifier: LoadMore.identifier)
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if curent_page < total_page && indexPath.row == cellDataSource.count-1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadMore.identifier) as? LoadMore
            cell?.activityIndicator.startAnimating()
            return cell ?? UITableViewCell()
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier:LaunchSpaceXCell.identifier,for: indexPath) as? LaunchSpaceXCell else{
                return UITableViewCell()
            }
            let cellViewModel = cellDataSource[indexPath.row]
            cell.setupCell(viewModel: cellViewModel)
            
        
//            cell.backView.layer.cornerRadius = 20
//            cell.backView.layer.masksToBounds = true
//            cell.backView.layer.shadowColor = UIColor.black.cgColor
//            cell.backView.layer.shadowOffset = CGSize(width: 0, height: 10)
//            cell.backView.layer.shadowOpacity = 1
      
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
        if curent_page < total_page && indexPath.row == cellDataSource.count-1 {
            curent_page = curent_page + 1
            viewModel.getData(page: curent_page, limit: 50)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let launchId = cellDataSource[indexPath.row]
        self.openDetail(data: launchId)
    }
    
}
