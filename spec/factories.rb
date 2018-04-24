FactoryBot.define do
  factory(:user) do
    email('name@gmail.com')
    password('password')
    password_confirmation('password')
  end

  factory(:question) do
    question('Why is the sky blue?')
    association :user, factory: :user, strategy: :create
  end

  # factory(:response) do
  #   response('Light refraction.')
  #   user
  #   association :user, factory
  # end
end
