//
//  TodoViewController.swift
//  todolist
//
//  Created by Mohamed El Amri on 23/11/2022.
//

import UIKit

class TodoViewController: UIViewController {
    // set by the main view controller
    var index: Int = 0 // index in main.displayedItems
    
    @IBOutlet weak var dateLabel: UILabel!
    var main: ViewController? = nil

    
    @IBOutlet weak var namefield: UITextField!
    @IBOutlet weak var textfield: UITextView!
    @IBOutlet weak var completed: UISwitch!
    
    @IBAction func namefield(_ sender: UITextField) {
        main?.displayedItems[index].name = sender.text!
        main?.tableview.reloadData()
    }
    @IBAction func complete(_ sender: UISwitch) {
        main?.displayedItems[index].completed = sender.isOn
        main?.tableview.reloadData()
    }
    @IBAction func delete_btn(_ sender: UIButton) {
        let todo = main?.displayedItems[index]
        // find the index in main.items
        let itemIndex = (main?.items.firstIndex(where: {$0 === todo}))!
        main?.items.remove(at: itemIndex)
        main?.displayedItems.remove(at: index)
        main?.tableview.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit task"
        textfield.delegate = self

        // copy the default style of the UITextField
        textfield.layer.borderWidth = 0.3
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.cornerRadius = 5
        
        namefield.text = main?.items[index].name
        textfield.text = main?.items[index].desc
        completed.isOn = main!.items[index].completed
        
        // formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/ MM / yyyy"
        dateFormatter.locale = Locale(identifier: "FR-fr")
        let dateFormat = dateFormatter.string(from: (main?.items[index].date)!)
        dateLabel.text = dateFormat
    }

}

extension TodoViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        main?.displayedItems[index].desc = textView.text
    }
}
