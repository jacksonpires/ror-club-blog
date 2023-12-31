# frozen_string_literal: true
class Administrate::PostsController < AdministrateController
  before_action :set_post, only: [ :show, :edit, :update, :destroy, :destroy_cover_image ]
  before_action :set_categories, only: [:show, :edit, :new]
  before_action :set_authors, only: [:show, :edit, :new]

  # GET /posts or /posts.json
  def index
    @posts = Post.includes(:category).all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.cover_image.attach(post_params[:cover_image])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(administrate_post_url(@post), notice: "Um artigo foi criado com sucesso!") }
        format.json { render(:show, status: :created, location: @post) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @post.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to(administrate_post_url(@post), notice: "Um artigo foi atualizado com sucesso!") }
        format.json { render(:show, status: :ok, location: @post) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @post.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(administrate_posts_path, notice: "Um artigo foi apagado com sucesso!") }
      format.json { head(:no_content) }
    end
  end

  def destroy_cover_image
    @post.cover_image.purge

    respond_to do |format|
      format.turbo_stream { render(turbo_stream: turbo_stream.remove(@post)) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(
        :title,
        :body,
        :cover_image,
        :category_id,
        :author_id,
      )
    end

    def set_categories
      @categories = Category.all
    end

    def set_authors
      @authors = Author.all.order(:name)
    end
end
