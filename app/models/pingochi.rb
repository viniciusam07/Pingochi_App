class Pingochi < ApplicationRecord
  belongs_to :user
  has_many :inventories
  has_many :battles_as_pingochi1, foreign_key: :pingochi1_id, class_name: "Battle"
  has_many :battles_as_pingochi2, foreign_key: :pingochi2_id, class_name: "Battle"
  has_many :battles_as_pingochi_winner, foreign_key: :pingochi_winner_id, class_name: "Battle"
  has_many :matings_as_pingochi1, foreign_key: :pingochi1_id, class_name: "Mating"
  has_many :matings_as_pingochi2, foreign_key: :pingochi2_id, class_name: "Mating"

  # Cannot create a new `Pingochi` without a `name`
  validates :name, presence: true

  # Cannot create two pingochis with the same `nft`
  validates :nft, uniqueness: true

  # `name` has to be between 6 and 20 characters
  validates :name, length: { in: 6..20 }

  # genders
  validates :gender, inclusion: { in: %w(male female) }

  # energy status
  validates :energy, numericality: { only_integer: true, in: %w(0..100) }

  before_create :set_nft
  before_create :set_gender

  after_create :set_inventory

  before_create :set_gender

  SPECIES = ["King Penguin", "Humboldt Penguin", "Emperor Penguin", "Blue Penguin", "Adelie Penguin", "Yellow eyed Penguin"]

  def slap
    self.energy -= 10
    self.save
    if self.energy.zero?
      self.uti
    end
  end

  def fish
    self.energy -= 10
    self.save
    if self.energy.zero?
      self.uti
    end
    fishcoin_collected = rand(1..10).to_i
    old_balance = user.wallet.fishcoin_amount.to_i
    new_balance = old_balance + fishcoin_collected
    Wallet.update(fishcoin_amount: new_balance)
  end

  def feed
    self.energy += 20
    if self.energy > 100
      self.energy = 100
      self.save
    end
    self.save
  end

  def sleep
    self.energy = 100
    self.slept_at = DateTime.current
    self.save
  end

  def sleep?
    self.slept_at.present? && self.slept_at > DateTime.current - 10.minutes
  end

  def uti
    if self.energy.zero?
      self.uti_at = DateTime.current
      self.save
    end
  end

  def uti?
    self.uti_at.present? && self.uti_at > DateTime.current - 10.minutes
  end

  def strength
    self.energy -= 10
    self.save
    if self.energy.zero?
      self.uti
    end
    self.strength_skill += rand(1..5)
    self.save
  end

  def inteligence
    self.energy -= 10
    self.save
    if self.energy.zero?
      self.uti
    end
    self.inteligence_skill += rand(1..5)
    self.save
  end

  def speed
    self.energy -= 10
    self.save
    if self.energy.zero?
      self.uti
    end
    self.speed_skill += rand(1..5)
    self.save
  end

  private

  def set_nft
    self.nft = Time.now.to_i.to_s
  end

  def set_inventory
    @inventory = Inventory.new
    @inventory.pingochi_id = self.id
    @inventory.save
  end

  def set_gender
    self.gender = %w(male female).sample
  end
end


# acoes que envolvem dois pingochis o seu e o de um amigo deve usar o current_user.pingochi e o @pingochis
# se eu estiver na pagina de show não mostrar botao na pagina de show para acoes que envolvam o pingochi do amigo
# pingochi que bateu = current_user.pingochi o que apanhou é o @pingochi
# açoes que envolvam apenas o seu pingochi nao precisa do current_user porque você vai estra na sua pagina de show
# na mensagem do tapa quero falar "@pingochi bitch'slapped you!"
