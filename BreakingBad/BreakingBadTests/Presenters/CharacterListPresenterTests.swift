//
//  CharacterListPresenterTests.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/26/21.
//

import XCTest
@testable import BreakingBad


class CharacterListPresenterTestObject : CharacterListPresenter{
    
    override func getCharacterList() {
        self.interactor.getCharacterList()
    }
}

class CharacterListPresenterTests: XCTestCase {

    var sut : CharacterListPresenter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let interactor = CharacterListInteractorTestObject()
        self.sut = CharacterListPresenterTestObject(interactor: interactor)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_data_propagates_from_interactor_to_presenter(){
        self.sut.getCharacterList()
        XCTAssert(self.sut.model[0].id == MockUpDataModel.data[0].id)
        XCTAssert(self.sut.model[1].id == MockUpDataModel.data[1].id)
    }
    
}
