require('spec_helper')

describe(Task) do

  describe('.not_done')do
    it 'returns the not done tasks' do
      task1 = Task.create({:description => 'gotta do it', :done => false})
      task2 = Task.create({:description => 'gotta do it too', :done => false})
      task3 = Task.create({:description => 'done task', :done => true})
      expect(Task.not_done).to eq [task1, task2]
    end
  end

  describe('#list') do
    it 'return the list that this task belongs to' do
      test_list = List.create({:name => 'list'})
      test_task = Task.create({:description => 'gotta do it', :list_id => test_list.id})
      expect(test_task.list).to eq test_list
    end
  end
end
