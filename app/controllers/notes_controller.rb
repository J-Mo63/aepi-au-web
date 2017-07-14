class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to contact_path(@note.contact_id)
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to contact_path(@note.contact_id)
    else
      render :edit
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    contact = @note.contact
    @note.destroy
    redirect_to contact_path(contact.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:body, :user_id, :contact_id)
    end
end
