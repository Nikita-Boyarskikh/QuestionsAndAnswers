$(() => {
    const validationRules: SemanticUI.FormSettings.Param['fields'] = {
        email: {
            identifier: 'email',
            rules: [
                {
                    type: 'empty',
                    prompt: 'Email must have a value'
                },
                {
                    type: 'email',
                    prompt: 'Email has incorrect format'
                },
            ],
        },
        nickname: {
            identifier: 'nickname',
            rules: [
                {
                    type: 'empty',
                    prompt: 'Nickname must have a value'
                },
                {
                    type: 'regex[/^[^0-9]\\w+$/i]',
                    prompt: 'Nickname can contents only letters and underscores'
                },
            ],
        },
        fullname: {
            identifier: 'fullname',
            rules: [
                {
                    type: 'empty',
                    prompt: 'Full name must have a value'
                },
            ],
        },
        password: {
            identifier: 'password',
            rules: [
                {
                    type: 'empty',
                    prompt: 'Password must have a value'
                },
                {
                    type: 'minLength[8]',
                    prompt: 'Password is too short. It must contains at list 8 characters'
                },
            ],
        },
        password_confirmation: {
            identifier: 'password_confirmation',
            rules: [
                {
                    type: 'match[password]',
                    prompt: 'Passwords did not match'
                },
            ],
        },
        avatar: {
            identifier: 'avatar',
            rules: [],
        },
    };

    console.log(validationRules);

    $('.ui.form').form({
        fields: validationRules,
        inline: true,
        on: 'blur'
    });
});