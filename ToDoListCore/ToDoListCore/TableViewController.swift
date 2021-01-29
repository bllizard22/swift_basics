//
//  TableViewController.swift
//  ToDoListCore
//
//  Created by Nikolay Kryuchkov on 26.01.2021.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    // Array of Task (declared in .xcdatamodeld)
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Clear task list
//        clearTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let context = getContext()
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        // Sorting of tasks list
//        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
//        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Obtain data from context
        do {
            try tasks = context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    // MARK: - Table view data source

    // Save button pressed
    @IBAction func saveTaskAction(_ sender: Any) {
        let alertController = UIAlertController(title: "New Task", message: "Please add a new task", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            let tf = alertController.textFields?.first
            if let newTaskTitle = tf?.text {
//                self.tasks.insert(newTask, at: 0)
                self.saveTask(withTitle: newTaskTitle)
                self.tableView.reloadData()
            }
        }
        
        alertController.addTextField { (_) in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil )
    }
    
    // Clear all tasks in CoreData
    private func clearTasks() {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        if let result = try? context.fetch(fetchRequest) {
            for object in result {
                context.delete(object)
            }
        }
        
        do {
            try context.save()
        } catch let error as NSError  {
            print(error.localizedDescription)
        }
    }
    
    // Add new record in CoreData
    private func saveTask(withTitle title: String) {
        let context = getContext()
         
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else {return}
        
        // Create new task
        let taskObject = Task(entity: entity, insertInto: context)
        taskObject.title = title
        
        // Save new task in memory at 0 position
        do {
            try context.save()
//            tasks.append(taskObject)
            tasks.insert(taskObject, at: 0)
        } catch let error as NSError  {
            print(error.localizedDescription)
        }
    }
    
    // Get context for app
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        return cell
    }


}
