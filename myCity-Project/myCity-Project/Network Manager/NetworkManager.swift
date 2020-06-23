//
//  NetworkManager.swift
//  myCity-Project
//
//  Created by Henry Calderon on 6/22/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
class NetworkManager{
    let urlSession = URLSession.shared
    var baseURL = ""
    
    func getData(){
        
    }
    
    
    enum EndPoints {
        case resources
        case otherStuff
        
        func getPath(){
            
        }
        
        func getHTTPMethod() -> String {
            return "GET"
        }
        
        func getHeaders(){
            
        }
        
        func getParams(){
            
        }
        
        func paramsToString(){
            
        }
        
    }
    
//    private func makeRequest() -> URLRequest{
//        var request = URLRequest(url: baseURL)
//        return request
//    }
    
    //MARK: Result ENUM
    enum Result<T> {
     case success(T)
     case failure(Error)
    }
    
    //MARK: Endpoint Error ENUM
    enum EndPointError: Error {
      case couldNotParse
      case noData
    }
}
