//
//  EditProfileViewController.swift
//  Note_Taker
//
//  Created by Ashley Jo-ann Grant on 12/4/21.
//

import UIKit
import Parse

class EditProfileViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var displayUsernameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordRepeatTextfield: UITextField!
    
    //connects to the profile to display changes
       var opener: ProfileViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Profile"
      // Do any additional setup after loading the view.
      //load user details
        let userName = PFUser.current()?.object(forKey: "username")
        displayUsernameTextfield.text = userName as! String
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseProfileButtonTapped(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion : nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let myUser:PFUser = PFUser.current()!
        //make certain that display name is never empty
        if((displayUsernameTextfield.text?.isEmpty) == nil){
            let myAlert = UIAlertController(title: "Alert", message: "display name can't be left empty", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil)
            return
         }
        //if the current user changes their password
        if((passwordTextField.text != nil) && (passwordTextField.text != passwordRepeatTextfield.text)){
                var myAlert = UIAlertController(title: "Alert", message: "passwords do not match", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                myAlert.addAction(okAction)
                self.present(myAlert, animated:true, completion:nil)
                return
            }
       
        //set new values
        let userName = displayUsernameTextfield.text
        myUser.setObject(userName, forKey: "username")
               
        //set new password
        if(passwordTextField.text != nil){
            let userpassword = passwordTextField.text
            myUser.password = userpassword
        }
               
        //set new profile picture
              /* if(profilePictureImageView != nil){
                   let profileFileObject = PFFileObject(data:profilePictureImageView)
                   myUser.setObject(profileFileObject, forKey: "profile_picture")
               }*/
               
        myUser.saveInBackground{(success, error) in
        if success {
            self.dismiss(animated: true, completion: {() -> Void in self.opener.loadUserDetails()})
            } else
            {
                   print("error")
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
           profilePictureImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
           self.dismiss(animated: true, completion : nil)
           
       }
}
