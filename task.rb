class Task
    attr_accessor :id, :title, :description, :completed
  
    def initialize(id, title, description, completed = false)
      @id = id
      @title = title
      @description = description
      @completed = completed
    end
  
    def to_h
      {
        id: @id,
        title: @title,
        description: @description,
        completed: @completed
      }
    end
  end
  