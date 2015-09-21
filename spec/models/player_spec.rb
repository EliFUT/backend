require 'rails_helper'

RSpec.describe Player, :type => :model do
  describe 'positions' do
    it 'defender' do
      expect(build(:player, position: 'CB')).to be_defender
      expect(build(:player, position: 'CB')).to_not be_midfielder
      expect(build(:player, position: 'CB')).to_not be_attacker
      expect(build(:player, position: 'CB')).to_not be_goalkeeper

      expect(build(:player, position: 'RB')).to be_defender
      expect(build(:player, position: 'RB')).to_not be_midfielder
      expect(build(:player, position: 'RB')).to_not be_attacker
      expect(build(:player, position: 'RB')).to_not be_goalkeeper

      expect(build(:player, position: 'LB')).to be_defender
      expect(build(:player, position: 'LB')).to_not be_midfielder
      expect(build(:player, position: 'LB')).to_not be_attacker
      expect(build(:player, position: 'LB')).to_not be_goalkeeper

      expect(build(:player, position: 'RWB')).to be_defender
      expect(build(:player, position: 'RWB')).to_not be_midfielder
      expect(build(:player, position: 'RWB')).to_not be_attacker
      expect(build(:player, position: 'RWB')).to_not be_goalkeeper

      expect(build(:player, position: 'LWB')).to be_defender
      expect(build(:player, position: 'LWB')).to_not be_midfielder
      expect(build(:player, position: 'LWB')).to_not be_attacker
      expect(build(:player, position: 'LWB')).to_not be_goalkeeper
    end

    it 'midfielder' do
      expect(build(:player, position: 'CM')).to be_midfielder
      expect(build(:player, position: 'CM')).to_not be_defender
      expect(build(:player, position: 'CM')).to_not be_attacker
      expect(build(:player, position: 'CM')).to_not be_goalkeeper

      expect(build(:player, position: 'CDM')).to be_midfielder
      expect(build(:player, position: 'CDM')).to_not be_defender
      expect(build(:player, position: 'CDM')).to_not be_attacker
      expect(build(:player, position: 'CDM')).to_not be_goalkeeper

      expect(build(:player, position: 'CAM')).to be_midfielder
      expect(build(:player, position: 'CAM')).to_not be_defender
      expect(build(:player, position: 'CAM')).to_not be_attacker
      expect(build(:player, position: 'CAM')).to_not be_goalkeeper

      expect(build(:player, position: 'LM')).to be_midfielder
      expect(build(:player, position: 'LM')).to_not be_defender
      expect(build(:player, position: 'LM')).to_not be_attacker
      expect(build(:player, position: 'LM')).to_not be_goalkeeper

      expect(build(:player, position: 'RM')).to be_midfielder
      expect(build(:player, position: 'RM')).to_not be_defender
      expect(build(:player, position: 'RM')).to_not be_attacker
      expect(build(:player, position: 'RM')).to_not be_goalkeeper
    end

    it 'attacker' do
      expect(build(:player, position: 'ST')).to be_attacker
      expect(build(:player, position: 'ST')).to_not be_midfielder
      expect(build(:player, position: 'ST')).to_not be_defender
      expect(build(:player, position: 'ST')).to_not be_goalkeeper

      expect(build(:player, position: 'CF')).to be_attacker
      expect(build(:player, position: 'CF')).to_not be_midfielder
      expect(build(:player, position: 'CF')).to_not be_defender
      expect(build(:player, position: 'CF')).to_not be_goalkeeper

      expect(build(:player, position: 'LW')).to be_attacker
      expect(build(:player, position: 'LW')).to_not be_midfielder
      expect(build(:player, position: 'LW')).to_not be_defender
      expect(build(:player, position: 'LW')).to_not be_goalkeeper

      expect(build(:player, position: 'RW')).to be_attacker
      expect(build(:player, position: 'RW')).to_not be_midfielder
      expect(build(:player, position: 'RW')).to_not be_defender
      expect(build(:player, position: 'RW')).to_not be_goalkeeper
    end

    it 'goalkeeper' do
      expect(build(:player, position: 'GK')).to be_goalkeeper
      expect(build(:player, position: 'GK')).to_not be_defender
      expect(build(:player, position: 'GK')).to_not be_midfielder
      expect(build(:player, position: 'GK')).to_not be_attacker
    end
  end

  describe 'default scope' do
    it 'should be ordered by position' do
      st = create(:player, position: 'ST')
      cm = create(:player, position: 'CM')
      cb = create(:player, position: 'CB')
      gk = create(:player, position: 'GK')

      expect(Player.by_position).to eq([gk, cb, cm, st])
    end
  end
end
