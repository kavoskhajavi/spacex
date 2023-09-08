//
//  LaunchSapceXDetailVC.swift
//  SpaceX
//
//  Created by david on 9/7/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import UIKit

class LaunchSapceXDetailVC: UIViewController {
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLable: UILabel!
    @IBOutlet weak var wikipediaBtnOutlet: UIButton!
    @IBOutlet weak var launchImage: CustomImageView!
    @IBOutlet weak var desLable: UILabel!
    @IBOutlet weak var dataLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bookmarkImage: UIImageView!
    
    let viewModel:LaunchSpaceXDetailViewModel
    
    
    init(viewModel:LaunchSpaceXDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "LaunchSapceXDetailVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.bookMark()
        viewModel.wikipedia()
        self.navigationItem.title = viewModel.getNameLaunch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    @IBAction func wikipedia_btn(_ sender: Any) {
        
        UIApplication.shared.open(viewModel.makeWikipdiaURL())
    }
    
    
    func setupView()  {
        nameLable.text = viewModel.launchDetail.name
        dataLable.text = viewModel.launchDetail.date
        desLable.text = viewModel.launchDetail.descripction
        launchImage.loadImage(url: viewModel.launchDetail.imageUrl!)
        statusView.layer.backgroundColor = viewModel.launchDetail.colorSuccessOrFaild?.cgColor
        statusLable.text = viewModel.launchDetail.textSuccessOrFaild
        statusView.round(4)
        let tapBookMark = UITapGestureRecognizer(target: self, action: #selector(self.imageTapBookMark))
        bookmarkImage.addGestureRecognizer(tapBookMark)
        bookmarkImage.isUserInteractionEnabled = true
        
    }
    
    func bindViewModel() {
        viewModel.isWikipedia.bind {[weak self] result in
            self?.wikipediaBtnOutlet.isHidden = !result!
        }
        viewModel.imageBookMark.bind {[weak self] result in

            self?.bookmarkImage.image = result
        }
    }
    
    @objc
    func imageTapBookMark(sender:UITapGestureRecognizer){
        viewModel.tapBookMark()
    }
    
}
