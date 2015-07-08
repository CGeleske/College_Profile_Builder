//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Christopher Geleske on 7/6/15.
//  Copyright © 2015 Christopher Geleske. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var colleges : [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        colleges.append(College(name: "Chicago", state: "Illinois", population: 2700000, image: UIImage(named: "flag")!))
        colleges.append(College(name: "Denver", state: "Denver", population: 100000, image: UIImage(named: "flag")!))
        colleges.append(College(name: "Mars", state: "Denial", population: 1, image: UIImage(named: "flag")!))
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = colleges[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in textField.placeholder = "Add College Here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) { (action) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(College(name: collegeTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated : true, completion : nil)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        }
        else {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
}






