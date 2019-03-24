# class BaseOperation
#   attr_reader :exceptions, :text_errors, :state
#
#   def initialize
#     @exceptions = []
#     @text_errors = []
#     @state = false
#   end
#
#   # => массив строк? описывающих ошибки
#   def errors
#     res = @exceptions.map(&:message)
#     res + @text_errors
#   end
#
#   def successful?
#     !!@state
#   end
#
#   protected
#
#   def add_exception(e)
#     @exceptions << e
#   end
#
#   def add_text_error(e)
#     @text_errors << e
#   end
#
#   def set_state(new_state)
#     @state = new_state
#   end
#
#   def merge(other_result)
#     @state &&= other_result.state
#     @exceptions += other_result.exceptions
#     @text_errors += other_result.text_errors
#   end
# end
