//
//  LoginViewController.swift
//  Note_Taker
//
//  Created by Ashley Jo-ann Grant on 11/14/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    //Connect the Outlets

    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
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
    
    //Add action functionality
    
    @IBAction func onSignIn(_ sender: Any) {
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        //user.email = "email@example.com"
        
        user.signUpInBackground { success, error in
            
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else
            {
                print("Error :\(String(describing: error?.localizedDescription))")
            }
        }
        
    }
}
