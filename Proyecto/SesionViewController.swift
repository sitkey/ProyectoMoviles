//
//  SesionViewController.swift
//  Proyecto
//
//  Created by Mac12 on 31/01/21.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics
class SesionViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func registrase(_ sender: UIButton) {
        if let email = email.text, let password = password.text{
                Auth.auth().createUser(withEmail: email, password: password){
                    (result, error) in

                    if error == nil {
                        self.navigationController?.popViewController(animated: true)

                        self.dismiss(animated: true, completion: nil)
                    } else {
                        let alertController = UIAlertController(title: "error", message: "Se ha producido un error mientras se registraba", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                    }
            }
        }
    }
    @IBAction func acceder(_ sender: UIButton) {
        if let email = email.text, let password = password.text{
                Auth.auth().signIn(withEmail: email, password: password){
                    (result, error) in

                    if error == nil {
                        self.navigationController?.popViewController(animated: true)

                        self.dismiss(animated: true, completion: nil)
                    } else {
                        let alertController = UIAlertController(title: "error", message: "Se ha producido un error mientras se registraba", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                    }
            }
        }
    }
}
