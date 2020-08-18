module ApplicationHelper
    include Pagy::Frontend

    def format_duration(seconds)
        Time.at(seconds).utc.strftime("%H:%M:%S")
    end
end
