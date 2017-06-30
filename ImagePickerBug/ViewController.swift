//
//  ViewController.swift
//  ImagePickerBug
//
//  Created by Randy Etheredge on 6/30/17.
//  Copyright © 2017 Randy Etheredge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?
    
    var currentCount = 0 {
        didSet {
            label?.text = "\(currentCount)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func takePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.cameraCaptureMode = .photo
            
            imagePickerController.allowsEditing = false
            imagePickerController.delegate = self
            
            present(imagePickerController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Camera Needed", message: "You must use the camera to reproduce this bug.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            
            present(alert, animated: true)
            
        }
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        currentCount += 1
        picker.dismiss(animated: true)
    }
}
