module Ruboty
  module Deadline
    module Actions
      class Create < Ruboty::Actions::Base
        def call
          ::Ruboty::Deadline.deadlines(message.robot)[task] = deadline.beginning_of_day
          message.reply(::Ruboty::Deadline.deadline_message(task, deadline))
        end

        private

        def task
          message[:task]
        end

        def deadline
          Tokiyomi.parse(message[:deadline])
        rescue
          Time.parse(message[:deadline])
        end
      end
    end
  end
end
