module ApplicationHelper

  # If I own an object that often want to edit it.
  def i_own?(object)
    if(current_user.present? and object.user.present? and object.user.id.present? and (current_user.id == object.user.id))
      true
    else
      false
    end
  end # def i_own?(object)

  # In production I want users talking to https://hackternoon.herokuapp.com
  def sslhost
    if ENV['RAILS_ENV'] == 'production'
      "https://hackternoon.herokuapp.com"
    else
      ""
    end
  end # def sslhost
end
