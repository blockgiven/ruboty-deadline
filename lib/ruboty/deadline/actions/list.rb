module Ruboty
  module Deadline
    module Actions
      class List < Ruboty::Actions::Base
        def call
          message.reply(::Ruboty::Deadline.deadline_messages(message.robot).join($/))
        end
      end
    end
  end
end
