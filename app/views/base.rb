require "phlex/rails"

class Phlex::Component
  alias_method :safe_expr_append=, :raw
end

module Views
  class Base < Phlex::Component
    include ActionView::Helpers::AssetUrlHelper
    include ActionView::RecordIdentifier
  end
end
