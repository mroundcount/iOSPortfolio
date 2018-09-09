enum GameDirection {
    case north, east, west, south
}

struct GameLocation {
    let x: Int
    let y: Int
    let allowedDirections: [GameDirection]
    var event: String?
}

struct GameRow {
    let locations: [GameLocation]
}

class GameModel {
    
    private var currentRowIndex = 2          // start at (x: 0, y: 0)
    private var currentLocationIndex = 2     // which translates to index 2 in our arrays
    
    private var gameGrid: [GameRow] = []
    
    init() {
        self.gameGrid = createGameGrid()
    }

    func restart() {
        currentRowIndex = 2
        currentLocationIndex = 2
    }
    
    func move(direction: GameDirection) {
        switch direction {
        case .north:    currentRowIndex += 1
        case .south:    currentRowIndex -= 1
        case .east:     currentLocationIndex += 1
        case .west:     currentLocationIndex -= 1
        }
    }
    
    var currentLocation: GameLocation {
        
        let x = self.gameGrid[currentRowIndex].locations[currentLocationIndex].x
        let y = self.gameGrid[currentRowIndex].locations[currentLocationIndex].y

        let event = eventForCoordinate(x: x, y: y)
        
        return GameLocation(x: x, y: y, allowedDirections: self.gameGrid[currentRowIndex].locations[currentLocationIndex].allowedDirections, event: event)
    }
    
    func eventForCoordinate(x: Int, y: Int) -> String? {
 
        if x == 0 && y == -1 {
            return "The stars at night - are big and bright."
        } else if
             x == 2 && y == 0 {
                return "Country road take me home to the place I belong."
        }
        else {
        return nil
        }
    }
    
    private func createGameGrid() -> [GameRow] {
        var gameGrid = [GameRow]()
        for yValue in -2...2 {
            var locations = [GameLocation]()
            for xValue in -2...2 {
                let directions = allowedDirectionsForCoordinate(x: xValue, y: yValue)
                let event = eventForCoordinate(x: xValue, y: yValue)
                let location = GameLocation(x: xValue, y: yValue, allowedDirections: directions, event: event)
                locations.append(location)
            }
            let gameRow = GameRow(locations: locations)
            gameGrid.append(gameRow)
        }
        return gameGrid
    }
    
    private func allowedDirectionsForCoordinate(x: Int, y: Int) -> [GameDirection] {
        var directions = [GameDirection]()
        
        switch y {
        case -2:    directions += [.north]
        case 2:     directions += [.south]
        default:    directions += [.north, .south]
        }
        
        switch x {
        case -2:    directions += [.east]
        case 2:     directions += [.west]
        default:    directions += [.east, .west]
        }
        
        return directions
    }
    
    func locationLabel() -> String{
        return "(x:\(currentRowIndex),y:\(currentLocationIndex)"
    }
}
