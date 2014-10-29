module Ruboty
  module Deadline
    module Actions
      class Destroy < Ruboty::Actions::Base
        def call
          if deadline = ::Ruboty::Deadline.deadlines(message.robot)[task]
            ::Ruboty::Deadline.deadlines(message.robot).delete(task)
            message.reply(::Ruboty::Deadline.deadline_message(task, deadline))
          end
        end

        private

        def task
          message[:task]
        end
      end
    end
  end
end
