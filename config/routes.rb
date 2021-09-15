Rails.application.routes.draw do
  # 新規登録・ログインログアウト
  devise_for :users ,controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # ゲストログイン機能ルーティング
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  #  ユーザー機能
  root to: 'homes#top'
  get 'home' => 'homes#home'
  get 'about' => 'homes#about'
  
   resources :posts, only: %i[create show edit update destroy] do
  end
end
