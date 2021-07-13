class Api::V1::ApplicationController < Api::ApplicationController

  def paginate(scope:, default_per_page: 20, collection_key: nil)
    collection = scope.page(params[:page]).per((params[:per_page] || default_per_page).to_i)
    collection_key ||= collection.table_name
    current, total, per_page = collection.current_page, collection.total_pages, collection.limit_value

    return {
      collection_key.to_sym => collection,
      pagination: {
        current:  current,
        previous: (current > 1 ? (current - 1) : nil),
        next:     (current == total ? nil : (current + 1)),
        per_page: per_page,
        pages:    total,
        count:    collection.total_count
      },
    }
  end
end
