//
//  ChatViewController.swift
//  Week3Challenge
//
//  Created by Patchirajan, Karpaga Ganesh on 4/12/17.
//  Copyright © 2017 Patchirajan, Karpaga Ganesh. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var messages : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return messages.count;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell;
        cell.cellMessage.text = self.messages[indexPath.row]
        return cell;
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        var message = PFObject(className:"Message")
        message["text"] = messageTextField.text!
        message.saveInBackground {
            (success, error) -> Void in
            if (success) {
                // The object has been saved.
                print("Message Saved !!")
                self.messages.append(self.messageTextField.text!)
                self.tableView.reloadData()
            } else {
                // There was a problem, check error.description
            }
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func onTimer() {
        // Add code to be run periodically
        var query = PFQuery(className:"Message")
//        query.whereKey("playerName", equalTo:"Sean Plott")
        query.findObjectsInBackground {
            (objects , error) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                        print(object["text"]!)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error?.localizedDescription)")
            }
        }

    }

}
