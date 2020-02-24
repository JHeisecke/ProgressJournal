//
//  FormViewController.swift
//  Progress Journal
//
//  Created by User on 2/16/20.
//  Copyright © 2020 jheisecke. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var imageProgress: UIImageView!
    @IBOutlet weak var titleProgress: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.layer.cornerRadius = addButton.frame.height / 2

    }
    
    @IBAction func existingFiles(_ sender: Any) {
        
    }
    
    @IBAction func openCamera(_ sender: Any) {
        
    }
    
    @IBAction func addProgress(_ sender: Any) {
        
    }
}
