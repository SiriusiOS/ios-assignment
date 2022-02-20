//
//  ios_assignmentTests.swift
//  ios-assignmentTests
//
//  Created by Nguyen Ngoc Diep on 2022/02/19.
//

import XCTest
@testable import ios_assignment

class ios_assignmentTests: XCTestCase {

    var viewModel: CitiesViewModel!
    static var cities = [CityEntity]()
    override func setUpWithError() throws {
        viewModel = CitiesViewModelImpl(model: CitiesModel(), citiStore: AppDependencies.cityStore)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    //what need to test
    //1. call api => count
    func testGetCities() {
        let promise = expectation(description: "Completion handler invoked")
        viewModel.didGetCities = { cities in
            XCTAssertNotEqual(cities.count, 0)
            ios_assignmentTests.cities = cities
//            XCTAssertNotEqual(cities.count, 209557)
            promise.fulfill()
        }
        viewModel.getCities()
        wait(for: [promise], timeout: 30)
    }
    
    //2. search with some word => expect result
    func testSearchResult() {
        guard ios_assignmentTests.cities.count > 0 else {
            print("Diepnn")
            return
        }
        let promise = expectation(description: "Completion handler invoked")
        viewModel.model.cities = ios_assignmentTests.cities
        viewModel.didGetCities = { cities in
            XCTAssertNotEqual(cities.count, 0)
            XCTAssertNotNil(cities.first(where: {$0.country == "AU"}))
            promise.fulfill()
        }
        viewModel.searchCities(text: "AU")
        wait(for: [promise], timeout: 30)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
