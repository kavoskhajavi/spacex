//
//  LaunchSpaceXCell.swift
//  SpaceX
//
//  Created by david on 9/6/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import UIKit

class LaunchSpaceXCell: UITableViewCell {
    
    public static var identifier : String {
        get {
            return "LaunchSpaceXCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "LaunchSpaceXCell", bundle: nil)
    }
    
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var launchSpaceXImg: CustomImageView!
    
    @IBOutlet weak var flightNumber: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var succesLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         backView.round(8)
         statusView.round(4)
         
    }
    
    func setupCell(viewModel:LaunchSpaceXCellViewModel)  {
        self.name.text = viewModel.name
        self.des.text = viewModel.descripction
        self.date.text = viewModel.date
        self.succesLable.text = viewModel.textSuccessOrFaild
        self.launchSpaceXImg.loadImage(url: viewModel.imageUrl!)
        self.flightNumber.text = "(NO :\(viewModel.flightNumber ?? 0))"
        self.statusView.layer.backgroundColor = viewModel.colorSuccessOrFaild?.cgColor
       
    
    }
    
    
    
}
