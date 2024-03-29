class Ability
  include CanCan::Ability

  def initialize(user)
        can :read, :all
        if user.present?
          can :manage, [Question, Answer, Tag, Like], author_id: user.id
          if user.admin?
            can :manage, :all
          end
        end

        # Load addition permission rules from database
        user_permissions = user and user.permissions
        common_permissions = Permission.where(user_id: nil)
        can do |action, subject_class, subject|
          common_permissions.any? do |permission|
            permission.allow_subject_class == subject_class.to_s && permission.check_for_subject(subject)
          end or
          (user_permissions && user_permissions.find_by(action: aliases_for_action(action)) or []).any? do |permission|
            permission.allow_subject_class == subject_class.to_s && permission.check_for_subject(subject) &&
                (subject.nil? || permission.user_id == subject.author.id)
          end
        end
        cannot do |action, subject_class, subject|
          common_permissions.any? do |permission|
            permission.disallow_subject_class == subject_class.to_s && permission.check_for_subject(subject)
          end or
          (user_permissions && user_permissions.find_by(action: aliases_for_action(action)) || []).any? do |permission|
            permission.disallow_subject_class == subject_class.to_s && permission.check_for_subject(subject) &&
                (subject.nil? || permission.user_id == subject.author.id)
          end
        end
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
