require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/team' do
        @team = Team.new(params[:team])

        params[:team][:members].each do |hero_deets|
            Member.new(hero_deets)
        end
        @hero_one = Member.all[0]
        @hero_two = Member.all[1]
        @hero_three = Member.all[2]
        erb :team
    end


end
