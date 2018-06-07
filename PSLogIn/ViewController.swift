//
//  ViewController.swift
//  PSLogIn


import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var txtFieldUserID: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user   = self.getRegistrationInfo()
        if(user.isRegistered == true){
           
            let wcVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomePage_Id") as! WelcomePage
            wcVC.setUserName(userName:user.userEmail)

            self.navigationController?.pushViewController(wcVC, animated: true)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(_ sender: Any) {
        let isIDValid = txtFieldUserID.text?.isEntryValid
        let isPasswordValid = txtFieldUserID.text?.isEntryValid

        if (isPasswordValid == true && isIDValid == true){
            storeRegistrationInfo(userEmail:txtFieldUserID.text! , password: txtFieldPassword.text!)
            let wcVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomePage_Id") as! WelcomePage
            wcVC.setUserName(userName:txtFieldUserID.text! )
            self.navigationController?.pushViewController(wcVC, animated: true)
        }else{
            let alert = UIAlertController(title: "Error", message: "Please enter vaild user id and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
      
    }
    
    // MARK: AuthData Store Handler
    public func storeRegistrationInfo(userEmail:String, password:String)  {
        
        UserDefaults.standard.set(userEmail, forKey: "userName")
        
        let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: "password", accessGroup: KeychainConfiguration.accessGroup)
        
        // Save the password for the new item.
        do {
            try passwordItem.savePassword(password)
        }
        catch {
            print("Error savePassword keychain item - \(error)")
        }
        
        
    }
    
    
    public  func getRegistrationInfo() -> User {
        
        let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: "password", accessGroup: KeychainConfiguration.accessGroup)
        
        if let userEmail = UserDefaults.standard.object(forKey: "userName") as? String{
            var password:String = " "
            var registered:Bool = false
            
            do {
                password =  try passwordItem.readPassword()
                registered = true
            }
            catch {
                print("Error readPassword keychain item - \(error)")
                registered = false
            }
            
            let userObj = User(userEmail: userEmail, password: password, isRegistered:registered)
            return userObj
            
        }else{
            do {
                try passwordItem.deleteItem()
            }
            catch {
                print("Error deleting keychain item - \(error)")
            }
            let userObj = User(userEmail: " ", password: " ", isRegistered:false)
            
            return userObj
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension String{
    var isEntryValid: Bool{
        return !isEmpty && rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil
    }
}


