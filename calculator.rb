require_relative 'sum'
require_relative 'difference'
require_relative 'multiplication'
require_relative 'division'
require_relative 'inverse'
require_relative 'square'
require_relative 'square_Root'

class Calculator
	
	OPERATIONS = {
		sum: '+',
		difference: '-',
		inverse: 'INV',
		square: 'SQ',
		square_root: 'SQRT',
		multiplication: '*',
		division: '/'
	}
	
	def add_operand(operand)

		if @current_operation

			@current_operation.add_operand(operand)

		else
			@operand_temp = operand

		end

	end

	def set_operation(operator)

		operation_class = case operator

			when OPERATIONS[:sum] then Sum
			when OPERATIONS[:difference] then Difference
			when OPERATIONS[:multiplication] then Multiplication
			when OPERATIONS[:division] then Division
			when OPERATIONS[:inverse] then Inverse
			when OPERATIONS[:square] then Square
			when OPERATIONS[:square_root] then SquareRoot
			
		end

		@current_operation = operation_class.new(@operand_temp)
		@operand_temp=''
		
	end

	def execute

		result = @current_operation.execute
		clear
		result

	rescue ZeroDivisionError
		'Error'
	end

	def clear
		@current_operation = nil
		@operand_temp = nil
		
	end
end