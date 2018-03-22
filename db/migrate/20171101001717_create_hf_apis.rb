class CreateHfApis < ActiveRecord::Migration[5.1]

  class HappyFoxAPI
    include HTTParty
    base_uri 'http://avatarfleet.happyfox.com/api/1.1/json'

    def initialize(u, p)
      @auth = { :username => 'fea750e8cae545ca89f1fcf34ab972cb',
               :password => 'e8dd80d5095540049e89f9f9f64b2b2a' }
    end

    def get_new
      options.merge!({:basic_auth => @auth})
      self.class.get('#{base_uri}/tickets/?show_updates=0')
    end
  end
end
