//
//  FetchData.swift
//  Jokes
//
//  Created by Fernando De Leon on 11/8/2022.
//

import Foundation

enum FetchDataError: Error {
    case urlWrongError
    
}

struct FetchData {
    
    func fetch() async throws -> Jokes {
        var jokes: Jokes = Jokes();
        var components:URLComponents = URLComponents();
        components.scheme = "https";
        components.host = "icanhazdadjoke.com";
        components.path = "/search";
        print("the endpoint is -> \(components.string!)");
        guard
            let url = components.url
        else {
            print("Error in url");
            throw FetchDataError.urlWrongError;
        }
        var request = URLRequest(url: url);
        request.setValue("application/json",forHTTPHeaderField:"accept");
        request.httpMethod = "GET";
        guard let ourHeaderAccept = request.value(forHTTPHeaderField: "accept") else { throw FetchDataError.urlWrongError; }
        print("our accept header is \(ourHeaderAccept)")
       
        let (data, httpResponse) = try await URLSession.shared.data(for: request);
        
        jokes = try JSONDecoder().decode(Jokes.self,from:data);
        print("The data we got is --> \(jokes.results)");
        return jokes;
        
    }
}
