//
//  NetworkManager.swift
//  LegalEase
//
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func sendRequest(url: URL, method: String, headers: [String: String], body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        request.httpBody = body

        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
}
