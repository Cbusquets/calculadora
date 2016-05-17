require_relative 'binary_operation'

class Sum < BinaryOperation

	def execute

	@result = @operand_1 + @operand_2
	
	end
	
end