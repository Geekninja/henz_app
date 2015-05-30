class SuppliersController < ApplicationController

	def index
	end

	def new
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def supplier_params
		params.require(:supplier).permit()
	end

	def set_supplier
	end

	def set_suppliers
	end

end