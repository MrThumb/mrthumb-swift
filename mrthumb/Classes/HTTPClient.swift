//
//  HTTPClient.swift
//  Pods
//
//  Created by Martín Fernández on 11/28/16.
//
//

import Foundation

internal class HTTPClient {

    private let session = URLSession(configuration: URLSessionConfiguration.default)
    let configuration: Configuration

    init(withConfiguration configuration: Configuration) {
        self.configuration = configuration
    }

    public func post(to path: String, parameters: Any, completion: @escaping (Bool, Data?) -> ()) -> () {
        let request = NSMutableURLRequest(
            url: self.url(forPath: path)
        )

        self.perform(request: request, method: "POST", parameters:  parameters, completion: completion)

    }

    public func perform(request: MutableURLRequest, method: String, parameters: Any,
                        completion: @escaping (Bool, Data?) -> ()) {
        request.httpMethod = method
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.sign(withAccessIdentifier: self.configuration.accessId, andSecret: self.configuration.secretId)

        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                completion(true, data)
            } else {
                completion(false, nil)
            }
        }.resume()
    }

    private func url(forPath path: String) -> URL {
        return URL(string: "http://192.168.0.109:3000" + path)!
    }

}
