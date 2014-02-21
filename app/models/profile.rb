# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  sex                :string(255)
#  sexual_orientation :string(255)
#  drugs              :string(255)
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  height             :string(255)
#  body_type          :string(255)
#  diet               :string(255)
#  smokes             :string(255)
#  drinks             :string(255)
#  religion           :string(255)
#  sign               :string(255)
#  education          :string(255)
#  job                :string(255)
#  offspring          :string(255)
#  pets               :string(255)
#  likes              :text
#  latitude           :float
#  longitude          :float
#  zip_code           :integer
#  city               :string(255)
#

class Profile < ActiveRecord::Base
  attr_accessible :description, :drugs, :sex, :sexual_orientation, :user_id, :height, :body_type, :diet, :smokes, :drinks, :religion, :sign, :education, :job, :offspring, :pets, :likes, :zip_code, :latitude, :longitude, :city, :birthday, :big_photo

  #validates :zip_code, presence: true
  #validates :zip_code, numericality: true
  #validates :zip_code, length: { is: 5 }
  belongs_to :user, inverse_of: :profile,
  foreign_key: :user_id

  has_attached_file :big_photo
  validates_attachment_content_type :big_photo, :content_type => /\Aimage\/.*\Z/

  geocoded_by :zip_code
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.zip_code = geo.postal_code
    end
  end
  after_validation :geocode, :reverse_geocode

  def self.apply_filters
    current_user = User.find(12)
    filter = current_user.user_filter
    return Profile.all if filter.nil?
    #put those extra filters in for non-default e.g. filter.sex == "Everyone"
    results = Profile.where("id != ?", current_user.profile.id)

    unless filter.sex.nil? || filter.sex == "Everyone"
      results = results.where(:sex => filter.sex)
    end


    unless filter.beg_age.nil? && filter.end_age.nil?
      start_date =
      ((filter.beg_age.nil?) ? 18 : filter.beg_age).years.ago

      end_date =
      ((filter.end_age.nil?) ? 99 : filter.end_age).years.ago

      results = results.where(:birthday => end_date..start_date)
    end

    unless filter.sexual_orientation.nil? || filter.sexual_orientation == "All"
      results = results.where(:sexual_orientation => filter.sexual_orientation)
    end


    unless filter.distance.nil?
      results.reject! do |result|
        current_user.profile.distance_to(result) > filter.distance
      end
    end

    return results
  end

end
