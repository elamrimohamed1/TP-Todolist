//
//  ToggledTableViewCell.swift
//  todolist
//
//  Created by Mohamed El Amri on 23/11/2022.
//

import UIKit

class ToggledTableViewCell: UITableViewCell {
    var todo: Todo?

    @IBOutlet weak var switchbtn: UISwitch!
    @IBAction func toggle(_ sender: UISwitch) {
        todo?.completed = sender.isOn
    }
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
