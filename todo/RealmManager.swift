//
//  RealmManager.swift
//  todo
//
//  Created by 朱哲哲 on 2022/1/13.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm(){
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch  {
            print("Error open realm: \(error)")
        }
        
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            // get tasks and sort by completed
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    
                    getTasks()
                    print("Add new tasks!", newTask)
                }
            } catch {
                print("Error add task \(error)")
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                // 找到要更新的
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id==%@", id))
                // 如果 empty, return
                guard !taskToUpdate.isEmpty else {return}
                try localRealm.write{
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task \(id)")
                }
            } catch {
                print("Error updating task \(id), \(error)")
            }
        }
    }
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id=%@", id))
                guard !taskDelete.isEmpty else {
                    return
                }
                try localRealm.write{
                    localRealm.delete(taskDelete)
                    getTasks()
                    print("task \(id) deleted")
                }
            } catch {
                print("Error delete task \(id), \(error)")
            }
        }
    }
    
}
