class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def after_sign_out_path_for(resource_or_scope) #devise　ログアウトした際のリダイレクト先設定　（root）
    redirect_to root_path
  end
end
