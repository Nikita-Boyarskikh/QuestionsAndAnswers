$(() => {
    const validationRules: SemanticUI.FormSettings.Param['fields'] = {
        text: {
            identifier: 'question[text]',
            rules: [
                {
                    type: 'empty',
                    prompt: 'Text of your question can\'t be empty'
                }
            ],
        },
        tags: {
            identifier: 'question[tags]',
            rules: [],
        },
        title: {
            identifier: 'question[title]',
            rules: [
                {
                    type: 'empty',
                    prompt: 'Question title must have a value'
                },
                {
                    type: 'minLength[3]',
                    prompt: 'Question title must be at least 3 characters'
                },
            ],
        }
    };

    $('.ui.form').form({
        fields: validationRules,
        inline: true,
        on: 'blur'
    });
});