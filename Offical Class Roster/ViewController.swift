//
//  ViewController.swift
//  Offical Class Roster
//
//  Created by Jacquin Wynn Jr on 3/3/15.
//  Copyright (c) 2015 JMW. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //Create an array of Person objects
    var people = [Person] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        self.loadFromArchive()
        
        if let count = userDefaults.objectForKey("launchCount") as? Int {
            let newCount = count + 1
            userDefaults.setObject(newCount, forKey: "launchCount")
        } else {
            println("First Launch!")
            let count = 1
            userDefaults.setObject(count, forKey: "launchCount")
        }
        
        userDefaults.synchronize() //saves the user defaults
        
        
        
        //Begins setting up a table
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.view.backgroundColor = UIColor.grayColor()
        
        
       
        
        if self.people.isEmpty {
        //Using the plist -- identifying where the file lives
        if let filePath = NSBundle.mainBundle().pathForResource("Roster", ofType: "plist") {
            println(filePath)
        

            if let plistArray = NSArray(contentsOfFile: filePath) {
                println(plistArray)
                for rosterObject in plistArray {
                    if let rosterDictionary = rosterObject as? NSDictionary {
                        let firstName = rosterDictionary["firstName"] as String
                        let lastName = rosterDictionary["lastName"] as String
                        let person = Person(firstName: firstName, lastName: lastName)
                        self.people.append(person)
                    }
                }
            }
       }
            
        }
        
        self.saveToArchive()
        
        
        
        
        
        
//       let jac = Person(firstName: "Jac", lastName: "Wynn")
//        jac.image = UIImage(named: "me.jpg")
//        println(jac.firstName)
//        let tyler = Person(firstName: "Tyler", lastName: "Wynn")
//        let jordan = Person(firstName: "Michael", lastName: "Jordan")
//        jordan.image = UIImage(named: "jordan.jpg")
//        let larry = Person(firstName: "Larry", lastName: "Bird")
//        let magic = Person(firstName: "Magic", lastName: "Johnson")
//        
//        self.people.append(jac)
//        self.people.append(tyler)
//        self.people.append(jordan)
//        self.people.append(larry)
//        self.people.append(magic)
    }
    
    func loadFromArchive() {
        let path = getDocumentsPath()
        let arrayFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(path + "/MyArchive") as [Person]
        self.people = arrayFromArchive
    }
    
    func saveToArchive() {
        let path = self.getDocumentsPath()
        
        NSKeyedArchiver.archiveRootObject(self.people, toFile: path + "/MyArchive")
    }
    
    func getDocumentsPath() -> String {
       let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let path = paths.first as String
        return path
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.saveToArchive()
        self.tableView.reloadData()
    }

    //Number of Rows -- First question to ask
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    //Dequeue a cell, configure a cell, then return the cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as RosterCellTableViewCell
        let person = self.people[indexPath.row]
        cell.rosterLabel.text = person.firstName + " " + person.lastName
        
        if person.image != nil {
            cell.rosterImageView.image = person.image
        } else {
            cell.rosterImageView.image = UIImage(named: "smiley.png")
        }
        
        return cell
    }
    
    //Pass information to the next view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowPersonDetail" {
            let destinationVC = segue.destinationViewController as RosterDetailViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow()
            let person = self.people[indexPath!.row]
            
            destinationVC.selectedPerson = person
        }
    }

}

