import Foundation

class GPTService {
    static let shared = GPTService()
    private init() {}

    private let apiKey = "API KEY REDACTED FOR GITHUB COMMIT, FOR HACKADATA"
    private let session = URLSession.shared

    func generateSummary(for text: String) async -> String {
        let endpoint = "https://api.openai.com/v1/completions"
        guard let url = URL(string: endpoint) else {
            return "Invalid URL"
        }

        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]

        let body: [String: Any] = [
            "model": "text-davinci-003", // Consider updating to the latest model available
            "prompt": "Create a concise, user-friendly summary of the following legal document:\n\(text)",
            "max_tokens": 3000,
            "temperature": 0.7
        ]

        do {
            let requestBody = try JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = requestBody

            let (data, _) = try await session.data(for: request)
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
               let choices = json["choices"] as? [[String: Any]],
               let firstChoice = choices.first,
               let summary = firstChoice["text"] as? String {
                return summary
            } else {
                return "Failed to parse summary"
            }
        } catch {
            return "Network or parsing error: \(error.localizedDescription)"
        }
    }

    func getChatbotResponse(for userInput: String, with context: String) async -> String {
        let endpoint = "https://api.openai.com/v1/completions"
        guard let url = URL(string: endpoint) else {
            return "Invalid URL"
        }

        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]

        let body: [String: Any] = [
            "model": "text-davinci-003", // Consider updating to the latest model available
            "prompt": "Based on this legal document: \(context)\n\nUser: \(userInput)\nAI:",
            "max_tokens": 150,
            "temperature": 0.7
        ]

        do {
            let requestBody = try JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = requestBody

            let (data, _) = try await session.data(for: request)
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
               let choices = json["choices"] as? [[String: Any]],
               let firstChoice = choices.first,
               let responseText = firstChoice["text"] as? String {
                return responseText
            } else {
                return "Failed to parse chatbot response"
            }
        } catch {
            return "Network or parsing error: \(error.localizedDescription)"
        }
    }
}
