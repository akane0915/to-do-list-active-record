require('spec_helper')

describe(Task) do
  describe('.all') do
    it('returns an array of all tasks; it is empty to start') do
      expect(Task.all).to(eq([]))
    end
  end


  describe('#description') do
    it('returns the description of the task') do
      task1 = Task.new({:description => 'learn SQL', :list_id => 1})
      expect(task1.description).to(eq('learn SQL'))
    end
  end

  describe('#list_id')do
    it('returns the list ID associated with a task')do
      task1 = Task.new({:description => 'learn SQL', :list_id => 1})
      expect(task1.list_id).to(eq(1))
    end
  end

  describe('#==') do
    it('is the same task if it has the same description') do
      task1 = Task.new({:description => 'learn SQL', :list_id => 1})
      task2 = Task.new({:description => 'learn SQL', :list_id => 1})
      expect(task1.==(task2)).to(eq(true))
    end
  end

  describe('#save') do
    it('adds a task to the array') do
      task1 = Task.new({:description => 'learn SQL', :list_id => 1})
      task1.save
      expect(Task.all).to(eq([task1]))
    end
  end

end
