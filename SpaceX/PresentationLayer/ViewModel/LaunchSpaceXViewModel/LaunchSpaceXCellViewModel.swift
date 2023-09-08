//
//  LaunchSpaceXCellViewModel.swift
//  SpaceX
//
//  Created by david on 9/6/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation
import UIKit
class LaunchSpaceXCellViewModel {
    
    var imageUrl : URL?
    var success : Bool?
    var name:String?
    var date:String?
    var descripction:String?
    var imageStutus:UIImage?
    var textSuccessOrFaild:String?
    var colorSuccessOrFaild:UIColor?
    var id:String?
    var wikipedia : String?
    var flightNumber:Int?
    init(doucs:LaunchModel) {
        self.id = doucs.id
        self.imageUrl = makeImageURL(doucs.links?.patch?.small ?? "")
        self.success = doucs.success
        self.name = doucs.name
        self.wikipedia = doucs.links?.wikipedia
        if let date = doucs.date_utc{
            self.date = changeFormatdate(dateInput: date) //date
        }
        
        self.descripction = doucs.details
        self.imageStutus = checkSuccessORFaildStatuse(doucs.success ?? false)
        self.textSuccessOrFaild = textSuccessOrFaild(doucs.success ?? false)
        self.colorSuccessOrFaild = colorSuccessOrFaild(doucs.success ?? false)
        self.flightNumber = doucs.flight_number ?? 0
    }
    
    private func makeImageURL( _ imageCode:String)-> URL?{
        let url = URL(string: imageCode)
        return url
    }
    private func checkSuccessORFaildStatuse( _ status : Bool)-> UIImage? {
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 40, weight: .medium,scale: .large)
        let image =  UIImage(systemName: status ? "checkmark.seal.fill": "xmark.seal", withConfiguration: imageConfiguration)?.withRenderingMode(.alwaysTemplate)
        image?.withTintColor(status ? UIColor.green : UIColor.red)
        return image
    }
    
    private func textSuccessOrFaild( _ status:Bool) -> String{
        status ? "Success" :"Faild"
    }
    
    private func colorSuccessOrFaild( _ status:Bool) -> UIColor{
        status ? UIColor.systemGreen :UIColor.red
    }
    
    private func changeFormatdate(dateInput:String)-> String? {
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date2 = dateFormatter1.date(from: dateInput)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        let date = dateFormatter.string(from: date2!)
        return date
    }
}
