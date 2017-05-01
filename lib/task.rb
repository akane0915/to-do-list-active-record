class Task
  attr_reader(:description, :list_id, :due_date)

  def initialize(attributes)
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @due_date = attributes.fetch(:due_date)
  end

  def ==(another_task)
    self.description.==(another_task.description)
  end

  def self.all
    returned_tasks = DB.exec('SELECT * FROM tasks ORDER BY due_date;')
    tasks = []
    returned_tasks.each do |task|
      list_id = task.fetch('list_id').to_i
      description = task.fetch('description')
      due_date = task.fetch('due_date')
      tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
    end
    tasks
  end

  def save
    DB.exec("INSERT INTO tasks (description, list_id, due_date) VALUES ('#{@description}', #{@list_id}, '#{@due_date}');")
  end

end
