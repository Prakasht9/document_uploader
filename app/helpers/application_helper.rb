module ApplicationHelper
  def bootstrap_paginate data
    will_paginate data, renderer: WillPaginate::ActionView::Bootstrap4LinkRenderer, class: 'my-4 justify-content-between'
  end
end
