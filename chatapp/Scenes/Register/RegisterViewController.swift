//
//  RegisterViewController.swift
//  chatapp
//
//  Created by HungPN on 10/11/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var genderTf: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var lastNameTf: UITextField!
    @IBOutlet weak var firstNameTf: UITextField!
    
    private let viewModel = RegisterViewModel()
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

    @IBAction func signUp(_ sender: Any) {
        guard let email = emailTf.text, let password = passwordTf.text, let phoneNumber = phoneTf.text, let firstName = firstNameTf.text, let lastName = lastNameTf.text, let gender = genderTf.text else{
            return
        }
        viewModel.register(body: ["email": email, "password": password, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "gender":gender]) { res in
            if(res){
                let naviController = UINavigationController(rootViewController: LoginViewController(nibName: nil, bundle: nil))
                naviController.isNavigationBarHidden = true
                UIApplication.shared.currentWindow?.rootViewController = naviController
            }
        }
    }
}
