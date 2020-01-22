require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest

class SQLObject
  def self.columns    
    return @column if @column 
    @column = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL
    @column = @column.first.map{|col| col.to_sym}
  end

  def self.table_name=(table_name)          
    @table_name = table_name
  end

  def self.table_name
    @table_name = "#{self.to_s.downcase}" + "s"
  end

  def self.all
    # ...
    data = DBConnection.execute(<<-SQL) 
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    
    self.parse_all(data)

  end

  def self.parse_all(results)
    # ...
    results.map {|result| self.new(result)}
  end

  def self.find(id)
    # ...
    find_data = DBConnection.execute(<<-SQL, id).first
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = ?
    SQL

    return nil if find_data.nil?
    self.new(find_data)
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column){ self.attributes[column]}
      define_method("#{column}=") do |val| 
          self.attributes[column]=val
      end
    end
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      raise "unknown attribute '#{attr_name}'" if !(self.class.columns.include?(attr_name))
      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}

  end

  def attribute_values
    # ...
    self.attributes.values
  end

  def insert
    # ...
    col_names = self.class.columns.join(",")
    question_marks = (["?"] * self.class.columns.length).join(",")
    col_values = self.attribute_values
    # p col_values
    # p question_marks
    data = DBConnection.execute(<<-SQL, *col_values) 
      INSERT INTO
        #{self.class.table_name} #{col_names}
      VALUES
        #{question_marks}
    SQL

  end

  def update
    # ...
  end

  def save
    # ...
  end
end
