class DoctorsService
  def initialize(params)
    @category_id = params
  end

  def call
    return Doctor.all if category_id.blank?

    Doctor.where(category_id: @category_id)
  end

  private

  attr_reader :category_id
end
