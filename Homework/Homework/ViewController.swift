//
//  ViewController.swift
//  Homework
//
//  Created by Александр on 02.07.2021.
//

import UIKit

let users = [(username: "Admin", password: "Admin")]

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var rememberLabel: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func LoginButton(_ sender: Any) {
        for i in 0..<users.count {
            if usernameTextField.text == users[i].username && PasswordTextField.text == users[i].password {
                performSegue(withIdentifier: "GoToPhoneBook", sender: nil)
            } else {
                warningLabel.textColor = .systemRed
                warningLabel.text = "Введен неверный логин/пароль"
            }
        }
    }


}

