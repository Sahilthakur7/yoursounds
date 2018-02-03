class PagesController < ApplicationController
    def home
        @time = Time.now
    end
end
