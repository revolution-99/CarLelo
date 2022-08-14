module ApplicationHelper
    def optionsMap
        optionsMap = {
            'Risk of harm': [
            'Physical Harm', 
            'Psychological distress or discomfort', 
            'Social disadvantage', 
            'Harm to participants', 
            'Financial status', 
            'Privacy'
            ],
            'Informed consent': [
            'Explanation of research', 
            "Explanation of participant's role in research"
            ],
            'Anonymity and Confidentiality': [
            'Remove identifiers', 'Use proxies', 'Disclosure for limited purposes'
            ],
            'Deceptive practices': [
            'Feasibility'
            ],
            'Right to withdraw': [
            'Right to withdraw from participation in the project'
            ]
        };
    end
end
