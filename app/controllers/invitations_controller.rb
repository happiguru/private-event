class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[show edit update destroy]

  # GET /invitations
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/1
  def show
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to @event
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # GET /invitations/1/edit
  def edit; end

  # POST /invitations
  def create
    @invitation = Invitation.new(invitation_params)

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to @invitation, notice: 'Invitation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /invitations/1
  def update
    respond_to do |format|
      if @invitation.update(invitation_params)
        format.html { redirect_to @invitation, notice: 'Invitation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /invitations/1
  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to invitations_url, notice: 'Invitation was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invitation
    @invitation = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invitation_params
    params.require(:invitation).permit(:accepted)
  end
end
