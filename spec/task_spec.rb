require("rspec")
require("pg")
require("task")

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) do
  describe("#==") do
    it('is the same task if it has the same description') do
      task1 = Task.new({:description => "learn SQL"})
      task2 = Task.new({:description => "learn SQL"})
      expect(task1.==(task2)).to(eq(true))
    end
  end

  describe(".all") do
    it('returns an array of all tasks; it is empty to start') do
      expect(Task.all).to(eq([]))
    end
  end

  describe("#save") do
    it('adds a task to the array') do
      task1 = Task.new({:description => "learn SQL"})
      task1.save
      expect(Task.all).to(eq([task1]))
    end
  end


end
