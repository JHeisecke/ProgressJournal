//
//  FormViewController.swift
//  Progress Journal
//
//  Created by User on 2/16/20.
//  Copyright © 2020 jheisecke. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var imageProgress: UIImageView!
    @IBOutlet weak var titleProgress: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.layer.cornerRadius = addButton.frame.height / 2

        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageProgress.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func existingFiles(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func openCamera(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addProgress(_ sender: Any) {
        
    }
}
