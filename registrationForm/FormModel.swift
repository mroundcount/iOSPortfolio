import Foundation

class FormModel {
    
    private var persons = [String]()
    
    init() {}
    
    var numberOfPersons: Int {
        return persons.count
    }
    
    func addPerson(name: String) {
        persons.append(name)
        print("\(persons[0])")
    }

    func person(atIndex index: Int) -> String? {
        return self.persons.element(atIndex: index)
    }

    func resetPersons() {
        persons.removeAll()
    }


func validation(name: String?, email: String?, password: String?, phone: String?) -> Bool {
    if ((name?.count)! >= 3) && validateEmail(email: email!) && validatePhone(phone: phone!) && ((password?.count)! >= 7){
        return true
    }else{
        return false
        }
    }

    func validateName(name:String) -> Bool {
        if (name.count) >= 3 {
            return true
        } else { return false }
    }

    func validatePassword(password:String) -> Bool {
        if (password.count) >= 7 {
            return true
        } else { return false }
    }

    func validateEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    func validatePhone(phone:String) -> Bool {
        let phoneRegEx = "^\\d{3}\\d{3}\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: phone)
    }
}

extension Array {
    func element(atIndex index: Int) -> Element? {
        if index < 0 || index >= self.count { return nil }
        return self[index]
    }
}











