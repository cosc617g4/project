class Post < ActiveRecord::Base
  
  def self.columns() @columns ||= []; end
 
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end
  
  column :updated_at, :date
  column :message, :string
  column :photo_file_name, :string
  #attr_accessible :updated_at, :message, :photo_file_name
end
