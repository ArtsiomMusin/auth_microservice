class User < Sequel::Model
  NAME_FORMAT = %r{\A\w+\z}

  def validate
    super

    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_presence :email, message: I18n.t(:blank, scope: 'model.errors.user.email')
    validates_format NAME_FORMAT, :name, message: I18n.t(:invalid, scope: 'model.errors.user.name')
  end
end
