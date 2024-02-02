//
//  AddUserViewController.swift
//  Task
//
//  Created by Mohanraj T on 01/02/24.
//

import UIKit

class AddUserViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var createUserButton: UIButton!
    @IBOutlet weak var statusSegmentControl: UISegmentedControl!

    private var status: String = "active"
    weak var delegate: CreateUser?
    let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add User"
        setupTextFields()
    }
    
    func setupTextFields() {
        createUserButton.backgroundColor = .lightGray
        createUserButton.titleLabel?.textColor = .white
        nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        genderTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if nameTextField.text!.isEmpty || emailTextField.text!.isEmpty || genderTextField.text!.isEmpty {
            createUserButton.backgroundColor = .lightGray
            createUserButton.isUserInteractionEnabled = false
        } else {
            createUserButton.backgroundColor = .systemBlue
            createUserButton.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func createUser(_ sender: Any) {
        let user = User(id: 1, name: nameTextField.text!, email: emailTextField.text!, gender: genderTextField.text!, status: status)
        viewModel.createUser(user: user) {
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
            self.delegate?.reloadUserList()
        }
    }
    
    @IBAction func statusSegmentChanged(_ sender: UISegmentedControl) {
        status = sender.selectedSegmentIndex == 0 ? "active" : "inactive"
    }
}
