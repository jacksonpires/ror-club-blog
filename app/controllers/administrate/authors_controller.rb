# frozen_string_literal: true
class Administrate::AuthorsController < AdministrateController
  before_action :set_author, only: [ :show, :edit, :update, :destroy ]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def show
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html {
          redirect_to(administrate_author_url(@author), notice: "Um autor foi criado com sucesso!")
        }

        format.json { render(:show, status: :created, location: @author) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @author.errors, status: :unprocessable_entity) }
      end
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html {
          redirect_to(administrate_author_url(@author), notice: "Um autor foi atualizado com sucesso!")
       }
        format.json { render(:show, status: :ok, location: @author) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @author.errors, status: :unprocessable_entity) }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html do
        if @author.posts.count > 0
          redirect_to(administrate_authors_path, alert: "Não foi possível apagar o autor!")
        else
          @author.destroy
          redirect_to(administrate_authors_path, notice: "Um autor foi apagado com sucesso!")
        end
      end
      format.json { head(:no_content) }
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(
      :name,
      :description,
      :facebook_profile_url,
      :instagram_profile_url,
      :twitter_profile_url,
      :linkedin_profile_url,
      :youtube_profile_url,
    )
  end
end
