FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "name #{n}"}
    sequence(:email) { |n| "name_#{n}@example.com"}
    password "foobar23"
    password_confirmation "foobar23"
  end

  factory :client do
    sequence(:name) { |n| "Client #{n}"}                
    sequence(:fullname) { |n| "Client #{n} fullname"}
    ruc {"J#{rand(10 ** 10)}18C"}           
    sequence (:legalrepresentative) { |n| "Legal Representantive #{n}" }
    sequence(:address) { |n| "Address #{n}"}
    web                 "http://www.example.com"
    description         "Some random description"

    user
  end

  factory :segmento do
    sequence(:name) { |n| "segmento #{n}"}
  end

  factory :tipo_contribuyente do
    sequence(:name) { |n| "Tipo Contribuyente #{n}"}
  end
end