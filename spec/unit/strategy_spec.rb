require 'spec_helper'

describe ChefBackup::Strategy do
  before do
    # Fake test strategies
    class ChefBackup::Strategy::TestBackup; def initialize(_p = {}) end; end
    class ChefBackup::Strategy::TestRestore; def initialize(_p = {}) end; end
  end

  after do
    described_class.send(:remove_const, :TestBackup)
    described_class.send(:remove_const, :TestRestore)
  end

  describe '.backup' do
    it 'it returns a backup strategy' do
      expect(described_class.backup('test'))
        .to be_an(ChefBackup::Strategy::TestBackup)
    end
  end

  describe '.restore' do
    it 'it returns a restore strategy' do
      expect(described_class.restore('test'))
        .to be_an(ChefBackup::Strategy::TestRestore)
    end
  end
end
