class TotalsController < ApplicationController
    before_action :authenticate_user!

    def index
        @pagy, @totals = pagy(current_user.totals.ordered)
    end
end
