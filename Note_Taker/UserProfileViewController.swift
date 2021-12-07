//
//  UserProfileViewController.swift
//  Note_Taker
//
//  Created by Ashley Jo-ann Grant on 12/7/21.
//

import UIKit
import Parse

class UserProfileViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //outlets
    
    @IBOutlet weak var userFullNameLabel: UILabel!
    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserDetails()

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
    
    
    @IBAction func selectProfileButton(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion : nil)
    }
    
    @IBAction func editButttonTapped(_ sender: Any) {
        var editProfile = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        editProfile.opener = self
        let editProfileNav = UINavigationController(rootViewController: editProfile)
        self.present(editProfileNav, animated: true , completion : nil)
    }
          
    func loadUserDetails(){
        let userName = PFUser.current()?.object(forKey: "username") as! String
        userFullNameLabel.text = userName
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            profilePhotoImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            self.dismiss(animated: true, completion : nil)
            
        }
    
    
}
