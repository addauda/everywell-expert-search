class MembersController < ApplicationController
  include ExceptionHandler

  # GET /members
  def index
    @members = Member.all
  end

  # GET /members/:id
  def show
    @member = Member.find(member_params[:id])
  end

  # POST /members
  def create
    @member = Member.create(member_params)

    # start async jobs to retrieve profile meta
    SyncProfileJob.perform_later(@member)

    render status: :created
  end

  def member_params
    params.permit(:id, :name, :website)
  end
end
