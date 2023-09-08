//
//  LoadMore.swift
//  SpaceX
//
//  Created by david on 9/6/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import UIKit

class LoadMore: UITableViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    public static var identifier : String {
        get {
            return "LoadMore"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "LoadMore", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.startAnimating()
    }
    
}
