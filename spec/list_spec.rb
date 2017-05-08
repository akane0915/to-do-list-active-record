require('spec_helper')

describe(List) do

  describe('#tasks') do
    it('returns all tasks for selected list') do
      test_list1 = List.create({:name => "Epicodus stuff"})
      test_task1 = Task.create({:description => "Learn SQL", :list_id => test_list1.id})
      test_task2 = Task.create({:description => "Review Ruby", :list_id => test_list1.id})
      expect(test_list1.tasks).to(eq([test_task1,test_task2]))
    end
  end



end
