//
//  DataSource.swift
//  MyPlanner
//
//  Created by ㅣ on 2023/08/22.
//

import Foundation

protocol UseCase {
    func save(task: Task) -> Bool
    func fetchAllTasks() -> [Task]
    func delete(task: Task) -> Bool
    func update(task: Task) -> Bool
}


class UserDefaultsTaskDataSource: UseCase {
    
    private let tasksKey = "tasks_key"
    
    func save(task: Task) -> Bool {
        var tasks = fetchAllTasks()
        tasks.append(task)
        return store(tasks: tasks)
    }
    
    func fetchAllTasks() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: tasksKey) else { return [] }
        let tasks = try? JSONDecoder().decode([Task].self, from: data)
        return tasks ?? []
    }
    
    func delete(task: Task) -> Bool {
        var tasks = fetchAllTasks()
        tasks.removeAll(where: { $0.id == task.id })
        return store(tasks: tasks)
    }
    
    func update(task: Task) -> Bool {
        var tasks = fetchAllTasks()
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return false }
        tasks[index] = task
        return store(tasks: tasks)
    }
    
    private func store(tasks: [Task]) -> Bool {
        guard let data = try? JSONEncoder().encode(tasks) else { return false }
        UserDefaults.standard.set(data, forKey: tasksKey)
        return true
    }
}
