
import Foundation

class User {
    
    var userEmail : String!
    var password:String!
    var isRegistered:Bool!

    init(userEmail : String, password : String, isRegistered:Bool){
        self.userEmail = userEmail
        self.password = password
        self.isRegistered = isRegistered

    }
    
    
}
