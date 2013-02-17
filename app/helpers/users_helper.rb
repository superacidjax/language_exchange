module UsersHelper

  def user_name(u)
    first_name = u.first_name
    last_name = truncate(u.last_name, length: 2, omission: '.')
    return "#{first_name} #{last_name}"
  end
end
