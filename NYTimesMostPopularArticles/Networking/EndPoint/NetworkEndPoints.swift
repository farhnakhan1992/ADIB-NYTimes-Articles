//
//  NetworkEndPoints.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 26/05/2021.
//



import Foundation


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum NYTApi {

    case mostPopularArticles
 
    
}

extension NYTApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.nytimes.com/svc/mostpopular/v2"
        case .qa: return "https://api.nytimes.com/svc/mostpopular/v2"
        case .staging: return "https://api.nytimes.com/svc/mostpopular/v2"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .mostPopularArticles:
        return "/mostviewed/all-sections/7.json"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .mostPopularArticles:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api-key":NetworkManager.NYTimesAPIKey])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


