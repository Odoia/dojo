# frozen_string_literal: true

class User < ApplicationRecord

  def as_json
    super().merge({
                    birth_date: birth_date.strftime('%d/%m/%Y'),
                    age: age
                  })
  end

  def age
    ((Date.today - birth_date) / 365).floor.to_s
  end
end
