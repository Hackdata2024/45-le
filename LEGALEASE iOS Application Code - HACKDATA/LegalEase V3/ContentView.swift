import SwiftUI
import PDFKit

struct ContentView: View {
    @State private var showDocumentPicker = false
    @State private var extractedText = ""
    @State private var summaryText = "" // For displaying the summary
    @State private var userQuestion = "" // User input for chatbot
    @State private var chatbotResponse = "" // Chatbot response

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                // Upload Button
                Button(action: {
                    self.showDocumentPicker = true
                }) {
                    Text("Upload PDF Document")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                // Summary Section
                if !summaryText.isEmpty {
                    SectionView(title: "Summary", content: summaryText)

                    // Chatbot Interaction UI
                    TextField("Ask a question about the document...", text: $userQuestion)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button("Ask") {
                        Task {
                            await askChatbot()
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle())

                    if !chatbotResponse.isEmpty {
                        SectionView(title: "Chatbot Response", content: chatbotResponse)
                    }
                }

                Spacer()
            }
            .navigationTitle("LegalEase")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showDocumentPicker) {
                DocumentPicker { url in
                    Task {
                        await processPDF(at: url)
                    }
                }
            }
        }
    }

    func processPDF(at url: URL) async {
        if let text = extractText(from: url) {
            self.extractedText = text
            let summary = await GPTService.shared.generateSummary(for: extractedText)
            self.summaryText = summary
        } else {
            self.extractedText = "Unable to extract text from this PDF."
        }
    }

    func extractText(from pdfURL: URL) -> String? {
        guard let pdfDocument = PDFDocument(url: pdfURL) else { return nil }
        var extractedText = ""

        for pageIndex in 0..<pdfDocument.pageCount {
            guard let page = pdfDocument.page(at: pageIndex) else { continue }
            extractedText += page.string ?? ""
        }

        return extractedText.isEmpty ? nil : extractedText
    }

    func askChatbot() async {
        let response = await GPTService.shared.getChatbotResponse(for: userQuestion, with: extractedText)
        self.chatbotResponse = response
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct SectionView: View {
    var title: String
    var content: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.top)
            ScrollView {
                Text(content)
                    .padding()
            }
            .frame(maxHeight: 200)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
        }
    }
}
