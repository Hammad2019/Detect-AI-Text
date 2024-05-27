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
