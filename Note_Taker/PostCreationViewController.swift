//
//  PostCreationViewController.swift
//  Note_Taker
//
//  Created by Tenzin Rigchok on 11/22/21.
//

import UIKit

class PostCreationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var CourseNumber: UITextField!
    @IBOutlet weak var Hashtags: UITextField!
    @IBOutlet weak var CameraPicture: UIImageView!
    @IBOutlet weak var PhotoAlbum: UIImageView!
    @IBOutlet weak var Caption: UITextField!
    
    @IBAction func OnSubmitPost(_ sender: Any) {
    }
    
    @IBAction func LoadPhotoAlbum(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func LoadCamera(_ sender: Any) {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        cameraPicker.sourceType = .camera
        
        present(cameraPicker, animated: true, completion: nil)    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
