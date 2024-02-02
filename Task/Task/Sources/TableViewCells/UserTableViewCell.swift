//
//  UserTableViewCell.swift
//  Task
//
//  Created by Mohanraj T on 01/02/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadCellData(model: User) {
        idLable.text = String(model.id)
        userNameLabel.text = model.name
        emailLabel.text = model.email
    }
    
}
