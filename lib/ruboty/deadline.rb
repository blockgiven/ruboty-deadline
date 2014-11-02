require "active_support"
require "active_support/core_ext"
require "tokiyomi"
require "ruboty/deadline/version"
require "ruboty/handlers/deadline"

module Ruboty
  module Deadline
    NAMESPACE = 'deadline'

    module_function

    def deadlines(robot)
      robot.brain.data[NAMESPACE] ||= {}
    end

    def deadline_messages(robot)
      now = Time.now
      deadlines(robot).map {|task, deadline|
        deadline_message(task, deadline, now)
      }
    end

    def deadline_message(task, deadline, now = Time.now)
      remains = ((deadline.beginning_of_day - now.beginning_of_day) / 1.day).to_i
      case remains <=> 0
      when 0
        "―――今日は#{task}の日―――"
      when 1
        "―――#{task}まで残り#{remains}日―――"
      when -1
        "―――#{task}から#{-remains}日―――"
      end
    end
  end
end
