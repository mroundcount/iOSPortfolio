import UIKit

class GameViewController: UIViewController {

    let gameModel = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var event: UILabel!
    
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var specialEvent: UILabel!
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var north: UIButton!
    @IBOutlet weak var east: UIButton!
    @IBOutlet weak var south: UIButton!
    @IBOutlet weak var west: UIButton!
    
    
    
    @IBAction func reset(_ sender: UIButton) {
        gameModel.restart()
        event.text = "Reset"
        
        north.isEnabled = true
        south.isEnabled = true
        east.isEnabled = true
        west.isEnabled = true
        
        location.text = "(x: \(gameModel.currentLocation.x), y: \(gameModel.currentLocation.y))"
        specialEvent.text = gameModel.currentLocation.event
    }
    
    @IBAction func north(_ sender: UIButton) {
        event.text = "Moved North"
        gameModel.move(direction: .north)
        
        if gameModel.currentLocation.y == 2{
        north.isEnabled = false
        }

        south.isEnabled = true
        location.text = "(x: \(gameModel.currentLocation.x), y: \(gameModel.currentLocation.y))"
        specialEvent.text = gameModel.currentLocation.event
    }
    
    
    @IBAction func south(_ sender: UIButton) {
        event.text = "Moved South"
        gameModel.move(direction: .south)
        
        if gameModel.currentLocation.y == -2{
            south.isEnabled = false
        }
        
        north.isEnabled = true
        location.text = "(x: \(gameModel.currentLocation.x), y: \(gameModel.currentLocation.y))"
        specialEvent.text = gameModel.currentLocation.event
    }
    
    
    @IBAction func east(_ sender: UIButton) {
        event.text = "Moved East"
        gameModel.move(direction: .east)
        
        if gameModel.currentLocation.x == 2{
            east.isEnabled = false
        }
        
        west.isEnabled = true
        location.text = "(x: \(gameModel.currentLocation.x), y: \(gameModel.currentLocation.y))"
        specialEvent.text = gameModel.currentLocation.event
    
    }
    
    @IBAction func west(_ sender: UIButton) {
        event.text = "Moved West"
        gameModel.move(direction: .west)
        
        if gameModel.currentLocation.x == -2{
            west.isEnabled = false
        }
        
        east.isEnabled = true
        location.text = "(x: \(gameModel.currentLocation.x), y: \(gameModel.currentLocation.y))"
        specialEvent.text = gameModel.currentLocation.event
    }
}

