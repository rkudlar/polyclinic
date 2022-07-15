class RecordsService
  def initialize(params)
    @status = params
  end

  def call
    return Record.all if status.blank?

    Record.where(status: @status)
  end

  private

  attr_reader :status
end
