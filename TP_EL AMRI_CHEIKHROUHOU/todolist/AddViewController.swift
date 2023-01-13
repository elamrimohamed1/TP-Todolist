//
//  AddViewController.swift
//  todolist
//
//  Created by Mohamed El Amri on 23/11/2022.
//

import UIKit

class AddViewController: UIViewController {
    var main: ViewController? = nil

    // the input fields are used actively
    // their modifications are taken into account when the Todo is saved
    @IBOutlet weak var namefield: UITextField!
    @IBOutlet weak var descfield: UITextView!
    
    @IBOutlet weak var date: UIDatePicker!
    

    @IBAction func done(_ sender: UIButton) {
        let name = namefield.text!
        let desc = descfield.text!
        
        let todo = Todo(name: name, desc: desc, date: date.date)
        
        // alternative way of using the navigation controller to get the main view controller
        //let rootvc = (navigationController?.viewControllers[0])! as! ViewController

        main?.items.append(todo)
        main?.items = (main?.items.sorted(by: {
            $0.date < $1.date
        }))!
        main?.reset_searchbar()
        main?.tableview.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descfield.delegate = self
        title = "Add new task"

        // Do any additional setup after loading the view.
        descfield.layer.borderWidth = 0.3
        descfield.layer.borderColor = UIColor.lightGray.cgColor
        descfield.layer.cornerRadius = 5
        
        descfield.text = ""
    }


}

extension AddViewController: UITextViewDelegate {
    //
}
