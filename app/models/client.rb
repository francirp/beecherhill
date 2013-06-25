class Client < ActiveRecord::Base
  attr_accessible :employees, :industry, :name, :ownership, :revenue, :state

  has_many :searches

  def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        Client.create! row.to_hash
      end
  end

end
