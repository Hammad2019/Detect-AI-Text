% Feature extraction function
function features = extractFeatures(texts)
    numTexts = length(texts);
    features = zeros(numTexts, 3); % Adjust number of features as needed

    for i = 1:numTexts
        text = texts{i};
        words = strsplit(text);
        numWords = length(words);
        wordLengths = cellfun(@length, words);
        avgWordLength = mean(wordLengths);
        
        sentences = strsplit(text, {'.', '!', '?'});
        sentenceLengths = cellfun(@(x) length(strsplit(x)), sentences);
        avgSentenceLength = mean(sentenceLengths);
        
        uniqueWords = unique(words);
        vocabRichness = length(uniqueWords) / numWords;
        
        features(i, :) = [avgWordLength, avgSentenceLength, vocabRichness];
    end
end