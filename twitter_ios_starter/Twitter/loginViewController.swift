//
//  loginViewController.swift
//  Twitter
//
//  Created by Carlo Leiva on 9/16/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn")==true{
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {//see if logged in scucesfully
            UserDefaults.standard.set(true,forKey:"userLoggedIn")//any time someone logs in it will set a varabel userLoggedIn and set it to true so they dont have to log in again.
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { Error in
            print("Failed login")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
