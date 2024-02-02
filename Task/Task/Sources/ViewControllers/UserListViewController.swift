//
//  ViewController.swift
//  Task
//
//  Created by Mohanraj T on 01/02/24.
//

import UIKit

protocol CreateUser: AnyObject {
    func reloadUserList()
}

class UserListViewController: UIViewController {

    @IBOutlet weak var userListTableView: UITableView!
    @IBOutlet weak var addUserBarButton: UIBarButtonItem!
    
    let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadData()
        // Do any additional setup after loading the view.
    }

    private func configure() {
        userListTableView.delegate = self
        userListTableView.dataSource = self
        userListTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    private func loadData() {
        viewModel.getUserlist {
            DispatchQueue.main.async {
                self.userListTableView.reloadData()
            }
        }
    }
    
    @IBAction func addUsertapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddUserViewController") as? AddUserViewController
        vc?.delegate = self
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell {
            cell.loadCellData(model: viewModel.users[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension UserListViewController: CreateUser {
    func reloadUserList() {
        loadData()
    }
}
