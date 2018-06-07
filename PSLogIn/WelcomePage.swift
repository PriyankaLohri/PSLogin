//
//  WelcomePage.swift
//  PSLogIn


import UIKit

class WelcomePage: UIViewController {
    @IBOutlet weak var lblWelcome: UILabel!
    var userName:String?
    
    func setUserName(userName:String) {
      self.userName = userName
    }
    
    override func viewDidAppear(_ animated: Bool) {
        lblWelcome.text =  "Welcome" + " " + userName!
    }
}
