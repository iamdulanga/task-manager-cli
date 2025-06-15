# task_manager.rb

require 'json'
require_relative 'task'

class TaskManager
  DATA_FILE = 'tasks.json'

  def initialize
    @tasks = load_tasks
  end

  def run
    loop do
      puts "\n--- Task Manager ---"
      puts "1. List tasks"
      puts "2. Add task"
      puts "3. Update task"
      puts "4. Delete task"
      puts "5. Toggle Complete"
      puts "6. Exit"
      print "Choose an option: "
      input = gets.chomp

      case input
      when '1' then list_tasks
      when '2' then add_task
      when '3' then update_task
      when '4' then delete_task
      when '5' then toggle_task
      when '6'
        save_tasks
        puts "Goodbye!"
        break
      else
        puts "Invalid option. Try again."
      end
    end
  end

  private

  def load_tasks
    return [] unless File.exist?(DATA_FILE)

    data = JSON.parse(File.read(DATA_FILE), symbolize_names: true)
    data.map { |t| Task.new(t[:id], t[:title], t[:description], t[:completed]) }
  rescue
    puts "Failed to load tasks. Starting fresh."
    []
  end

  def save_tasks
    File.write(DATA_FILE, JSON.pretty_generate(@tasks.map(&:to_h)))
  end

  def list_tasks
    if @tasks.empty?
      puts "No tasks available."
    else
      puts "\n--- Task List ---"
      @tasks.each do |task|
        status = task.completed ? '[✔]' : '[ ]'
        puts "#{task.id}. #{status} #{task.title} - #{task.description}"
      end
    end
  end

  def next_id
    @tasks.empty? ? 1 : @tasks.map(&:id).max + 1
  end

  def add_task
    print "Enter task title: "
    title = gets.chomp
    print "Enter task description: "
    desc = gets.chomp
    task = Task.new(next_id, title, desc)
    @tasks << task
    save_tasks
    puts "Task added."
  end

  def update_task
    print "Enter task ID to update: "
    id = gets.to_i
    task = @tasks.find { |t| t.id == id }
    if task
      print "New title (leave blank to keep '#{task.title}'): "
      title = gets.chomp
      print "New description (leave blank to keep '#{task.description}'): "
      desc = gets.chomp
      task.title = title unless title.empty?
      task.description = desc unless desc.empty?
      save_tasks
      puts "Task updated."
    else
      puts "Task not found."
    end
  end

  def delete_task
    print "Enter task ID to delete: "
    id = gets.to_i
    before = @tasks.size
    @tasks.reject! { |t| t.id == id }
    if @tasks.size < before
      save_tasks
      puts "Task deleted."
    else
      puts "Task not found."
    end
  end

  def toggle_task
    print "Enter task ID to toggle completion: "
    id = gets.to_i
    task = @tasks.find { |t| t.id == id }
    if task
      task.completed = !task.completed
      save_tasks
      puts "Task status updated."
    else
      puts "Task not found."
    end
  end
end

# Start the app
TaskManager.new.run
