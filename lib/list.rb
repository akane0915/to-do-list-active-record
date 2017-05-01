class List
  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    lists = []
    returned_lists = DB.exec('SELECT * FROM lists;')
    returned_lists.each do |list|
      name = list.fetch('name')
      id = list.fetch('id')
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

end
