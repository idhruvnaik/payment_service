module RequestValidation
  extend ActiveSupport::Concern

  def validate_params(keys = [])
    mising_keys = keys.select { |key| !params.key?(key.to_s) }
    if mising_keys.any?
      render_error({}, "Mising parameters : #{mising_keys.join(", ")}", :bad_request)
      return false
    end

    return true
  end
end
