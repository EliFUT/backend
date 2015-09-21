class Player < ActiveRecord::Base
  GOALKEEPER_POSITION = %w(GK)
  DEFENDER_POSITIONS = %w(RB RWB CB LB LWB)
  MIDFIELDER_POSITIONS = %w(RM CDM CM CAM LM)
  ATTACKER_POSITIONS = %w(RW CF ST LW)
  POSITIONS = GOALKEEPER_POSITION + DEFENDER_POSITIONS + MIDFIELDER_POSITIONS + ATTACKER_POSITIONS

  belongs_to :nation
  belongs_to :league
  belongs_to :club

  def defender?
    DEFENDER_POSITIONS.include?(position)
  end

  def goalkeeper?
    GOALKEEPER_POSITION.include?(position)
  end

  def midfielder?
    MIDFIELDER_POSITIONS.include?(position)
  end

  def attacker?
    ATTACKER_POSITIONS.include?(position)
  end

  def to_s
    "#<Player #{name} base_id:#{base_id}>"
  end

  def self.by_position
    clause = "CASE"
    POSITIONS.each_with_index do |p, i|
      clause << " WHEN position = '#{p}' THEN #{i}"
    end
    clause << " END"

    order(clause)
  end
end
