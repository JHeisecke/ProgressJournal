//
//  ShowProgressViewController.swift
//  Progress Journal
//
//  Created by User on 2/24/20.
//  Copyright © 2020 jheisecke. All rights reserved.
//

import UIKit

class ShowProgressViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    var progress : Progress?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = progress?.title
        
        if let image = progress?.image {
            if let imageData = UIImage(data: image){
                mainImage.image = imageData
            }
        }
    }
    



}
