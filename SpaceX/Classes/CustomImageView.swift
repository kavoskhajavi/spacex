//
//  CustomImageView.swift
//  SpaceX
//
//  Created by david on 9/6/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation
import UIKit
class CustomImageView: UIImageView {
    var task:URLSessionDataTask!
    var imageCash = NSCache<AnyObject,AnyObject>()
    
    func loadImage(url:URL)  {
        image = nil
        if let task = task{
            task.cancel()
        }
        
        if let imageFromCash = imageCash.object(forKey: url.absoluteString as AnyObject) as? UIImage{
            self.image = imageFromCash
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { data,response,error in
            guard let data = data,let newImage = UIImage(data: data)else{
                print("Couldn't load image from url:\(url)")
                DispatchQueue.main.async {
                    self.image = #imageLiteral(resourceName: "images-1")
                }
                return
            }
            self.imageCash.setObject(newImage, forKey: url.absoluteString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
        
    }
}
