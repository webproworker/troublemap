Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :twitter, "SeBJ80o5959lNHPgF9iNw", "4lodifg1jjW3iQlIRNsM4YFYAbwZ4rMi0b6hcsfLk"
  provider :facebook, ENV['SeBJ80o5959lNHPgF9iNw'], ENV['4lodifg1jjW3iQlIRNsM4YFYAbwZ4rMi0b6hcsfLk']
end