class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
  def index

    if params[:search]
      searches = Search.where("reference_num || reference_num LIKE ?", "%#{params[:search]}%").order("search_start_date DESC")
      if searches.count > 0
        @searches = searches
      else
        client = Client.where("name || name LIKE ?", "%#{params[:search]}%").first
        if client
          @searches = Search.where(:client_id => client.id).order("search_start_date DESC")
        else
          searches = Search.where("status || status LIKE ?", "%#{params[:search]}%").order("search_start_date DESC")
          if searches
            @searches = searches
          else
            @searches = []
          end
        end
      end
    else
      @searches = Search.order("search_start_date DESC").all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = Search.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/1/edit
  def edit
    @search = Search.find(params[:id])
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(params[:search])

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render json: @search, status: :created, location: @search }
      else
        format.html { render action: "new" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    Search.import(params[:file])
    redirect_to searches_url, notice: "Products imported."
  end

  # PUT /searches/1
  # PUT /searches/1.json
  def update
    @search = Search.find(params[:id])

    respond_to do |format|
      if @search.update_attributes(params[:search])
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end
end
