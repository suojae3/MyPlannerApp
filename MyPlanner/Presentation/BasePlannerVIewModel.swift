//
//  BasePlannerVIewModel.swift
//  MyPlanner
//
//  Created by ㅣ on 2023/08/22.
//

import Foundation
//
//   PlannerViewModelProtocol.swift
//  MyPlanner
//
//  Created by ㅣ on 2023/08/22.
//

import Foundation

class BasePlannerViewModel {
    
    var tasks: [Task] = []
    
    let useCases: UseCase
    
    init(useCases: UseCase) {
        self.useCases = useCases
    }

    func fetchTasks() {
        tasks = useCases.fetchAllTasks()
    }
    
    func addTask(title: String, dueDate: Date, description: String) -> Bool {
        let newTask = Task(id: UUID(), title: title, dueDate: dueDate, description: description)
        return useCases.save(task: newTask)
    }
    
    func deleteTask(at index: Int) -> Bool {
        let taskToDelete = tasks[index]
        return useCases.delete(task: taskToDelete)
    }
    
    func updateTask(at index: Int, title: String, dueDate: Date, description: String) -> Bool {
        var taskToUpdate = tasks[index]
        taskToUpdate.title = title
        taskToUpdate.dueDate = dueDate
        taskToUpdate.description = description
        return useCases.update(task: taskToUpdate)
    }
    
    // 플로팅 버튼
    func handleAddTask() {
        print("Test")
    }
}
