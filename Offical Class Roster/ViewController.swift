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
        
        //Begins setting up a table
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.view.backgroundColor = UIColor.grayColor()
        
        let jac = Person(firstName: "Jac", lastName: "Wynn")
        jac.image = UIImage(named: "me.jpg")
        println(jac.firstName)
        let tyler = Person(firstName: "Tyler", lastName: "Wynn")
        let jordan = Person(firstName: "Michael", lastName: "Jordan")
        jordan.image = UIImage(named: "jordan.jpg")
        let larry = Person(firstName: "Larry", lastName: "Bird")
        let magic = Person(firstName: "Magic", lastName: "Johnson")
        
        self.people.append(jac)
        self.people.append(tyler)
        self.people.append(jordan)
        self.people.append(larry)
        self.people.append(magic)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    //Number of Rows -- First question to ask
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    //Dequeue a cell, configure a cell, then return the cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let person = self.people[indexPath.row]
        cell.textLabel?.text = person.firstName + " " + person.lastName
        
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

