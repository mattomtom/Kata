import XCTest
@testable import BowlingGameSwift

class BowlingGameTests: XCTestCase {
    var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    //
    // Tests
    //
    func testGutterGame() {
        rollMany(pins: 0, times: 20)
        
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes(){
        rollMany(pins: 1, times: 20)
        
        XCTAssertEqual(game.score(), 20)
    }
    
    func testOneSpare() {
        rollSpare()
        game.roll(3)
        rollMany(pins: 0, times: 17)
        
        XCTAssertEqual(game.score(), 16)
    }
    
    func testOneStrike() {
        rollStrike()
        game.roll(3)
        game.roll(4)
        rollMany(pins: 0, times: 16)
        
        XCTAssertEqual(game.score(), 24)
    }
    
    func testPerfectGame() {
        rollMany(pins: 10, times: 12)
        
        XCTAssertEqual(game.score(), 300)
    }
    
    //
    // Private methods
    //
    private func rollMany(pins: Int, times: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }
    
    private func rollSpare(){
        game.roll(5)
        game.roll(5)
    }
    
    private func rollStrike(){
        game.roll(10)
    }
}
