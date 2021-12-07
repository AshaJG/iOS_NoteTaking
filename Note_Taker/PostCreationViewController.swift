//
//  PostCreationViewController.swift
//  Note_Taker
//
//  Created by Tenzin Rigchok on 11/22/21.
//

import UIKit
import Parse
import AlamofireImage

class PostCreationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var CourseNumber: UITextField!
    @IBOutlet weak var Hashtags: UITextField!
    @IBOutlet weak var CameraPicture: UIImageView!
    @IBOutlet weak var PhotoAlbum: UIImageView!
    @IBOutlet weak var Caption: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onCancelPost(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func OnSubmitPost(_ sender: Any){
        
        let courseSection = PFObject(className: "Course")
        courseSection["courseNumber"] = (CourseNumber.text!).uppercased()
        courseSection["user"] = PFUser.current()!
        courseSection["hashtags"] = Hashtags.text!
        courseSection["caption"] = Caption.text!

        let imageData = PhotoAlbum.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        courseSection["image"] = file

        courseSection.saveInBackground{ (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("error")
            }
        }
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
        
        present(cameraPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           let image = info[.editedImage] as! UIImage
           
           let size = CGSize(width: 374, height: 377)
           let scaledImage = image.af_imageScaled(to: size)
           PhotoAlbum.image = scaledImage
           dismiss(animated: true, completion: nil)
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
