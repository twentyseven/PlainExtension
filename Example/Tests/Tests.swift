import XCTest
import PlainExtension

class Tests: XCTestCase {
    let view = UIView(backgroundColor: .white)
    let test1 = UIView()
    let test2 = UIView()
    let test3 = UIView()
    
    override func setUp() {
        super.setUp()
        view.addSubViews(test1, test2, test3)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
        
    func testView() {
        XCTAssert(view.subviews.count == 3, "Pass")
        XCTAssert(view.backgroundColor == .white, "Pass")
        test3.fillInSuperView()
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
