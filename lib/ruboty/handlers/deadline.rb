require "ruboty/deadline/actions/list"
require "ruboty/deadline/actions/create"
require "ruboty/deadline/actions/destroy"

module Ruboty
  module Handlers
    class Deadline < Base
      on /〆$/,                            name: 'list',    description: 'list 〆'
      on /rm 〆 (?<task>.*)/,              name: 'destroy', description: 'rm 〆'
      on /〆 (?<task>.*) (?<deadline>.*)/, name: 'create',  description: 'add 〆'

      def list(message)
        Ruboty::Deadline::Actions::List.new(message).call
      end

      def create(message)
        Ruboty::Deadline::Actions::Create.new(message).call
      end

      def destroy(message)
        Ruboty::Deadline::Actions::Destroy.new(message).call
      end
    end
  end
end
