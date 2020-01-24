require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    params_key = params.keys.map {|key|"#{key} = ?"}.join(" AND ")
    params_val = params.values
    data = DBConnection.execute(<<-SQL, *params_val) 
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{params_key}
    SQL
    parse_all(data)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
