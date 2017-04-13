//
//  ChatViewController.swift
//  Week3Challenge
//
//  Created by Patchirajan, Karpaga Ganesh on 4/12/17.
//  Copyright © 2017 Patchirajan, Karpaga Ganesh. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        var message = PFObject(className:"Message")
        message["text"] = messageTextField.text!
        message.saveInBackground {
            (success, error) -> Void in
            if (success) {
                // The object has been saved.
                print("Message Saved !!")
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

}
