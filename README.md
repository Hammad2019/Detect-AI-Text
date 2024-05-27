# Text Classifier App

This project includes a MATLAB application designed to classify text as either AI-generated or human-written. The application also features a response generator similar to what you might expect from conversational AI models like ChatGPT.

## Files

- **TextClassifierApp.mlapp**: The main MATLAB App Designer GUI file.
- **detectAIGeneratedTextNew.m**: The function that trains the SVM model to classify text.
- **generateResponse.m**: The function that generates responses similar to those produced by ChatGPT (if not embedded in the App Designer file).

## Setup and Usage

### Prerequisites

- MATLAB R2019b or later.
- The Statistics and Machine Learning Toolbox.

### Instructions

1. **Clone or Download the Repository**:
    ```sh
    git clone <repository_url>
    ```

2. **Navigate to the Project Directory**:
    Open MATLAB and navigate to the directory where the project files are located.

3. **Train the SVM Model**:
    Run `detectAIGeneratedTextNew.m` to train the SVM model on the provided datasets. You can replace the datasets with your own human-written and AI-generated text.

4. **Open the App Designer GUI**:
    Open `TextClassifierApp.mlapp` in MATLAB App Designer.

5. **Run the App**:
    Click the `Run` button in App Designer to start the application.

6. **Generate Responses**:
    The application includes a feature to generate responses similar to those produced by ChatGPT. Enter text in the provided text area and click the `Classify` button to see if the text is classified as AI-generated or human-written. Click the `Generate` button to produce a new response.

### Adding New Features

#### Generate Response Function

The `generateResponse` function is used to simulate responses from a conversational AI. It randomly selects a predefined response.

```matlab
function response = generateResponse()
    % Sample responses
    responses = {
        'Sure thing! What would you like to know?'
        'I''m here to help. What can I assist you with?'
        'Absolutely! What''s on your mind?'
        'Of course! How can I be of service?'
    };

    % Randomly select a response
    idx = randi(numel(responses));
    response = responses{idx};
end
