class LinksController < ApplicationController
  # before_action :set_link, only: [:show, :edit, :update, :destroy, :shortered]
  before_action :find_url, only: [:show, :shortened]
  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @url.update_attribute('access_counter' , (@url.access_counter.nil? ? 0 : @url.access_counter) + 1)
    redirect_to @url.info
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  def shorter_server
    link = params['link'].gsub("\"", '')
    result = BITLY.shorten(link)

    render :json => result

  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    @link.sanitize

    if @link.new_url?
      if @link.save
        redirect_to shortened_path(@link.shorted_link)
      else
        render 'index'
      end
    else
      redirect_to shortened_path(@link.shorted_link)
    end
    # @link.short_link

    # respond_to do |format|
    #   if @link.save
    #     format.html { redirect_to @link, notice: 'Link was successfully created.' }
    #     format.json { render :show, status: :created, location: @link }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @link.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shortened
    @url = Link.find_by_shorted_link(params[:shorted_link])
    host = request.host_with_port
    @original_url = @url.info
    @short_url = host + '/' + @url.shorted_link

    redirect_to links_path
  end

  def fetch_originla_url
    fetch_url = Link.find_by_shoted_link(params[:shorted_link])
    redirect_to fetch_url.info
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    def find_url
      if params[:id]
        @url = Link.find(params[:id])
      else
        @url = Link.find_by_shorted_link(params[:shorted_link])
      end 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:initial_link, :shorted_link, :info)
    end
end
