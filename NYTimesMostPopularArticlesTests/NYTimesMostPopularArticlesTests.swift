//
//  NYTimesMostPopularArticlesTests.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Farhan Khan on 26/05/2021.
//

import XCTest
@testable import NYTimesMostPopularArticles

class NYTimesMostPopularArticlesTests: XCTestCase {

    // FILES can be found in Supporting Files -> Data Response JSON Model Folder
    // MARK: - Empty JSON
    func testEmptyResponse() throws {
        
        guard
            let path = Bundle.main.path(forResource: "emptyResponse", ofType: "json")
            else { fatalError("Can't find search.json file") }
        
            let data =  try Data(contentsOf: URL(fileURLWithPath: path))
        do {

            let result = try JSONDecoder().decode(PopularArticlesModelBase.self, from: data)
            XCTAssertNoThrow(result)
        }
        catch let DecodingError.dataCorrupted(context) {
            print(XCTestExpectation(description: "Data corrupted: \(context.debugDescription)"))
        } catch let DecodingError.keyNotFound(key, context) {
            let message = "Key '\(key)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.valueNotFound(value, context) {
            let message = "Value '\(value)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.typeMismatch(type, context)  {
            let message = "Type '\(type)' mismatch: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    // FILES can be found in Supporting Files -> Data Response JSON Model Folder
    // MARK: - JSON with no Articles
    func testResponseWithNoArticles() throws {
        
        guard
            let path = Bundle.main.path(forResource: "responseWithNoArticles", ofType: "json")
        else { fatalError("Can't find search.json file") }
        let data =  try Data(contentsOf: URL(fileURLWithPath: path))
        do {
            
            let result = try JSONDecoder().decode(PopularArticlesModelBase.self, from: data)
            XCTAssertNoThrow(result)
        }
        catch let DecodingError.dataCorrupted(context) {
            print(XCTestExpectation(description: "Data corrupted: \(context.debugDescription)"))
        } catch let DecodingError.keyNotFound(key, context) {
            let message = "Key '\(key)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.valueNotFound(value, context) {
            let message = "Value '\(value)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.typeMismatch(type, context)  {
            let message = "Type '\(type)' mismatch: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    // FILES can be found in Supporting Files -> Data Response JSON Model Folder
    // MARK: - Media Object Missing
    
    func testResponseWithNoMedia() throws {
        
        guard
            let path = Bundle.main.path(forResource: "responseWithNoMedia", ofType: "json")
        else { fatalError("Can't find search.json file") }
        
        let data =  try Data(contentsOf: URL(fileURLWithPath: path))
        do {
            let result = try JSONDecoder().decode(PopularArticlesModelBase.self, from: data)
            XCTAssertNoThrow(result)
        }
        catch let DecodingError.dataCorrupted(context) {
            print(XCTestExpectation(description: "Data corrupted: \(context.debugDescription)"))
        } catch let DecodingError.keyNotFound(key, context) {
            let message = "Key '\(key)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.valueNotFound(value, context) {
            let message = "Value '\(value)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.typeMismatch(type, context)  {
            let message = "Type '\(type)' mismatch: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    // FILES can be found in Supporting Files -> Data Response JSON Model Folder
    // MARK: -  WRONG OBJECT JSON
    func testResponseWithArticleObjectInsteadOfArray() throws {
        
        guard
            let path = Bundle.main.path(forResource: "responseWithArticleObject", ofType: "json")
        else { fatalError("Can't find search.json file") }
        
        let data =  try Data(contentsOf: URL(fileURLWithPath: path))
        do {
            let result = try JSONDecoder().decode(PopularArticlesModelBase.self, from: data)
            XCTAssertNoThrow(result)
        }
        catch let DecodingError.dataCorrupted(context) {
            print(XCTestExpectation(description: "Data corrupted: \(context.debugDescription)"))
        } catch let DecodingError.keyNotFound(key, context) {
            let message = "Key '\(key)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.valueNotFound(value, context) {
            let message = "Value '\(value)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.typeMismatch(type, context)  {
            let message = "Type '\(type)' mismatch: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    // FILES can be found in Supporting Files -> Data Response JSON Model Folder
    // MARK: - Wrong DATATYPES JSON
    
    func testResponseWithWrongDataTypes() throws {
        
        guard
            let path = Bundle.main.path(forResource: "responseWithWrongValues", ofType: "json")
        else { fatalError("Can't find search.json file") }
        
        let data =  try Data(contentsOf: URL(fileURLWithPath: path))
        do {
            
            let result = try JSONDecoder().decode(PopularArticlesModelBase.self, from: data)
            XCTAssertNoThrow(result)
        }
        catch let DecodingError.dataCorrupted(context) {
            print(XCTestExpectation(description: "Data corrupted: \(context.debugDescription)"))
        } catch let DecodingError.keyNotFound(key, context) {
            let message = "Key '\(key)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.valueNotFound(value, context) {
            let message = "Value '\(value)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.typeMismatch(type, context)  {
            let message = "Type '\(type)' mismatch: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    // FILES can be found in Supporting Files -> Data Response JSON Model Folder
    // MARK: - VALID JSON RESPONSE
    func testWithValidResponse() throws {
        
        guard
            let path = Bundle.main.path(forResource: "mostPopularResponse", ofType: "json")
        else { fatalError("Can't find search.json file") }
        
        let data =  try Data(contentsOf: URL(fileURLWithPath: path))
        do {
            
            let result = try JSONDecoder().decode(PopularArticlesModelBase.self, from: data)
            XCTAssertNoThrow(result)
        }
        catch let DecodingError.dataCorrupted(context) {
            print(XCTestExpectation(description: "Data corrupted: \(context.debugDescription)"))
        } catch let DecodingError.keyNotFound(key, context) {
            let message = "Key '\(key)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.valueNotFound(value, context) {
            let message = "Value '\(value)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch let DecodingError.typeMismatch(type, context)  {
            let message = "Type '\(type)' mismatch: \(context.debugDescription), codingPath: \(context.codingPath)"
            print(XCTestExpectation(description: message))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
