//
//  LoginViewController.swift
//  chatapp
//
//  Created by HungPN on 10/11/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
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
    @IBAction func onLoginSubmit(_ sender: Any) {
        
    }
    
    @IBAction func navigateRegister(_ sender: Any) {
        self.navigationController?.pushViewController(RegisterViewController(nibName: nil, bundle: nil), animated: true)
    }
    
}
