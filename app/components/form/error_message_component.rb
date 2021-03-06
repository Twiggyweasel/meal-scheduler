class Form::ErrorMessageComponent < ViewComponent::Base
  def initialize(object: nil)
    @object = object
  end

  private 

  attr_reader :object

  def render?
    object.errors.any?
  end
end
