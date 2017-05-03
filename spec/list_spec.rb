require('spec_helper')

describe(List) do
  describe('#name') do
    it ('tells you its name') do
      list1 = List.new({:name => 'Epicodus stuff', :id => nil})
      expect(list1.name).to(eq('Epicodus stuff'))
    end
  end

  describe('#id') do
    it ('returns the list id') do
      list1 = List.new({:name => 'Epicodus stuff', :id => 12})
      expect(list1.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('starts off with no lists') do
      expect(List.all).to(eq([]))
    end
  end

  describe ('#save') do
    it('saves each list in the database') do
      list1 = List.new({:name => 'Epicodus stuff', :id => nil})
      list1.save
      expect(List.all).to(eq([list1]))
    end
  end

  describe('#==') do
    it('is the same list if it has the same name') do
      list1 = List.new({:name => 'Epicodus stuff', :id => nil})
      list2 = List.new({:name => 'Epicodus stuff', :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe('.find') do
    it('returns a list by ID') do
      list1 = List.new({:name => 'Epicodus stuff', :id => nil})
      list1.save
      list2 = List.new({:name => 'Epicodus stuff', :id => nil})
      list2.save
      expect(List.find(list1.id)).to(eq(list1))
    end
  end

  describe('#tasks') do
    it('returns all tasks for selected list') do
      test_list1 = List.new({:name => "Epicodus stuff", :id => nil})
      test_list1.save()
      test_task1 = Task.new({:description => "Learn SQL", :list_id => test_list1.id(), :due_date => '2017-01-01'})
      test_task1.save()
      test_task2 = Task.new({:description => "Review Ruby", :list_id => test_list1.id(), :due_date => '2017-02-02'})
      test_task2.save()
      expect(test_list1.tasks).to(eq([test_task1,test_task2]))
    end
  end

  describe('#update') do
    it("lets you update lists in the database") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save
      list.update({:name => "Homework stuff"})
      expect(list.name).to eq "Homework stuff"
    end
  end

  describe("#delete") do
      it("lets you delete a list from the database") do
        list = List.new({:name => "Epicodus stuff", :id => nil})
        list.save
        list2 = List.new({:name => "House stuff", :id => nil})
        list2.save
        list.delete
        expect(List.all).to(eq([list2]))
      end

      it("deletes a list's tasks") do
        list = List.new({:name => "Epicodus stuff", :id => nil})
        list.save
        task = Task.new({:description => "learn SQL", :list_id => list.id, :due_date => '2017-05-01'})
        task.save
        task2 = Task.new({:description => "Review Ruby", :list_id => list.id, :due_date => '2017-05-03'})
        task2.save
        list.delete
        expect(Task.all).to(eq([]))
      end
    end
end
