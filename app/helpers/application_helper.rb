module ApplicationHelper
    def format_duration(seconds)
        Time.at(seconds).utc.strftime("%H:%M:%S")
    end
end
