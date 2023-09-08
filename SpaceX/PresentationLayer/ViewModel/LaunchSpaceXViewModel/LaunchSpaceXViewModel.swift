//
//  MainViewModel.swift
//  SpaceX
//
//  Created by david on 9/5/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation
class LaunchSapceXViewModel {
    var isLoading:Observable<Bool> = Observable(false)
    var cellDataSource:Observable<[LaunchSpaceXCellViewModel]> = Observable(nil)
    var error:Observable<Bool> = Observable(false)
    
    var total_page:Observable<Int> = Observable(1)
    
    var dataSource:MainLaunchModel?
    var useCase:LaunchSpaceXUseCase
    
    init(useCase:LaunchSpaceXUseCase) {
        self.useCase = useCase
    }
    
    func numberOfSections() -> Int {
        1
    }

    func getData(page:Int,limit:Int)  {
   
        guard let parameter = bildParameter(page: page, limit: limit) else { return }
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        useCase.getDataLaunchSpacex(parameter:parameter){[weak self] data,error in
            self?.isLoading.value = false
            
            if(error != nil){
                self?.error.value = true
            }else {
                self?.total_page.value = data?.totalPages
                self?.dataSource = data
                self?.mapCellData()
            }
            
        }
    }
    func mapCellData()  {
        self.cellDataSource.value = self.dataSource?.docs?.compactMap({LaunchSpaceXCellViewModel(doucs: $0)})
    }
    
    func bildParameter(page:Int,limit:Int)-> Data?   {
        
        let query = Query(upcoming: false)
        let sort = Sort(flighNumber: "desc")
        let optins = Options(limit: limit,page:page, sort: sort)
        let request = RequestModel(query: query, options:optins)
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(request) else { return nil }
        
        return jsonData
    }
    
    func reteiveLaunchSpaceX(with id:String) -> LaunchModel? {
        guard let launch = dataSource?.docs?.first(where: {$0.id == id}) else {
            return nil
        }
        return launch
    }
}
