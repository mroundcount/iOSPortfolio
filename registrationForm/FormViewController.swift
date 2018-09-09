import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    
    @IBOutlet weak var contactsTable: UITableView!
    

    @IBOutlet weak var nameValid: UIImageView!
    
    @IBOutlet weak var emailValid: UIImageView!
    @IBOutlet weak var passwordValid: UIImageView!
    @IBOutlet weak var phoneValid: UIImageView!
    
    
    private let formModel = FormModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText.delegate = self
        emailText.delegate = self
        passwordText.delegate = self
        phoneText.delegate = self
        
        contactsTable.dataSource = self
     
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedBackground))
        view.addGestureRecognizer(tap)

        signUpButton.isEnabled = false
        
        nameText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        emailText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        phoneText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBAction func signUp(_ sender: UIButton) {
        addPerson()
        clear()
        
        nameValid.image = nil
        emailValid.image = nil
        passwordValid.image = nil
        phoneValid.image = nil
    }

    @IBAction func reset(_ sender: UIButton) {
        clear()
        formModel.resetPersons()
        resetPerson()
        
        nameValid.image = nil
        emailValid.image = nil
        passwordValid.image = nil
        phoneValid.image = nil
    }
    
    @IBAction func clear(_ sender: UIButton) {
        clear()
        
        nameValid.image = nil
        emailValid.image = nil
        passwordValid.image = nil
        phoneValid.image = nil
    }

    @objc func tappedBackground() {
        view.endEditing(true)
    }
    
    private func resetPerson() {
        contactsTable.reloadData()

        view.endEditing(true)
    }
    
    private func addPerson() {
        guard let name = nameText.text else {
            return
        }

        formModel.addPerson(name: name)
        nameText.text = nil

        contactsTable.reloadData()

        view.endEditing(true)
    }
    
    private func clear() {
        nameText.text = nil
        emailText.text = nil
        passwordText.text = nil
        phoneText.text = nil
    }
}

extension FormViewController: UITextFieldDelegate {
    func textFieldShouldReturn(texter textField: UITextField) -> Bool {
        addPerson()
        return true
    }
}

extension FormViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formModel.numberOfPersons
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)

        guard let name = formModel.person(atIndex: indexPath.row) else {
            return cell
    }

    cell.textLabel?.text = name
    return cell
    }

    @objc func editingChanged(_ textField: UITextField) {
        if formModel.validation(name: nameText.text, email: emailText.text, password: passwordText.text, phone: phoneText.text) == true {
            self.signUpButton.isEnabled = true
        } else {
            self.signUpButton.isEnabled = false
        }

        if formModel.validateName(name: nameText.text!) == true {
            let yourImage: UIImage = UIImage(named: "up.jpg")!
            nameValid.image = yourImage
            } else {
            let yourImage: UIImage = UIImage(named: "down.jpg")!
            nameValid.image = yourImage
        }

        if formModel.validateEmail(email: emailText.text!) == true {
                let yourImage: UIImage = UIImage(named: "up.jpg")!
                emailValid.image = yourImage
            } else {
                let yourImage: UIImage = UIImage(named: "down.jpg")!
            emailValid.image = yourImage
        }

        if formModel.validatePassword(password: passwordText.text!) == true {
            let yourImage: UIImage = UIImage(named: "up.jpg")!
            passwordValid.image = yourImage
        } else {
            let yourImage: UIImage = UIImage(named: "down.jpg")!
            passwordValid.image = yourImage
        }

        if formModel.validatePhone(phone: phoneText.text!) == true {
            let yourImage: UIImage = UIImage(named: "up.jpg")!
            phoneValid.image = yourImage
        } else {
            let yourImage: UIImage = UIImage(named: "down.jpg")!
            phoneValid.image = yourImage
        }
    }
}
























