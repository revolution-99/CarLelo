class Car < ApplicationRecord
    # searchkick
    # Car.reindex
    # include Elasticsearch::Model
    # include Elasticsearch::Model::Callbacks

    after_update :notify_update

    belongs_to :user
    has_many :appointments, dependent: :destroy
    has_many :notifications, dependent: :destroy

    enum condition: {
        Fair: '0',
        Good: '1',
        Very_Good: '2',
        Excellent: '3'
    }

    validates :city, presence: true
    validates :brand, presence: true
    validates :model, presence: true
    validates :year, presence: true
    validates :variant, presence: true
    validates :state, presence: true
    validates :km, presence: true

    scope :filter_by_city, ->(city) { where city: city }
    scope :filter_by_year, ->(year) { where year: year }
    scope :filter_by_km, ->(km) { where km: km }
    scope :filter_by_brand, ->(brand) { where brand: brand }
    scope :filter_by_model, ->(model) { where model: model }
    scope :filter_by_state, ->(state) { where state: state }
    scope :filter_by_variant, ->(variant) { where variant: variant }

    def notify_update
        if saved_change_to_condition?
            appointments.each do |app|
                Notification.create(user_id: user.id, car_id: id, appointment_id: app.id, action: 'condition_updated')
            end
        end
    end
end
