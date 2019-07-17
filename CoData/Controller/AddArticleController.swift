//
//  AddArticleController.swift
//  CoData
//
//  Created by B Masset on 15/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit

class AddArticleController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var magasinTF: UITextField!
    
    @IBOutlet weak var prixTF: UITextField!
    
    var liste: Liste!
    var picker = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = false
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideKey), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKey), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func tapView() {
        view.endEditing(true)
    }
    
    @objc func hideKey(notification: Notification) {
        UIView.animate(withDuration: 0.35) {
            //self.bottomScroll.constant = 0
        }
    }
    
    @objc func showKey(notification: Notification) {
        if let height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            UIView.animate(withDuration: 0.35) {
                //self.bottomScroll.constant = height
            }
        }
    }
    
    @IBAction func addArticle(_ sender: Any) {
        view.endEditing(true)
        CoreDataHelper().saveArticle(name: nameTF.text, shop: magasinTF.text, prix: prixTF.text, image: imageView.image, liste: liste)
        navigationController?.popViewController(animated: true)
    }
        
    @IBAction func pictureGallery(_ sender: Any) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func camera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        }
    }
    
}

extension AddArticleController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let or = info[.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.imageView.image = or
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
