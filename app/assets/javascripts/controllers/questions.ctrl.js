app.controller('QuestionsCtrl', ['Question', 'action', function (Question, action) {
    var ctrl = this;

    // Код отработает только для  '/questions'
    action('index', function(){
        ctrl.posts = Question.query();
    });

    // Вызовется для паттерна '/questions/:id'
    action('show', function (params){
        ctrl.post = Question.get({id: params.id});
    });

    // Только для '/questions/new'
    action('new', function(){
        ctrl.post = Question.new();
        ctrl.save = Question.create;
    });

    // Для паттерна '/questions/:id/edit'
    action('edit', function (params){
        ctrl.post = Question.edit({id: params.id});
        ctrl.save = Question.update;
    });

    action(['index', 'edit', 'show'], function () {
        ctrl.destroy = function (question) {
            Question.destroy({id: question.id}, function () {
                ctrl.questions = _.select(ctrl.questions, function (_question) {
                    return _question.id !== question.id;
                });
            });
        };
    });
}]);