# frozen_string_literal: true

module LogFilesHelper
  COLOR_STATUS = { on_hold: 'dark', processing: 'primary',
                   failed: 'danger', terminated: 'success' }.freeze

  def color_status(status)
    COLOR_STATUS[status]
  end
end
