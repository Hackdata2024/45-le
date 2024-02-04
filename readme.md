# LegalEase iOS Application


### Team

- **Aman Ranjan**
  - Role: ML Model Training
  - Contributions: Trained ML model using Large Language Models (LLMs), worked on the presentation (PPT).
- **Megha**
  - Role: ML Model Training
  - Contributions: Trained ML model using LLMs, designed Figma app pages.
- **Prince**
  - Role: Backend Development
  - Contributions: Implemented backend functionalities, worked on the presentation (PPT).
- **Shivam**
  - Role: Integration and App Development
  - Contributions: Integrated the model and implemented the chatbot, developed Swift app generation.

### Tech Used

- **Languages and Frameworks**: Python, Swift
- **Design Tool**: Figma
- **Libraries**: Felt (UI/UX design), Torch (PyTorch for machine learning), Transformers (Hugging Face library for NLP), BERT (for NLP tasks)
- **Platforms**: iOS (SwiftUI for UI, CoreData for local persistence)

### Idea Description

LegalEase is an innovative AI-powered tool designed to simplify the process of understanding complex legal documents, such as contracts, loans, and real estate agreements. It translates legal jargon into concise, easy-to-understand summaries by allowing users to upload images or PDFs of legal documents. Furthermore, LegalEase enhances user interaction through an integrated chatbot, enabling users to ask specific questions about the document and receive instant, understandable responses. This not only saves time but also empowers users with the clarity and confidence required for informed decision-making in critical legal matters.

### How to Run the Project

1. **Clone the Repository**
   - Clone the LegalEase project repository to your local machine.

2. **Install Dependencies**
   - Navigate to the project directory in the terminal and install the required dependencies using CocoaPods or Swift Package Manager.

3. **Open the Project**
   - Open the `LegalEase.xcodeproj` file in Xcode.

4. **Run the Application**
   - Select a target device or simulator and run the application by pressing the play button or `Cmd + R`.

### Core Code Explanation

**`iOS Applicarion`**

- **`LegalEaseApp.swift`**: This is the entry point of the iOS application, where the main app structure and the persistence controller are defined. It sets up the initial view that the user sees upon launching the app.
  
- **`Persistence.swift`**: Manages the local data persistence using CoreData, allowing the app to save and retrieve user data efficiently. This setup includes a container for CoreData entities and ensures that changes are merged from the parent context automatically.
  
- **`ContentView.swift`**: The main interface of the app, presenting the upload button for PDF documents, displaying summaries, and facilitating user interaction with the chatbot. It leverages SwiftUI for a declarative UI approach.
  
- **`NetworkManager.swift` and `GPTService.swift`**: Handle network requests to external APIs for generating summaries and chatbot responses. They encapsulate the logic for sending requests and parsing responses.

### Team Mates Details

- **Aman Ranjan**: Specializes in machine learning and data science, with experience in NLP and model training.
- **Megha**: A UI/UX designer and ML enthusiast, proficient in creating user-friendly app designs and working with NLP models.
- **Prince**: A backend developer with expertise in API development, database management, and server-side logic.
- **Shivam**: Specializes in machine learning and data science, with experience in NLP and model training. Focuses on app development and integration, skilled in Swift and SwiftUI for iOS development, and has a strong understanding of AI model integration.

## Conclusion

LegalEase aims to bridge the gap between complex legal documentation and user understanding by leveraging AI technology to provide clear, concise summaries and interactive chatbot functionalities. Our team's diverse skills in machine learning, app development, backend development, and UI/UX design have contributed to creating a solution that addresses a common problem in legal document processing. We believe LegalEase will significantly impact how individuals interact with and understand legal documents, making legal advice more accessible and understandable.