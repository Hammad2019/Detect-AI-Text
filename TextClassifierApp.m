classdef TextClassifierApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        TextAreaLabel     matlab.ui.control.Label
        TextArea          matlab.ui.control.TextArea
        ClassifyButton    matlab.ui.control.Button
        ResultLabel       matlab.ui.control.Label
    end
    
    properties (Access = private)
        SVMModel % Trained SVM model
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Modified button pushed function: ClassifyButton
        function ClassifyButtonPushed(app, event)
            % Convert input text to string scalar
            newText = string(app.TextArea.Value);
            
            % Classify text
            predictedLabel = classifyNewText(app.SVMModel, newText);
            
            % Update result label
            if predictedLabel == 1
                app.ResultLabel.Text = 'Predicted: AI-generated';
            else
                app.ResultLabel.Text = 'Predicted: Human-written';
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 500 300];
            app.UIFigure.Name = 'Text Classifier App';

            % Create TextAreaLabel
            app.TextAreaLabel = uilabel(app.UIFigure);
            app.TextAreaLabel.HorizontalAlignment = 'right';
            app.TextAreaLabel.Position = [20 220 100 22];
            app.TextAreaLabel.Text = 'Enter Text:';

            % Create TextArea
            app.TextArea = uitextarea(app.UIFigure);
            app.TextArea.Position = [135 160 330 100];

            % Create ClassifyButton
            app.ClassifyButton = uibutton(app.UIFigure, 'push');
            app.ClassifyButton.ButtonPushedFcn = createCallbackFcn(app, @ClassifyButtonPushed, true);
            app.ClassifyButton.Position = [200 100 100 30];
            app.ClassifyButton.Text = 'Classify';

            % Create ResultLabel
            app.ResultLabel = uilabel(app.UIFigure);
            app.ResultLabel.HorizontalAlignment = 'center';
            app.ResultLabel.Position = [150 50 200 22];
            app.ResultLabel.Text = '';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = TextClassifierApp

            % Create UIFigure and components
            createComponents(app)
            
            % Train or load the model
            app.SVMModel = detectAIGeneratedTextNew();
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
    methods (Access = private)

    % Button pushed function: GenerateButton
    function GenerateButtonPushed(app, event)
        % Call the function to generate a response
        response = generateResponse();
        
        % Update the GUI component to display the response
        app.ResponseLabel.Text = response;
    end
end

methods (Access = private)
    % Define the generateResponse function
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
end
end
