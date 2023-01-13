//
//  Todo.swift
//  todolist
//
//  Created by Mohamed El Amri on 23/11/2022.
//

import Foundation

class Todo {
    var name: String
    var desc: String
    var date: Date
    var completed: Bool
    init(name: String, desc: String,date:Date) {
        self.name = name
        self.desc = desc
        self.date = date
        self.completed = false
    }
}
