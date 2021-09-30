$(() => {
    const validationRules: SemanticUI.FormSettings.Param['fields'] = {
        text: {
            identifier: 'answer[text]',
            rules: [
                {
                    type: 'empty',
                    prompt: 'Text of your message can\'t be empty'
                }
            ],
        },
        tags: {
            identifier: 'answer[tags]',
            rules: [],
        },
    };

    $('.ui.form').form({
        fields: validationRules,
        inline: true,
        on: 'blur'
    });
});