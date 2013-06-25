class Search < ActiveRecord::Base
  attr_accessible :be_lead, :client_id, :diversity, :engagement_letter_signed_date, :equity, :fee_percent, :function, :gender, :introduced_by, :introduction, :level, :name_of_hire, :network, :new_client?, :notes, :placement_start_date, :reason_closed, :reference_num, :relocation_from, :relocation_to, :salary, :search_start_date, :signed_offer_date, :signing_bonus, :source, :status, :target_bonus_percent, :title, :placement_end_date, :new_client

  belongs_to :client
  has_many :employees, :through => :consultant_roles
  has_many :consultant_roles

  validates :reference_num, :uniqueness => true
  validates :reference_num, :client_id, :title, :search_start_date, :salary, :fee_percent, :presence => true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      search = find_by_id(row["id"]) || new
      search.attributes = row.to_hash.slice(*accessible_attributes)
      search.search_start_date = DateTime.strptime(row[6], "%m/%d/%Y") unless row[6] == nil
      search.signed_offer_date = DateTime.strptime(row[15], "%m/%d/%Y") unless row[15] == nil
      search.save!
    end
  end

  def fee_amount
    return self.fee_percent * self.salary
  end

  before_save :adjust_percents

  private
    def adjust_percents
      if self.fee_percent > 1
        self.fee_percent = self.fee_percent.to_f / 100
      end
      if self.target_bonus_percent > 1
        self.target_bonus_percent = self.target_bonus_percent.to_f / 100
      end
    end

end
