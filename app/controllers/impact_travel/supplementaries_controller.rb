module ImpactTravel
  class SupplementariesController < ImpactTravel::ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def index
      @supplementaries = ImpactTravel::Supplementary.all
    end

    def new
      @supplementary = ImpactTravel::Supplementary.new
    end

    def create
      create_supplementary || render_with_error(
        :new, message: I18n.t("supplementary.invalid")
      )
    end

    private

    def create_supplementary
      if new_supplementary.save
        redirect_to(
          supplementaries_path, notice: I18n.t("supplementary.created")
        )
      end
    end

    def new_supplementary
      @supplementary = ImpactTravel::Supplementary.new(supplementary_params)
    end

    def supplementary_params
      params.require(:supplementary).permit(
        :email, :phone, :first_name, :last_name
      )
    end
  end
end
