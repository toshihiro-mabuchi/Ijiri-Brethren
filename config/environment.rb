# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# paginate
# 記号（ < と > ）も入るので不要なら消す。
WillPaginate::ViewHelpers.pagination_options[:previous_label] = '前'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '次'
