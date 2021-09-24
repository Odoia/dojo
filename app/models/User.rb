# frozen_string_literal: true

class User < ApplicationRecord
  def as_json
    super().merge({
                    birth_date: birth_date.strftime('%d/%m/%Y')
                  })
  end
end
