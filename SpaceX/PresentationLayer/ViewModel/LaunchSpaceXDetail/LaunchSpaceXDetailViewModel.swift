//
//  LaunchSpaceXDetailViewModel.swift
//  SpaceX
//
//  Created by david on 9/7/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation
import  UIKit
class LaunchSpaceXDetailViewModel {
    
    let useCase:LaunchSpaceXDetailUseCase
    var launchDetail:LaunchSpaceXCellViewModel
    
    var isWikipedia:Observable = Observable(false)
    var isBookMark:Bool = false
    var imageBookMark:Observable = Observable(UIImage())
    var id:String
    
    init(useCase:LaunchSpaceXDetailUseCase,
         launchDetail:LaunchSpaceXCellViewModel) {
        self.useCase = useCase
        self.launchDetail = launchDetail
        self.id = launchDetail.id ?? ""
    }
    
    func creatBookMark(id:String,name:String) {
        useCase.creatBookMark(id:id, name: launchDetail.name ?? "")
    }
    
    func deleteBookMark() {
        useCase.deleteBookMark(id: id)
    }
    
    
    func bookMark()  {
        useCase.isBookMark(id: id){[weak self] result in
            self?.isBookMark = result
            if result {
                self?.imageBookMark.value = UIImage(systemName: "bookmark.fill")
            }else {
                self?.imageBookMark.value = UIImage(systemName: "bookmark")
            }
        }
    }
    
    func wikipedia() {
        guard launchDetail.wikipedia != nil else {
            isWikipedia.value = false
            return
        }
        isWikipedia.value = true
    }
    
    func tapBookMark() {
        if isBookMark {
            useCase.deleteBookMark(id: id)
        }else{
            useCase.creatBookMark(id: id, name: launchDetail.name ?? "")
        }
        bookMark()
    }
    
    func getNameLaunch() -> String {
        return launchDetail.name ?? ""
    }
    
    
    func makeWikipdiaURL()-> URL{
        let url = URL(string: launchDetail.wikipedia ?? "")
        return url!
    }
    
    
}
