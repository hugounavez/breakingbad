//
//  CharacterListInteractorTests.swift
//  BreakingBadTests
//
//  Created by Hugo Reyes on 12/25/21.
//

import XCTest
@testable import BreakingBad

class CharacterListInteractorTestObject :  CharacterListInteractor {
    
      
    override func getCharacterList() {
        self.model = MockUpDataModel.data
    }
}

class CharacterListInteractorTests: XCTestCase, CharacterListInteractorDelegate {
    
    var sut : CharacterListInteractor!
    var data : [BreakingBadCharacter]!
    
    func modelHasChanged(data: [BreakingBadCharacter]) {
        self.data = data
    }
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.sut = CharacterListInteractorTestObject()
        self.sut.getCharacterList()
        self.sut.delegate = self
        self.data = []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_model_propagates_from_interactor_thought_delegate() throws{
        
        var temp = MockUpDataModel.data
        temp[0].id = 124 // set dummy data
        self.sut.model = temp
        XCTAssertTrue(temp[0].id == self.data[0].id, "Data is not being propagated")
    }
    
    func test_data_no_filter() {
        self.sut.filterBySeason(season: .all)
        XCTAssert(self.data.count == 3)
    }
    
    func test_filterByNameAndSeason_SeasonOne_found() {
        self.sut.filterByNameAndSeason(searchText: "Mike", season: .two)
        XCTAssert(self.data[0].name.contains("Mike"))
    }
    
    
    func test_filterByNameAndSeason_SeasonTwo_found() {
        self.sut.filterByNameAndSeason(searchText: "Mike", season: .one)
        XCTAssert(self.data.count == 0)
    }
    
    func test_filterBySeason_seasonOne_found() {
        self.sut.filterBySeason(season: .one)
        XCTAssert(self.data[0].appearance.contains(1))
    }

    func test_filterBySeason_seasonTwo_found() {
        self.sut.filterBySeason(season: .two)
        XCTAssert(self.data[0].appearance.contains(2))
    }

}
