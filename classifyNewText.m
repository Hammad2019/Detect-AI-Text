% Function to classify new text
function label = classifyNewText(SVMModel, newText)
    newTextFeatures = extractFeatures({newText});
    [predictedLabel, ~] = predict(SVMModel, newTextFeatures);
    label = predictedLabel;
end