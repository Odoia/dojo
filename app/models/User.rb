# frozen_string_literal: true

class User < ApplicationRecord
  def as_json
    super().merge({
                    birth_date: birth_date.strftime('%d/%m/%Y')
                  })
  end

  def age
    ((date_to - date_from) / 365).floor
  end
end
