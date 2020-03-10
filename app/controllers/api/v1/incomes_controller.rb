class Api::V1::IncomesController < ApplicationController
    before_action :find_income, only: [:update]

    def index
        @incomes = Income.all
        render json: @incomes
    end

    def update
        @income.update(income_params)
        render json: @income
    end

    def create
        @income = Income.create(income_params)
        if @income.save
            render json: {
                income: IncomeSerializer.new(@income)
            }, status: :created
        else
            render json: {
                error: @income.errors
            }, status: :not_acceptable
        end
    end

    private

    def income_params
        params.require(:income).permit(:email, :acc_inc, :tours)
    end

    def find_income
        @income = Income.find(params[:id])
    end
end
