# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:4200', 'https://bsc-ember.herokuapp.com'

    # resource '/users*',
    #   headers: :any,
    #   methods: [:get, :post, :patch, :delete, :put, :options, :head]
      
    # resource '/products*',
    #   headers: :any,
    #   methods: [:get, :post, :patch, :delete, :put, :options, :head]

    # resource '/categories*',
    #   headers: :any,
    #   methods: [:get, :post, :patch, :delete, :put, :options, :head]

    # resource '/pictures*',
    #   headers: :any,
    #   methods: [:get, :post, :delete,  :options, :head]

    # resource '/orders*',
    #   headers: :any,
    #   methods: [:get, :post, :patch, :delete, :put, :options, :head]
      
    # resource '/order_lines*',
    #   headers: :any,
    #   methods: [:get, :post, :patch, :delete, :put, :options, :head]

    # resource '/answers*',
    #   headers: :any,
    #   methods: [:get, :post, :patch, :delete, :put, :options, :head]

    # resource '/questions*',
    #   headers: :any,
    #   methods: [:get, :post, :patch, :delete, :put, :options, :head]

    # resource '/user_answers*',
    #   headers: :any,
    #   methods: [:get, :post, :patch, :delete, :put, :options, :head]

    resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :delete, :put, :options, :head]
  end
end
