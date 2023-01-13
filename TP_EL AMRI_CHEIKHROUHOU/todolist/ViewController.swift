//
//  ViewController.swift
//  todolist
//
//  Created by Mohamed El Amri on 23/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var items: [Todo] = []
    var displayedItems: [Todo] = []

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func add_btn(_ sender: Any) {
        print("add btn")
        let vc = (storyboard?.instantiateViewController(identifier: "add"))! as AddViewController
        vc.main = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tasks"
        
        // create test todos
        items.append(Todo(name: "Courses", desc: "Acheter des oeufs",date: Date()))
        items.append(Todo(name:"Voyage", desc:"Préparer la valise", date: Date()))
        items.append(Todo(name:"Projet Swift", desc:"Envoyer le projet", date: Date()))
        items.append(Todo(name: "Name", desc: "Rendre visite à Tom", date: Date()))
        
        
            displayedItems = items
        
        tableview.delegate = self
        tableview.dataSource = self
        
        searchbar.delegate = self
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected " + String(indexPath.row))
        let vc = storyboard?.instantiateViewController(identifier: "todo") as! TodoViewController
        vc.main = self
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
        // TODO: dans l'énoncé, partir du dernier élément dans section 2 https://github.com/dginhac/esirem-itc44/tree/master/TP/2022-2023
        // TODO: finir le code et les events de TodoView
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToggledTableViewCell
        
        cell.todo = displayedItems[indexPath.row]
        cell.switchbtn.isOn = displayedItems[indexPath.row].completed
        cell.textLabel?.text = displayedItems[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedItems.count
    }
    
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        displayedItems = []
        if searchText == "" {
            displayedItems = items
        } else {
            for todo in items {
                if todo.name.uppercased().contains(searchText.uppercased()) {
                    displayedItems.append(todo)
                }
            }
        }
        tableview.reloadData()
    }
    
    
    
    func reset_searchbar() {
        searchbar.text = ""
        displayedItems = items
    }
}

