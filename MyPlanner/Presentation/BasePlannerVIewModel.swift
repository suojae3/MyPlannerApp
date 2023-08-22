//
//  BasePlannerVIewModel.swift
//  MyPlanner
//
//  Created by ㅣ on 2023/08/22.
//

import Foundation

protocol UseCaseProvider {
    func makeUseCase() -> UseCase
}

class DefaultUseCaseProvider: UseCaseProvider {
    func makeUseCase() -> UseCase {
        return UserDefaultsTaskDataSource()
    }
}

class BasePlannerViewModel {
    
    var tasks: [Task] = []
    let useCases: UseCase
    
    init(useCases: UseCase) {
        self.useCases = useCases
    }
}


//MARK: CRUD
extension BasePlannerViewModel {
    
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
}
    

//MARK: 플로팅 버튼
extension BasePlannerViewModel {

    func handleAddTask() {
        print("Test")
    }
}
