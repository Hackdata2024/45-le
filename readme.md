# LegalEase iOS Application

## Working iOS Application Screenshot

![WhatsApp Image 2024-02-04 at 12 22 05_e5081e35](https://github.com/Hackdata2024/45-le/assets/108428995/0157d45d-7b6c-4518-99ba-3f8f54cf18e9)

## Future Product Showcase

![WhatsApp Image 2024-02-04 at 12 22 06_f786dbbd](https://github.com/Hackdata2024/45-le/assets/108428995/d6bb5efc-69bd-46ee-a515-56c151fca12d)

## Figma of Initial App Design

![image](https://github.com/Hackdata2024/45-le/assets/108428995/d582ddca-d933-41c7-ae69-830578fda5fa)

## Product Description and Presentations

![image](https://github.com/Hackdata2024/45-le/assets/108428995/eb49d8d3-7a3a-4145-9b22-b7132faaee5a)

- Video Presentation -> https://docs.google.com/presentation/d/1dg7BhhlS97OkBFreHAcjR3kqcBMoCt8d0O2C84I3K1A/edit?usp=sharing
- Detailed Presentation -> https://docs.google.com/presentation/d/1OFYNqpjnYhfGh6r2Kzjb5O3G7JShhCI_dnlD-Iflgbw/edit?usp=sharing

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

**`model training using LLM'**

****GPU Check and PyTorch Info:**
Verify GPU availability; set device accordingly.
Display CUDA status, device count, PyTorch, and CUDA versions.

**File Reading and Dataset:**
Read 'judgement' and 'summary' files; store content in lists.
Define LegalDataset using PyTorch for data tokenization and preparation.

**T5 Model Fine-Tuning:**
Load pre-trained T5 model and tokenizer
Define Adam optimizer, create dataset instances, and DataLoader.
Fine-tune T5 on the legal dataset for three epochs.
Save fine-tuned model in 'fine_tuned_legal_summarizer' directory.

**Interruption and Considerations:**
Possible KeyboardInterrupt during training loop.
Ensure ample resources for uninterrupted code execution.
Consider runtime and system capabilities.

**Model Utilization:**
Import necessary modules.
Load original and fine-tuned models, and tokenizer.
Save fine-tuned model and tokenizer.
Specify text file path and read content.
Tokenize and generate a summary using the fine-tuned model.
Decode and print the generated summary.

### Team Mates Details

- **Aman Ranjan**: Specializes in machine learning and data science, with experience in NLP and model training.
- **Megha**: A UI/UX designer and ML enthusiast, proficient in creating user-friendly app designs and working with NLP models.
- **Prince**: A backend developer with expertise in API development, database management, and server-side logic.
- **Shivam**: Specializes in machine learning and data science, with experience in NLP and model training. Focuses on app development and integration, skilled in Swift and SwiftUI for iOS development, and has a strong understanding of AI model integration.

## Conclusion

LegalEase aims to bridge the gap between complex legal documentation and user understanding by leveraging AI technology to provide clear, concise summaries and interactive chatbot functionalities. Our team's diverse skills in machine learning, app development, backend development, and UI/UX design have contributed to creating a solution that addresses a common problem in legal document processing. We believe LegalEase will significantly impact how individuals interact with and understand legal documents, making legal advice more accessible and understandable.
