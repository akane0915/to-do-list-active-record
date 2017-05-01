require("rspec")
require("pg")
require("list")

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

describe(List) do
  describe('#name') do
    it ('tells you its name') do
      list = List.new({:name => 'Epicodus stuff', :id => nil})
      expect(list.name).to(eq('Epicodus stuff'))
    end
  end

  describe('#id') do
    it ('returns the list id') do
      list = List.new({:name => 'Epicodus stuff', :id => 12})
      expect(list.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it('starts off with no lists') do
      expect(List.all).to(eq([]))
    end
  end

  describe("#==") do
    it('is the same list if it has the same name') do
      list1 = List.new({:name => 'Epicodus stuff', :id => nil})
      list2 = List.new({:name => 'Epicodus stuff', :id => nil})
      expect(list1).to(eq(list2))
    end
  end




end
